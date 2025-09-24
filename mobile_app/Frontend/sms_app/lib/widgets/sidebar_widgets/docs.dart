import 'package:flutter/material.dart';

class DocumentationPage extends StatelessWidget {
  const DocumentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documentation"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Microgrid System Documentation",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Welcome to the user documentation for your microgrid monitoring system. Here you'll find guides, manuals, and troubleshooting tips to help manage your system efficiently.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          // Sections
          _buildDocSection(
            title: "1. Getting Started",
            content:
                "Learn how to set up your microgrid system, add devices, and configure your dashboard.",
          ),
          _buildDocSection(
            title: "2. Monitoring Devices",
            content:
                "Understand how to read metrics, alerts, and device status in real-time.",
          ),
          _buildDocSection(
            title: "3. Handling Alerts",
            content:
                "Step-by-step guide on responding to Yellow (warnings) and Red (critical) alerts.",
          ),
          _buildDocSection(
            title: "4. Reporting Issues",
            content:
                "Instructions on how to report device malfunctions or operational problems to the admin team.",
          ),
          _buildDocSection(
            title: "5. FAQs & Troubleshooting",
            content:
                "Common issues and solutions for typical microgrid problems.",
          ),
        ],
      ),
    );
  }

  Widget _buildDocSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
