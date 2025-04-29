import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey competenciesKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey awardsKey = GlobalKey();

  void scrollTo(GlobalKey key, {bool alignTop = true}) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        alignment: alignTop ? 0 : 0.1,
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;

    return Scaffold(
      body: isMobile
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mobileSidebar(),
                  const SizedBox(height: 32),
                  contentArea(),
                ],
              ),
            )
          : Row(
              children: [
                SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 48),
                    child: sidebarMenu(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 48),
                    child: contentArea(),
                  ),
                ),
              ],
            ),
    );
  }

  Widget sidebarMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABDUL RAHMAN',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Flutter Mobile Apps Developer',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        sidebarInfo('Location: Chennai'),
        sidebarInfo('Phone: 9500893174'),
        sidebarInfo('Email: abdr6099@gmail.com'),
        sidebarInfo('LinkedIn: linkedin.com/in/abdul-rahman495559241'),
        const SizedBox(height: 16),

        // Menu Buttons
        menuButton('ABOUT ME', aboutKey, false),
        menuButton('CORE COMPETENCIES', competenciesKey, false),
        menuButton('WORK EXPERIENCE', experienceKey, false),
        menuButton('EDUCATION', educationKey, false),
        menuButton('AWARDS & CERTIFICATIONS', awardsKey, false),

        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textButton("E-Mail", 'mailto:abdr6099@gmail.com'),
            textButton('Linkedin',
                'https://www.linkedin.com/in/abdul-rahman-495559241/'),
            textButton(
              'GitHub',
              'https://github.com/abdr60699',
            )
          ],
        )
      ],
    );
  }

  Widget mobileSidebar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ABDUL RAHMAN',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Flutter Mobile Apps Developer',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        sidebarInfo('Location: Chennai'),
        sidebarInfo('Phone: 9500893174'),
        sidebarInfo('Email: abdr6099@gmail.com'),
        sidebarInfo('LinkedIn: linkedin.com/in/abdul-rahman495559241'),
        // Menu Buttons
        menuButton('ABOUT ME', aboutKey, true),
        menuButton('CORE COMPETENCIES', competenciesKey, true),
        menuButton('WORK EXPERIENCE', experienceKey, true),
        menuButton('EDUCATION', educationKey, false),
        menuButton('AWARDS & CERTIFICATIONS', awardsKey, false),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textButton("E-Mail", 'mailto:abdr6099@gmail.com'),
            textButton(
                'in', 'https://www.linkedin.com/in/abdul-rahman-495559241/'),
            textButton(
              'GitHub',
              'https://github.com/abdr60699',
            )
          ],
        )
      ],
    );
  }

  Widget sidebarInfo(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  Widget menuButton(String title, GlobalKey key, bool alignTop) {
    return GestureDetector(
      onTap: () => scrollTo(key, alignTop: alignTop),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget iconButton(IconData icon, String link) {
  //   return IconButton(
  //     icon: Icon(icon, color: Colors.orange),
  //     onPressed: () => _launchUrl(link),
  //   );
  // }

  Widget textButton(String title, String link) {
    return TextButton(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => _launchUrl(link),
    );
  }

  Widget contentArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionWidget('About Me', aboutKey,
            'Experienced Flutter Developer and Support Analyst, blending expertise in mobile apps development and IT operations. Adept at delivering efficient solutions, crafting engaging user interfaces, and optimizing system functionality. Passionate about enhancing user experiences and driving impactful results within a collaborative environment. Seeking a position that empowers me to further develop my strengths and learn new things, especially in Flutter app development.'),
        sectionWidget('Core Competencies', competenciesKey,
            '- Flutter & Dart\n- MongoDB\n- Express.js\n- Basic knowledge of Linux, SQL, HTML, CSS, React.js\n- Excellent Communication and Persuasion Skills\n- Proven Track Record in Complaints and Grievance Resolution\n- Proficient in MS Excel'),
        sectionWidget('Work Experience', experienceKey,
            'Flutter Developer — Temple Ray Applied Technologies (2024 - Present)\n• Developed Flutter apps with backend (Express.js, MongoDB).\n• Integrated Firebase authentication and real-time database.\n• Play Store deployments and multilingual support.\n• Built real-time one-to-one chat using Socket.io.\n\nSupport Analyst & Flutter Developer — Tata Consultancy Services (2018 - 2024)\n• Built Contact Manager and Group Messenger Flutter apps.\n• Implemented Firebase authentication, Riverpod management.\n• Maintained IT servers and supported OTC cash flow operations.'),
        sectionWidget('Education', educationKey,
            'B.Sc. Physics — The New College, Chennai, TN (June 2017)'),
        sectionWidget('Awards & Certifications', awardsKey,
            '- Promising Kid Award (Junior Process Analyst)\n- Twice R&R Award for Stakeholder Collaboration\n- Certified in Prompt Engineering (Udemy Course)'),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'Built by Abdul Rahman — 2025',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget sectionWidget(String title, GlobalKey key, String content) {
    return Container(
      key: key,
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
