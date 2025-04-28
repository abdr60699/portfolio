import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abdul Rahman',
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  final Color backgroundColor = Colors.white;
  final Color primaryColor = Colors.orange;
  final Color textGrey = Colors.grey;
  final Color textBlack = Colors.black87;

  Widget menuButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );

  Widget sectionContent(String content) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            width: 300,
            color: Colors.grey[100],
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdul Rahman',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 18, color: textGrey),
                ),
                const SizedBox(height: 24),
                Text(
                  'Building beautiful mobile apps with Flutter and Firebase.',
                  style: TextStyle(color: textGrey, fontSize: 14),
                ),
                const SizedBox(height: 40),
                menuButton('ABOUT'),
                menuButton('EXPERIENCE'),
                menuButton('PROJECTS'),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.linked_camera, color: textGrey),
                    const SizedBox(width: 8),
                    Icon(Icons.link, color: textGrey),
                  ],
                )
              ],
            ),
          ),
          // Right Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('About Me'),
                  sectionContent(
                    'I\'m Abdul Rahman, a passionate Flutter developer focused on crafting clean, efficient, and engaging mobile applications. With experience in Firebase, MongoDB, and Express.js, I deliver scalable solutions with pixel-perfect UIs.',
                  ),
                  sectionTitle('Experience'),
                  sectionContent(
                    'Flutter Developer (2024 - Present)\nTemple Ray Applied Technologies\n- Developed mobile apps using Flutter and Node backend.\n- Implemented real-time features with Socket.io and Firebase.\n- Deployed apps to Google Play Store with multilingual support.',
                  ),
                  sectionContent(
                    'Support Analyst & Flutter Developer (2018 - 2024)\nTata Consultancy Services\n- Built Flutter projects (Contact Manager, Messenger app).\n- Experience in IT operations, server maintenance, cash flow processes.\n- Delivered stakeholder presentations and reports.',
                  ),
                  sectionTitle('Projects'),
                  sectionContent(
                    'Coming soon...',
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: Text(
                      'Designed & Built by Abdul Rahman - 2025',
                      style: TextStyle(color: textGrey, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
