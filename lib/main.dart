import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CompanyWebsite());
}

class CompanyWebsite extends StatelessWidget {
  const CompanyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobil Fejlesztő Cég',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobil Fejlesztő Cég')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Cross-Platform Mobil Alkalmazások Fejlesztése',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Szolgáltatások
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Szolgáltatásaink',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServiceCard(
                        icon: Icons.phone_android,
                        title: 'Flutter Fejlesztés',
                        description:
                            'Cross-platform alkalmazások iOS-re és Androidra',
                      ),
                      ServiceCard(
                        icon: Icons.web,
                        title: 'Web Fejlesztés',
                        description:
                            'Reszponzív weboldalak modern technológiákkal',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Referencia projektek
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Futó Projektek',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ProjectCard(
                    title: 'Family Task Manager',
                    description: 'Családi feladatkezelő alkalmazás',
                    onTap: () async {
                      final uri = Uri.parse(
                        'https://lpeee-hu.github.io/task_2',
                      );
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
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

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(description),
              const SizedBox(height: 10),
              const Text(
                'Kattints a megtekintéshez',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
