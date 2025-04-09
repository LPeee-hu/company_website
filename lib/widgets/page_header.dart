// lib/widgets/page_header.dart
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
                  Color.fromARGB(
                    179,
                    // ignore: deprecated_member_use
                    theme.colorScheme.primary.red,
                    // ignore: deprecated_member_use
                    theme.colorScheme.primary.green,
                    // ignore: deprecated_member_use
                    theme.colorScheme.primary.blue,
                  ), // 0.7 * 255 = ~179
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
              color: Color.fromARGB(26, 255, 255, 255), // 0.1 * 255 = ~26
            ),
          ),
          const Positioned(
            bottom: -30,
            left: 40,
            child: Icon(
              Icons.circle,
              size: 120,
              color: Color.fromARGB(26, 255, 255, 255), // 0.1 * 255 = ~26
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
                      color: const Color.fromARGB(
                          204, 255, 255, 255), // 0.8 * 255 = ~204
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
