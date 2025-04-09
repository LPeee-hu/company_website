// lib/widgets/animated_logo.dart
import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  final double size;
  final double opacity;
  final Duration animationDelay;

  const AnimatedLogo({
    super.key,
    required this.size,
    this.opacity = 1.0,
    this.animationDelay = Duration.zero,
  });

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.05,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: widget.opacity),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: widget.opacity, end: widget.opacity),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: widget.opacity, end: widget.opacity * 0.7),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: widget.opacity * 0.7, end: widget.opacity),
        weight: 15,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Késleltetett animáció indítása, biztonságosan
    if (widget.animationDelay != Duration.zero) {
      Future.delayed(widget.animationDelay, () {
        // Ellenőrizzük, hogy a widget még létezik-e, mielőtt használjuk a kontrollert
        if (!_isDisposed && mounted) {
          _controller.repeat(reverse: true);
        }
      });
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: Image.asset(
        'assets/images/logo.png', // A Flutter logó vagy a cég logója
        width: widget.size,
        height: widget.size,
        errorBuilder: (context, error, stackTrace) {
          // Fallback ha nincs kép
          return Icon(
            Icons.flutter_dash,
            size: widget.size,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
