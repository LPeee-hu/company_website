// lib/widgets/animated_card.dart
import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  final double width;
  final IconData icon;
  final String title;
  final String description;

  const AnimatedCard({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.colorScheme.primaryContainer
              : theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(
                _isHovered ? 38 : 20,
                0,
                0,
                0,
              ),
              blurRadius: _isHovered ? 15 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: _isHovered
                    ? theme.colorScheme.primary
                    : Color.fromARGB(
                        102,
                        // ignore: deprecated_member_use
                        theme.colorScheme.primaryContainer.red,
                        // ignore: deprecated_member_use
                        theme.colorScheme.primaryContainer.green,
                        // ignore: deprecated_member_use
                        theme.colorScheme.primaryContainer.blue,
                      ), // 0.4 * 255 = 102
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                widget.icon,
                size: 40,
                color: _isHovered ? Colors.white : theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: _isHovered
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.textTheme.titleLarge?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered
                    ? Color.fromARGB(
                        204,
                        // ignore: deprecated_member_use
                        theme.colorScheme.onPrimaryContainer.red,
                        // ignore: deprecated_member_use
                        theme.colorScheme.onPrimaryContainer.green,
                        // ignore: deprecated_member_use
                        theme.colorScheme.onPrimaryContainer.blue,
                      ) // 0.8 * 255 = 204
                    : theme.textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
