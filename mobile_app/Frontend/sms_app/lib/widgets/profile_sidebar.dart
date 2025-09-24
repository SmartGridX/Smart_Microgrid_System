import 'package:flutter/material.dart';

import './sidebar_widgets/my_profile.dart';
import './sidebar_widgets/contact_us.dart';
import './sidebar_widgets/settings.dart';
import './sidebar_widgets/help_faqs.dart';
import './sidebar_widgets/docs.dart';

class ProfileSidebar extends StatelessWidget {
  final String username;
  final String profileImage;
  final VoidCallback onLogout;

  const ProfileSidebar({
    super.key,
    required this.username,
    required this.profileImage,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(profileImage),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      username,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Menu Options
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: const Text("My Profile"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            username: username,
                            profileImage: profileImage,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: const Text("Settings"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: const Text("Contact Us"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help_outline,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: const Text("Help & FAQs"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpFaqsPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.book,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    title: const Text("Documentation"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DocumentationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
