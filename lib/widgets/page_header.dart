import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? backgroundImage;
  final double height;

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
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primary
                      .withValues(alpha: 179), // 0.7 * 255 = ~179
                  BlendMode.srcOver,
                ),
              )
            : null,
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: -20,
            right: -20,
            child: Icon(
              Icons.circle,
              size: 100,
              color: Colors.white.withValues(alpha: 26), // 0.1 * 255 = ~26
            ),
          ),
          Positioned(
            bottom: -30,
            left: 40,
            child: Icon(
              Icons.circle,
              size: 120,
              color: Colors.white.withValues(alpha: 26), // 0.1 * 255 = ~26
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
                      color: Colors.white
                          .withValues(alpha: 204), // 0.8 * 255 = ~204
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
