import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> reports = [
      {
        "title": "Monthly Report - April 2025",
        "date": "Generated on: May 1, 2025",
      },
      {
        "title": "Custom Report - Site A High Temps",
        "date": "Generated on: Apr 28, 2025",
      },
      {
        "title": "Weekly Summary - Week 17",
        "date": "Generated on: Apr 26, 2025",
      },
      {
        "title": "Monthly Report - April 2025",
        "date": "Generated on: May 1, 2025",
      },
      {
        "title": "Custom Report - Site A High Temps",
        "date": "Generated on: Apr 28, 2025",
      },
      {
        "title": "Weekly Summary - Week 17",
        "date": "Generated on: Apr 26, 2025",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Generate Report button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reports",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Generate and manage your IoT reports",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Generate report action
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.green.shade50,
                  //     foregroundColor: Colors.green,
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 12,
                  //       vertical: 8,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  //   child: const Text("Generate Report"),
                  // ),
                ],
              ),
            ),

            // Report Library Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.folder_copy,
                    color: Colors.black54,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Report Library",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // Options for filtering/sorting reports
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),

            // Report List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report["title"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                report["date"]!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Show report options: Download, Share, Delete
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
