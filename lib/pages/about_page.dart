// lib/pages/about_page.dart
import 'package:flutter/material.dart';
import '../widgets/page_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Előre definiált, stabil színek
  static const Color primaryTransparent =
      Color(0x33007BFF); // ~20% átlátszó kék
  static const Color shadowColor = Color(0x14000000); // ~8% átlátszó fekete
  static const Color darkShadowColor =
      Color(0x26000000); // ~15% átlátszó fekete

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
              title: 'Rólunk',
              subtitle: 'Ismerje meg történetünket és értékeinket',
              backgroundImage: 'assets/images/about_header.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Our story section
                  Text(
                    'Történetünk',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop = constraints.maxWidth > 900;

                      if (isDesktop) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildStoryText(theme),
                            ),
                            const SizedBox(width: 40),
                            Container(
                              width: 400,
                              height: 300,
                              decoration: BoxDecoration(
                                // Előre definiált, stabil színt használunk
                                color: primaryTransparent,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.family_restroom,
                                  size: 100,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                color: primaryTransparent,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.family_restroom,
                                  size: 80,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            _buildStoryText(theme),
                          ],
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 60),

                  // Our team section
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Csapatunk',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'A családi alkalmazás mögött álló alkotópáros',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isMobile = constraints.maxWidth < 600;
                            final isTablet = constraints.maxWidth < 900 &&
                                constraints.maxWidth >= 600;

                            int crossAxisCount;
                            if (isMobile) {
                              crossAxisCount = 1;
                            } else if (isTablet) {
                              crossAxisCount = 2;
                            } else {
                              crossAxisCount = 2; // Csak 2 csapattag van
                            }

                            return Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              alignment: WrapAlignment.center,
                              children: List.generate(
                                _teamMembers.length,
                                (index) => _TeamMemberCard(
                                  name: _teamMembers[index].name,
                                  position: _teamMembers[index].position,
                                  bio: _teamMembers[index].bio,
                                  imageUrl: _teamMembers[index].imageUrl,
                                  width: isMobile
                                      ? constraints.maxWidth
                                      : (constraints.maxWidth /
                                              crossAxisCount) -
                                          24,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Our values section
                  Text(
                    'Értékeink',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 700;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          _ValueCard(
                            icon: Icons.family_restroom,
                            title: 'Családközpontúság',
                            description:
                                'Saját családi tapasztalataink alapján olyan megoldásokat fejlesztünk, amelyek valóban segítenek a mindennapokban.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.lightbulb,
                            title: 'Innováció',
                            description:
                                'A legújabb technológiákat alkalmazzuk, hogy modern és felhasználóbarát alkalmazásokat hozzunk létre.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.design_services,
                            title: 'Kreatív Design',
                            description:
                                'Hiszünk abban, hogy a jó dizájn nemcsak szép, hanem funkcionális is. Minden elemnek célja van.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.balance,
                            title: 'Üzleti Szemlélet',
                            description:
                                'Ötvözzük a fejlesztői kreativitást az üzleti precizitással, így valódi értéket teremtünk.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 60),

                  // Call to action
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: primaryTransparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Egyszerűsítse családi mindennapjait alkalmazásunkkal!',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Töltse le a családi feladatkezelő alkalmazásunkat, vagy vegye fel velünk a kapcsolatot egyedi igényeivel kapcsolatban.',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to download page
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
                                'Alkalmazás letöltése',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: () {
                                // Navigate to contact page
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                side: BorderSide(color: colorScheme.primary),
                              ),
                              child: Text(
                                'Kapcsolatfelvétel',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
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

  Widget _buildStoryText(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alkalmazásunk egy családi inspirációból született. Két gyermekünk nevelése és a háztartás irányítása közben szembesültünk azzal, milyen kihívást jelent a mindennapi feladatok hatékony szervezése.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Férj-feleség csapatként egyesítettük erősségeinket: Péter üzleti controller háttere és szoftverfejlesztési szenvedélye találkozott Daniella kreatív design szemléletével és gyártástervezési tapasztalatával. Így született meg a családi feladatkezelő alkalmazásunk, amely ötvözi a praktikus funkciókat és a felhasználóbarát dizájnt.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Amit saját családunknak fejlesztettünk, most szeretnénk megosztani másokkal is. Küldetésünk, hogy segítsünk a családoknak hatékonyabban szervezni mindennapjaikat, hogy több idő maradjon arra, ami igazán számít: a közösen töltött minőségi időre.',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

// Team member model
class TeamMember {
  final String name;
  final String position;
  final String bio;
  final String imageUrl;

  const TeamMember({
    required this.name,
    required this.position,
    required this.bio,
    required this.imageUrl,
  });
}

// Frissített csapattagok - csak ketten vannak
final List<TeamMember> _teamMembers = [
  const TeamMember(
    name: 'Péter',
    position: 'Társalapító & Technológiai Vezető',
    bio:
        'Péter üzleti controllerként kezdte karrierjét, ahol erős elemzői szemléletet és üzleti gondolkodást sajátított el. A szoftverfejlesztés iránti szenvedélye Python programozással indult, majd a cross-platform fejlesztés területén találta meg hivatását. A Flutter technológiára specializálódva egyesíti az üzleti precizitást és a fejlesztői kreativitást.',
    imageUrl: 'assets/images/team/peti.jpg',
  ),
  const TeamMember(
    name: 'Daniella',
    position: 'Társalapító & Kreatív Vezető',
    bio:
        'Daniella gyártástervezési háttérrel rendelkezik, ahol a hatékony folyamatok kialakítása és optimalizálása volt a feladata. Saját vállalkozásában design ékszereket tervezett és készített, így gyakorlati tapasztalatot szerzett a kreatív tervezés és a felhasználói élmény terén. Az alkalmazás vizuális arculatáért és felhasználói élményéért felel.',
    imageUrl: 'assets/images/team/deni.jpg',
  ),
];

// Team member card widget
class _TeamMemberCard extends StatefulWidget {
  final String name;
  final String position;
  final String bio;
  final String imageUrl;
  final double width;

  const _TeamMemberCard({
    required this.name,
    required this.position,
    required this.bio,
    required this.imageUrl,
    required this.width,
  });

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AboutPage.darkShadowColor
                  : AboutPage.shadowColor,
              blurRadius: _isHovered ? 15 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Member image
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AboutPage.primaryTransparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: colorScheme.primary,
                ),
              ),
            ),

            // Member info
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.position,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.bio,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),

                  // Social links
                  Row(
                    children: [
                      _SocialIconButton(
                        icon: Icons.email,
                        onPressed: () {},
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      _SocialIconButton(
                        icon: Icons.link,
                        onPressed: () {},
                        color: colorScheme.primary,
                      ),
                    ],
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

// Value card widget
class _ValueCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;
  final Color color;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
    required this.color,
  });

  @override
  State<_ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<_ValueCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Előre definiált színek a kártyához
    const primaryLight = Color(0x33007BFF); // ~20% átlátszó kék
    const primaryDark = Color(0xCC007BFF); // ~80% átlátszó kék

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _isHovered ? primaryLight : theme.cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AboutPage.darkShadowColor
                  : AboutPage.shadowColor,
              blurRadius: _isHovered ? 15 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered ? widget.color : primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: _isHovered ? Colors.white : widget.color,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: _isHovered ? primaryDark : null,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// Social icon button widget
class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const _SocialIconButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      color: color,
      splashRadius: 20,
    );
  }
}
