import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GridTab extends StatelessWidget {
  const GridTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with gradient
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Grid Interaction",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Column(
                          children: [
                            Icon(Icons.electric_bolt),
                            SizedBox(height: 4),
                            Text("System"),
                            Text(
                              "On Grid",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Live Output"),
                            Text(
                              "42.98 kWh",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Peak Power"),
                            Text(
                              "48.98 kWh",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: infoCard("120 kWh", "Energy Sold", Colors.green),
                  ),
                  Expanded(
                    child: infoCard(
                      "80 kWh",
                      "Energy bought",
                      Colors.redAccent,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Net Metering Statistics
              const Text(
                "Net Metering Statistics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 300,
                child: SfCartesianChart(
                  legend: const Legend(isVisible: true),
                  primaryXAxis: CategoryAxis(
                    title: AxisTitle(text: 'Time (Months)'),
                  ),
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(text: 'Energy (kWh)'),
                  ),
                  series: [
                    LineSeries<ChartData, String>(
                      name: "Energy Sold",
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.energySold,
                      color: Colors.green,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                    LineSeries<ChartData, String>(
                      name: "Energy bought",
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.month,
                      yValueMapper: (ChartData data, _) => data.energyPurchased,
                      color: Colors.red,
                      dashArray: [5, 5],
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Info Card
  Widget infoCard(String value, String label, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Center(
        child: Text(
          "$value\n$label",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Chart Data Model
class ChartData {
  final String month;
  final double energySold;
  final double energyPurchased;

  ChartData(this.month, this.energySold, this.energyPurchased);
}

// Dummy Data
final List<ChartData> chartData = [
  ChartData("Jan", 200, 100),
  ChartData("Feb", 180, 110),
  ChartData("Mar", 250, 120),
  ChartData("Apr", 170, 90),
  ChartData("May", 220, 130),
  ChartData("Jun", 280, 140),
  ChartData("Jul", 260, 150),
  ChartData("Aug", 190, 120),
  ChartData("Sep", 210, 130),
  ChartData("Oct", 230, 140),
  ChartData("Nov", 240, 150),
  ChartData("Dec", 310, 160),
];
