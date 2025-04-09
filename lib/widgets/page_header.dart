// lib/widgets/page_header.dart
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? backgroundImage;
  final double height;

  // Előre definiált konstans színek
  static const Color overlayColor = Color(0xB3007BFF); // 70% átlátszó kék
  static const Color circleDecoration = Color(0x1AFFFFFF); // 10% átlátszó fehér
  static const Color subtitleColor = Color(0xCCFFFFFF); // 80% átlátszó fehér

  const PageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.backgroundImage,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  overlayColor, // Használjuk az előre definiált színt
                  BlendMode.srcOver,
                ),
              )
            : null,
      ),
      child: Stack(
        children: [
          // Decorative elements
          const Positioned(
            top: -20,
            right: -20,
            child: Icon(
              Icons.circle,
              size: 100,
              color: circleDecoration, // Használjuk az előre definiált színt
            ),
          ),
          const Positioned(
            bottom: -30,
            left: 40,
            child: Icon(
              Icons.circle,
              size: 120,
              color: circleDecoration, // Használjuk az előre definiált színt
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    subtitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color:
                          subtitleColor, // Használjuk az előre definiált színt
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
