import 'package:flutter/material.dart';

class HelpFaqsPage extends StatelessWidget {
  const HelpFaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & FAQs"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Frequently Asked Questions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ExpansionTile(
            title: Text("How do I monitor devices?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "You can monitor all devices from the dashboard in real-time.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("How do I report an issue?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Use the 'Report an Issue' section in the sidebar to report any problems.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("How to reset password?"),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Go to Settings > Change Password to reset your password.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
