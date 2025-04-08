import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/page_header.dart';
import '../widgets/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Family Task Manager',
      'description':
          'Családi feladatkezelő alkalmazás, amely segít a család tagjainak koordinálni a háztartási feladatokat.',
      'imageUrl': 'assets/images/family_task_manager.jpg',
      'tags': ['Flutter', 'Firebase', 'iOS', 'Android'],
      'link': 'https://lpeee-hu.github.io/task_2',
    },
    {
      'title': 'E-commerce Platform',
      'description':
          'Teljeskörű e-kereskedelmi platform, amely tartalmaz termékkezelést, kosár funkciót és fizetési integrációt.',
      'imageUrl': 'assets/images/ecommerce.jpg',
      'tags': ['Flutter', 'Node.js', 'REST API', 'Stripe'],
      'link': '#',
    },
    {
      'title': 'Health & Fitness App',
      'description':
          'Egészségügyi és fitness alkalmazás, amely segít a felhasználóknak nyomon követni az edzéseiket és étrendjüket.',
      'imageUrl': 'assets/images/fitness.jpg',
      'tags': ['Flutter', 'HealthKit', 'Google Fit', 'Charts'],
      'link': '#',
    },
    {
      'title': 'Real Estate Finder',
      'description':
          'Ingatlan kereső alkalmazás, amely segít a felhasználóknak megtalálni a tökéletes otthont.',
      'imageUrl': 'assets/images/realestate.jpg',
      'tags': ['Flutter', 'Google Maps', 'Filtering', 'Search'],
      'link': '#',
    },
    {
      'title': 'Food Delivery',
      'description':
          'Étel házhoz szállítási alkalmazás, amely összeköti a helyi éttermeket a vásárlókkal.',
      'imageUrl': 'assets/images/fooddelivery.jpg',
      'tags': ['Flutter', 'Firebase', 'Real-time', 'Geolocation'],
      'link': '#',
    },
  ];

  String? _selectedTag;
  final List<String> _allTags = [];

  @override
  void initState() {
    super.initState();
    _extractAllTags();
  }

  void _extractAllTags() {
    final Set<String> tags = {};
    for (final project in _projects) {
      tags.addAll((project['tags'] as List<String>));
    }
    _allTags.addAll(tags);
  }

  List<Map<String, dynamic>> get _filteredProjects {
    if (_selectedTag == null) {
      return _projects;
    }
    return _projects
        .where((project) =>
            (project['tags'] as List<String>).contains(_selectedTag))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 1200 ? 3 : (screenWidth > 800 ? 2 : 1);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Projektjeink',
              subtitle:
                  'Ismerje meg a közelmúltban fejlesztett alkalmazásainkat',
              backgroundImage: 'assets/images/projects_header.jpg',
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter by tags
                  Text(
                    'Szűrés technológia szerint',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilterChip(
                        label: const Text('Mind'),
                        selected: _selectedTag == null,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              _selectedTag = null;
                            });
                          }
                        },
                      ),
                      ..._allTags.map((tag) => FilterChip(
                            label: Text(tag),
                            selected: _selectedTag == tag,
                            onSelected: (selected) {
                              setState(() {
                                _selectedTag = selected ? tag : null;
                              });
                            },
                          )),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Projects grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: _filteredProjects.length,
                    itemBuilder: (context, index) {
                      final project = _filteredProjects[index];
                      return ProjectCard(
                        title: project['title'],
                        description: project['description'],
                        imageUrl: project['imageUrl'],
                        tags: project['tags'],
                        onTap: () async {
                          final url = Uri.parse(project['link']);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                      );
                    },
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
