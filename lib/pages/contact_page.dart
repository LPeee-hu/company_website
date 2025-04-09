// lib/pages/contact_page.dart
import 'package:flutter/material.dart';
import '../widgets/page_header.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  // Előre definiált konstans színek
  static const Color primaryLight = Color(0x26007BFF); // 15% átlátszó kék
  static const Color primaryMedium = Color(0x80007BFF); // 50% átlátszó kék
  static const Color disabledButtonBg = Color(0x80007BFF); // 50% átlátszó kék

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSubmitting = false;
          _isSubmitted = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageHeader(
              title: 'Kapcsolat',
              subtitle:
                  'Vegye fel velünk a kapcsolatot, és beszéljük meg projektjét',
              backgroundImage: 'assets/images/contact_header.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: isDesktop
                  ? _buildDesktopLayout(theme, colorScheme)
                  : _buildMobileLayout(theme, colorScheme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(ThemeData theme, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact form - Left side
        Expanded(
          flex: 3,
          child: _buildContactForm(theme, colorScheme),
        ),

        const SizedBox(width: 40),

        // Contact info - Right side
        Expanded(
          flex: 2,
          child: _buildContactInfo(theme, colorScheme),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact form
        _buildContactForm(theme, colorScheme),

        const SizedBox(height: 40),

        // Contact info
        _buildContactInfo(theme, colorScheme),
      ],
    );
  }

  Widget _buildContactForm(ThemeData theme, ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: _isSubmitted
            ? _buildSuccessMessage(theme, colorScheme)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Küldjön nekünk üzenetet',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Töltse ki az alábbi űrlapot, és kollégánk hamarosan felveszi Önnel a kapcsolatot.',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name field
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Név',
                            hintText: 'Adja meg a teljes nevét',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kérjük, adja meg a nevét';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Email field
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Adja meg az email címét',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kérjük, adja meg az email címét';
                            }
                            // Simple email validation
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Kérjük, adjon meg egy érvényes email címet';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Subject field
                        TextFormField(
                          controller: _subjectController,
                          decoration: const InputDecoration(
                            labelText: 'Tárgy',
                            hintText: 'Mi a megkeresés tárgya?',
                            prefixIcon: Icon(Icons.subject),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kérjük, adja meg az üzenet tárgyát';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Message field
                        TextFormField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            labelText: 'Üzenet',
                            hintText: 'Írja le részletesen, miben segíthetünk',
                            prefixIcon: Icon(Icons.message),
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kérjük, írja le az üzenetét';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Submit button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isSubmitting ? null : _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor:
                                  ContactPage.disabledButtonBg,
                            ),
                            child: _isSubmitting
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  )
                                : const Text(
                                    'Küldés',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
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

  Widget _buildSuccessMessage(ThemeData theme, ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 80,
            color: colorScheme.primary,
          ),
          const SizedBox(height: 24),
          Text(
            'Köszönjük!',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Üzenetét sikeresen elküldtük. Csapatunk hamarosan felveszi Önnel a kapcsolatot.',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _nameController.clear();
                _emailController.clear();
                _subjectController.clear();
                _messageController.clear();
                _isSubmitted = false;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Új üzenet küldése'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Elérhetőségeink',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),

        // Contact cards
        _ContactInfoCard(
          icon: Icons.location_on,
          title: 'Cím',
          content: '1234 Budapest, Minta utca 123.',
          color: colorScheme.primary,
        ),
        const SizedBox(height: 16),

        _ContactInfoCard(
          icon: Icons.phone,
          title: 'Telefon',
          content: '+36 1 234 5678',
          color: colorScheme.primary,
        ),
        const SizedBox(height: 16),

        _ContactInfoCard(
          icon: Icons.email,
          title: 'Email',
          content: 'info@mobilfejleszto.hu',
          color: colorScheme.primary,
        ),
        const SizedBox(height: 16),

        _ContactInfoCard(
          icon: Icons.access_time,
          title: 'Nyitvatartás',
          content: 'Hétfő - Péntek: 9:00 - 17:00',
          color: colorScheme.primary,
        ),

        const SizedBox(height: 40),

        // Social media
        Text(
          'Kövessen minket',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            _SocialButton(
              icon: Icons.facebook,
              onPressed: () {},
              color: colorScheme.primary,
            ),
            const SizedBox(width: 16),
            _SocialButton(
              icon: Icons.link,
              onPressed: () {},
              color: colorScheme.primary,
            ),
            const SizedBox(width: 16),
            _SocialButton(
              icon: Icons.chat,
              onPressed: () {},
              color: colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color color;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: ContactPage.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: theme.textTheme.bodyMedium,
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

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const _SocialButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color
              // ignore: deprecated_member_use
              : ContactPage.primaryLight,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            widget.icon,
            color: _isHovered ? Colors.white : widget.color,
            size: 20,
          ),
          onPressed: widget.onPressed,
          padding: EdgeInsets.zero,
          splashRadius: 20,
        ),
      ),
    );
  }
}
