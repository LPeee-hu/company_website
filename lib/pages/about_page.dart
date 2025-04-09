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
              subtitle: 'Ismerje meg csapatunkat és történetünket',
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
                                  Icons.corporate_fare,
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
                                  Icons.corporate_fare,
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
                          'Tapasztalt szakemberek, akik segítenek az ötletét valósággá váltani',
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
                              crossAxisCount = 3;
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
                            icon: Icons.lightbulb,
                            title: 'Innováció',
                            description:
                                'Folyamatosan keressük az új technológiákat és módszereket, hogy a legjobb megoldásokat nyújthassuk.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.handshake,
                            title: 'Partnerség',
                            description:
                                'Szoros együttműködésben dolgozunk ügyfeleinkkel, hogy megértsük igényeiket és céljaikat.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.verified,
                            title: 'Minőség',
                            description:
                                'Elkötelezettek vagyunk a legmagasabb minőségű szoftverek fejlesztése mellett.',
                            width: isMobile
                                ? constraints.maxWidth
                                : (constraints.maxWidth / 2) - 20,
                            color: colorScheme.primary,
                          ),
                          _ValueCard(
                            icon: Icons.timelapse,
                            title: 'Határidők betartása',
                            description:
                                'Projektkivitelezésünk során a pontosság és a megbízhatóság alapvető érték számunkra.',
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
                          'Dolgozzunk együtt a következő projektjén!',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Vegye fel velünk a kapcsolatot, és beszéljük meg, hogyan segíthetünk az ötletét valósággá váltani.',
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

  Widget _buildStoryText(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cégünk 2018-ban alakult azzal a céllal, hogy modern, cross-platform mobil alkalmazásokat fejlesszen, amelyek segítik a vállalkozásokat a digitális átalakulásban.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Az elmúlt években számos sikeres projektet valósítottunk meg különböző iparágakban, az egészségügytől a kiskereskedelmen át a pénzügyekig. A Flutter technológiára specializálódva segítünk ügyfeleinknek csökkenteni a fejlesztési időt és költségeket, miközben kiváló minőségű alkalmazásokat biztosítunk.',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Tapasztalt fejlesztőkből, UI/UX tervezőkből és projektmenedzserekből álló csapatunk szorosan együttműködik ügyfeleinkkel, hogy megértse egyedi igényeiket és céljaikat, és egyedi megoldásokat nyújtson, amelyek valódi üzleti értéket teremtenek.',
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

// Sample team members data
final List<TeamMember> _teamMembers = [
  const TeamMember(
    name: 'Kovács István',
    position: 'Ügyvezető igazgató',
    bio:
        'István több mint 15 éves tapasztalattal rendelkezik a szoftverfejlesztés területén. A Flutter korai bevezetőjeként segített számtalan vállalatnak a mobil stratégiájuk kialakításában.',
    imageUrl: 'assets/images/team/peti.jpg',
  ),
  const TeamMember(
    name: 'Nagy Anna',
    position: 'Vezető fejlesztő',
    bio:
        'Anna szakértő a Flutter és a cross-platform fejlesztés területén. Szenvedélye a tiszta, hatékony kód írása és az új technológiák feltárása.',
    imageUrl: 'assets/images/team/deni.jpg',
  ),
  const TeamMember(
    name: 'Szabó Péter',
    position: 'UI/UX tervező',
    bio:
        'Péter kreatív designer, aki gyönyörű és felhasználóbarát alkalmazásokat tervez. Munkája során ötvözi a felhasználói élményt a modern dizájn elvekkel.',
    imageUrl: 'assets/images/team/peter.jpg',
  ),
  const TeamMember(
    name: 'Varga Júlia',
    position: 'Projektmenedzser',
    bio:
        'Júlia biztosítja, hogy a projektek időben és a költségvetésen belül készüljenek el. Kiváló kommunikációs készségekkel rendelkezik és remekül kezeli a kihívásokat.',
    imageUrl: 'assets/images/team/julia.jpg',
  ),
  const TeamMember(
    name: 'Tóth Gábor',
    position: 'Backend fejlesztő',
    bio:
        'Gábor szakértő a skálázható backend rendszerek fejlesztésében. Szorosan együttműködik a Flutter csapattal a teljes stack megoldások kiépítésében.',
    imageUrl: 'assets/images/team/gabor.jpg',
  ),
  const TeamMember(
    name: 'Kiss Eszter',
    position: 'Minőségbiztosítási mérnök',
    bio:
        'Eszter felel az alkalmazások minőségéért, átfogó tesztelési stratégiákat dolgoz ki, és automatizált teszteket ír a hibák korai felderítésére.',
    imageUrl: 'assets/images/team/eszter.jpg',
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
