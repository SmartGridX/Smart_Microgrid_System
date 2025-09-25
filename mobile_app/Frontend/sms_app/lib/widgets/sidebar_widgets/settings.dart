import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final VoidCallback? onNotificationPrefsTap;
  final VoidCallback? onEmailNotificationTap;
  final VoidCallback? onThemeTap;
  final VoidCallback? onAppVersionTap;

  const SettingsPage({
    super.key,
    this.onNotificationPrefsTap,
    this.onEmailNotificationTap,
    this.onThemeTap,
    this.onAppVersionTap,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pushNotifications = true;
  bool emailNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 24),

          // Notifications Section
          const _SectionTitle(title: "Notifications"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text("Notification Preferences"),
                    trailing: Switch(
                      value: pushNotifications,
                      onChanged: (val) {
                        setState(() {
                          pushNotifications = val;
                        });
                      },
                      activeThumbColor: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        pushNotifications = !pushNotifications;
                      });
                      if (widget.onNotificationPrefsTap != null) {
                        widget.onNotificationPrefsTap!();
                      }
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email Notifications"),
                    trailing: Switch(
                      value: emailNotifications,
                      onChanged: (val) {
                        setState(() {
                          emailNotifications = val;
                        });
                      },
                      activeThumbColor: Colors.black,
                    ),
                    onTap: () {
                      setState(() {
                        emailNotifications = !emailNotifications;
                      });
                      if (widget.onEmailNotificationTap != null) {
                        widget.onEmailNotificationTap!();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Appearance Section
          const _SectionTitle(title: "Appearance"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              child: ListTile(
                leading: const Icon(Icons.palette),
                title: const Text("Theme"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: widget.onThemeTap ?? () {},
              ),
            ),
          ),
          const SizedBox(height: 24),

          // About Section
          const _SectionTitle(title: "About"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text("App Version"),
                trailing: const Text(
                  "v1.0.0",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: widget.onAppVersionTap ?? () {},
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// Section Title Widget
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
