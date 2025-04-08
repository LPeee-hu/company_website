import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widgets/animated_logo.dart';
import '../widgets/animated_card.dart' as card;
import '../widgets/wavy_section_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero section with parallax effect
            Container(
              height: screenSize.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary
                        .withValues(alpha: 179), // 0.7 * 255 = ~179
                    colorScheme.primaryContainer,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Animated background elements
                  ...List.generate(5, (index) {
                    return Positioned(
                      left: (index * 200) % screenSize.width,
                      top: (index * 100) % (screenSize.height * 0.6),
                      child: AnimatedLogo(
                        size: 150 + (index * 20),
                        opacity: 0.1,
                        animationDelay: Duration(seconds: index),
                      ),
                    );
                  }),

                  // Main content
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Logo animation
                          const AnimatedLogo(
                            size: 120,
                            opacity: 1.0,
                          ),
                          const SizedBox(height: 40),

                          // Company name with text animation
                          Text(
                            'Mobil Fejlesztő Cég',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),

                          // Animated text
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Cross-Platform Fejlesztés',
                                textStyle:
                                    theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Modern Technológiák',
                                textStyle:
                                    theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                              TypewriterAnimatedText(
                                'Egyedi Megoldások',
                                textStyle:
                                    theme.textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                                speed: const Duration(milliseconds: 100),
                              ),
                            ],
                            totalRepeatCount: 1,
                            displayFullTextOnTap: true,
                          ),
                          const SizedBox(height: 40),

                          // CTA Button
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to contact page or services
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: colorScheme.primary,
                            ),
                            child: const Text(
                              'Ismerje meg szolgáltatásainkat',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const WavySectionDivider(),

            // Value proposition section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Miért minket válasszon?',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Value propositions in a responsive grid
                  LayoutBuilder(builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 700;
                    return Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        card.AnimatedCard(
                          width: isMobile ? constraints.maxWidth : 300,
                          icon: Icons.speed,
                          title: 'Gyors fejlesztés',
                          description:
                              'Flutter technológiával gyorsabban jutunk el az ötlettől a kész alkalmazásig.',
                        ),
                        card.AnimatedCard(
                          width: isMobile ? constraints.maxWidth : 300,
                          icon: Icons.devices,
                          title: 'Cross-platform',
                          description:
                              'Egyetlen kódbázisból Android és iOS alkalmazást is fejlesztünk.',
                        ),
                        card.AnimatedCard(
                          width: isMobile ? constraints.maxWidth : 300,
                          icon: Icons.auto_awesome,
                          title: 'Modern UI',
                          description:
                              'Gyönyörű és reszponzív felhasználói felületeket tervezünk és valósítunk meg.',
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),

            const WavySectionDivider(reverse: true),

            // Call to action section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: colorScheme.primaryContainer
                  .withValues(alpha: 77), // 0.3 * 255 = ~77
              child: Column(
                children: [
                  Text(
                    'Készen áll a következő projektjére?',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Vegye fel a kapcsolatot velünk, és beszéljük meg az igényeit!',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to contact page
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Kapcsolat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
