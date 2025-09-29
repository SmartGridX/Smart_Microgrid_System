import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "Sensor Offline - Site A",
        "message": "1 device went offline in Greenfield Solar Farm.",
        "time": "2 min ago",
        "isRead": false,
      },
      {
        "title": "Report Generated",
        "message": "Monthly Report - April 2025 is ready to view.",
        "time": "10 min ago",
        "isRead": false,
      },
      {
        "title": "All Systems Online",
        "message": "Oakridge Wind Farm is fully operational.",
        "time": "1 hour ago",
        "isRead": true,
      },
      {
        "title": "Maintenance Scheduled",
        "message": "Scheduled maintenance for Pine Ridge Hydro tomorrow.",
        "time": "Yesterday",
        "isRead": true,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Notifications",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Mark all as read action
                    },
                    child: const Text(
                      "Mark all as read",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            // Notifications List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  final isRead = notification["isRead"] as bool;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isRead ? Colors.white : Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        if (!isRead)
                          BoxShadow(
                            color: Colors.green.withOpacity(0.15),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          isRead
                              ? Icons.notifications_none
                              : Icons.notifications_active,
                          color: isRead ? Colors.grey : Colors.green,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification["title"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: isRead
                                      ? Colors.black87
                                      : Colors.green.shade900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                notification["message"],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                notification["time"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert, color: Colors.grey),
                          onPressed: () {
                            // Show bottom sheet with notification actions
                          },
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
