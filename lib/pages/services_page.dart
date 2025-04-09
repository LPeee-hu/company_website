// lib/pages/services_page.dart
import 'package:flutter/material.dart';
import '../widgets/page_header.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  // Előre definiált konstans színek
  static const Color primaryTransparent = Color(0x33007BFF); // 20% átlátszó kék
  static const Color shadowColor = Color(0x14000000); // 8% átlátszó fekete

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Szolgáltatásaink',
              subtitle:
                  'Minőségi fejlesztés, amely segíti vállalkozását a digitális növekedésben',
              backgroundImage: 'assets/images/services_header.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introduction
                  Text(
                    'Hogyan segítünk?',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Csapatunk Flutter technológiával fejleszt modern, cross-platform alkalmazásokat, '
                    'amelyek gyönyörűen néznek ki és kiválóan működnek minden platformon. '
                    'A legújabb technológiákat és módszereket alkalmazzuk, hogy hatékony és fenntartható megoldásokat nyújtsunk.',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 48),

                  // Services
                  ...List.generate(
                    _services.length,
                    (index) => _ServiceItem(
                      service: _services[index],
                      isEven: index % 2 == 0,
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Process
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Fejlesztési folyamatunk',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Az ötlettől a megvalósításig követjük a modern fejlesztési gyakorlatokat',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),

                        // Process steps
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isMobile = constraints.maxWidth < 600;
                            return Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              alignment: WrapAlignment.center,
                              children: [
                                for (int i = 0; i < _processSteps.length; i++)
                                  _ProcessStep(
                                    icon: _processSteps[i].icon,
                                    title: _processSteps[i].title,
                                    description: _processSteps[i].description,
                                    stepNumber: i + 1,
                                    color: colorScheme.primary,
                                    isLast: i == _processSteps.length - 1,
                                    width: isMobile
                                        ? constraints.maxWidth
                                        : (constraints.maxWidth / 3) - 32,
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Call to action
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          primaryTransparent, // Előre definiált konstans szín
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Szeretne többet megtudni szolgáltatásainkról?',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Vegye fel velünk a kapcsolatot, és beszéljük meg projektje igényeit!',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to contact page
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            backgroundColor: colorScheme.primary,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Kapcsolatfelvétel',
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
          ],
        ),
      ),
    );
  }
}

// Service model
class Service {
  final String title;
  final String description;
  final IconData icon;
  final List<String> features;

  const Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
  });
}

// Process step model
class ProcessStep {
  final String title;
  final String description;
  final IconData icon;

  const ProcessStep({
    required this.title,
    required this.description,
    required this.icon,
  });
}

// Sample data
final List<Service> _services = [
  const Service(
    title: 'Flutter Alkalmazásfejlesztés',
    description:
        'Natív sebességű és megjelenésű cross-platform alkalmazások iOS-re és Androidra',
    icon: Icons.phone_android,
    features: [
      'Egyetlen kódbázis több platformra',
      'Gyors fejlesztési ciklus',
      'Natív teljesítmény',
      'Gyönyörű felhasználói felület',
      'Anyagszerű dizájn és iOS stílus',
    ],
  ),
  const Service(
    title: 'Web Fejlesztés',
    description: 'Modern, reszponzív weboldalak és webalkalmazások',
    icon: Icons.web,
    features: [
      'Flutter Web technológia',
      'Reszponzív dizájn',
      'Böngészőkompatibilitás',
      'Optimalizált teljesítmény',
      'SEO-barát megoldások',
    ],
  ),
  const Service(
    title: 'UI/UX Tervezés',
    description: 'Felhasználóközpontú tervezés és tesztelés',
    icon: Icons.design_services,
    features: [
      'Wireframing és prototípus készítés',
      'Felhasználói élmény tervezés',
      'Vizuális dizájn',
      'Használhatósági tesztelés',
      'Iteratív fejlesztés',
    ],
  ),
];

// Process steps
final List<ProcessStep> _processSteps = [
  const ProcessStep(
    title: 'Konzultáció',
    description: 'Megismerjük az ön igényeit és céljait',
    icon: Icons.people,
  ),
  const ProcessStep(
    title: 'Tervezés',
    description: 'Részletes tervek és wireframe-ek készítése',
    icon: Icons.edit_document,
  ),
  const ProcessStep(
    title: 'Fejlesztés',
    description: 'Agilis módszertannal fejlesztjük az alkalmazást',
    icon: Icons.code,
  ),
  const ProcessStep(
    title: 'Tesztelés',
    description: 'Alapos tesztelés és minőségbiztosítás',
    icon: Icons.bug_report,
  ),
  const ProcessStep(
    title: 'Publikálás',
    description: 'Az alkalmazás megjelentetése az áruházakban',
    icon: Icons.rocket_launch,
  ),
  const ProcessStep(
    title: 'Támogatás',
    description: 'Folyamatos támogatás és karbantartás',
    icon: Icons.support_agent,
  ),
];

// Service item widget
class _ServiceItem extends StatelessWidget {
  final Service service;
  final bool isEven;

  const _ServiceItem({
    required this.service,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    if (!isDesktop) {
      // Mobile layout
      return Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and title
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ServicesPage
                        .primaryTransparent, // Használjuk az előre definiált színt
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service.icon,
                    size: 32,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    service.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              service.description,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),

            // Features
            ...service.features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(feature),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    }

    // Desktop layout
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isEven) ...[
            // Left side - Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 32),
                child: _buildServiceContent(theme, colorScheme),
              ),
            ),

            // Right side - Image
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                color: ServicesPage
                    .primaryTransparent, // Használjuk az előre definiált színt
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: ServicesPage
                        .shadowColor, // Használjuk az előre definiált színt
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  service.icon,
                  size: 100,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ] else ...[
            // Left side - Image
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                color: ServicesPage
                    .primaryTransparent, // Használjuk az előre definiált színt
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: ServicesPage
                        .shadowColor, // Használjuk az előre definiált színt
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  service.icon,
                  size: 100,
                  color: colorScheme.primary,
                ),
              ),
            ),

            // Right side - Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: _buildServiceContent(theme, colorScheme),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildServiceContent(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          service.description,
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        ...service.features.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 24,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

// Process step widget
class _ProcessStep extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final int stepNumber;
  final Color color;
  final bool isLast;
  final double width;

  // Előre definiált konstans színek a ProcessStep osztályhoz
  static const Color backgroundLight = Color(0x33007BFF); // 20% átlátszó kék

  const _ProcessStep({
    required this.title,
    required this.description,
    required this.icon,
    required this.stepNumber,
    required this.color,
    required this.width,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Icon with step number
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: backgroundLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: color,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      stepNumber.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            description,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
