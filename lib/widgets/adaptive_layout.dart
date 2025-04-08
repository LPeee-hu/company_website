import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget Function(BuildContext) mobileLayout;
  final Widget Function(BuildContext) desktopLayout;
  final double breakpoint;

  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.desktopLayout,
    this.breakpoint = 800,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < breakpoint) {
          return mobileLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
