import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // ✅ Syncfusion package
import 'package:sms_app/welcome_screen.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Sample Data for Double Bar Graph
    final List<_SiteData> data = [
      _SiteData("Greenfield", 260, 200),
      _SiteData("Oakridge", 200, 180),
      _SiteData("Sunset", 180, 150),
      _SiteData("Pine Ridge", 220, 190),
      _SiteData("Mountain", 210, 170),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------- TOP CARDS ----------
            LayoutBuilder(
              builder: (context, constraints) {
                // Get available width
                double width = constraints.maxWidth;

                // Dynamically calculate number of columns
                int crossAxisCount = width > 900
                    ? 4 // Tablet or big screen -> 4 cards per row
                    : width > 600
                    ? 3 // Medium screen -> 3 cards per row
                    : 2; // Small phones -> 2 cards per row

                // Calculate a good aspect ratio dynamically
                double childAspectRatio = (width / crossAxisCount) / 120;

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: childAspectRatio,
                  children: const [
                    _InfoCard(
                      title: "Active Sites",
                      value: "12",
                      subtitle: "+2 last month",
                      icon: Icons.wifi,
                    ),
                    _InfoCard(
                      title: "Total Devices",
                      value: "154",
                      subtitle: "+8 new devices",
                      icon: Icons.devices,
                    ),
                    _InfoCard(
                      title: "Online Devices",
                      value: "147",
                      subtitle: "7 offline",
                      icon: Icons.cloud_done,
                    ),
                    _InfoCard(
                      title: "Monthly Usage",
                      value: "1.4 TB",
                      subtitle: "15% increase",
                      icon: Icons.bar_chart,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // --------- RECENT ALERTS ----------
            const Text(
              "Recent Alerts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _alertCard("Sensor Offline - Site A", "2 hrs ago"),
            _alertCard("High Temp Alert - Site F", "3 hrs ago"),
            _alertCard("Sensor Offline - Site A", "2 hrs ago"),
            _alertCard("High Temp Alert - Site F", "3 hrs ago"),

            const SizedBox(height: 20),

            // --------- DEVICE UPTIME ----------
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "Device Uptime",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CircularPercentIndicator(
                            radius: 70,
                            lineWidth: 12,
                            percent: 0.707,
                            center: const Text("70.7%"),
                            progressColor: Colors.blue,
                            backgroundColor: Colors.grey.shade200,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --------- DATA USAGE ----------
            const Text(
              "Data Usage by Site",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 250,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: true),
                    series: <CartesianSeries<_SiteData, String>>[
                      ColumnSeries<_SiteData, String>(
                        name: 'Current Month',
                        dataSource: data,
                        xValueMapper: (site, _) => site.name,
                        yValueMapper: (site, _) => site.currentMonth,
                        color: Colors.blue,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      ColumnSeries<_SiteData, String>(
                        name: 'Previous Month',
                        dataSource: data,
                        xValueMapper: (site, _) => site.name,
                        yValueMapper: (site, _) => site.previousMonth,
                        color: Colors.orange,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model for chart
class _SiteData {
  final String name;
  final double currentMonth;
  final double previousMonth;

  _SiteData(this.name, this.currentMonth, this.previousMonth);
}

// --------- INFO CARD WIDGET ----------
class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, size: 32, color: Colors.blue),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------- ALERT WIDGET ----------
Widget _alertCard(String title, String time) {
  return Card(
    elevation: 1,
    margin: const EdgeInsets.symmetric(vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      leading: const Icon(Icons.warning, color: Colors.orange),
      title: Text(title),
      subtitle: Text(time),
    ),
  );
}
