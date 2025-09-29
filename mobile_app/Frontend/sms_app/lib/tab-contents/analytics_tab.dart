import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sms_app/home_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsTab extends StatelessWidget {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard title
              const Text(
                "Dashboard",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Total Energy Produced today and total energy conusumed today
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.withAlpha((0.1 * 200).toInt()),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.green.shade100,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          "5.6 kWh",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                        ),
                        subtitle: Text(
                          "Energy Produced",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withAlpha((0.1 * 200).toInt()),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.red.shade100,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          "4.2 kWh",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade900,
                          ),
                        ),
                        subtitle: Text(
                          "Energy Consumed",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                "Power Flow",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),

              const SizedBox(height: 16),

              // Power flow (Live)
              _buildEnergyChartPlaceholder(context),

              const SizedBox(height: 16),
              Text(
                "Energy Statistics",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 16),
              // Energy statistics (Bar graph)
              _buildEnergyBarGraphPlaceholder(context),

              const SizedBox(height: 16),

              Text(
                "Energy Sources",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),

              const SizedBox(height: 16),
              // Energy sources (Pie chart)
              _buildPieChart(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildEnergyChartPlaceholder(BuildContext context) {
  // Generation dataset
  final List<EnergyData> generationData = [
    EnergyData(DateTime(2025, 6, 1, 0), 0.0),
    EnergyData(DateTime(2025, 6, 1, 2), 0.0),
    EnergyData(DateTime(2025, 6, 1, 4), 0.0),
    EnergyData(DateTime(2025, 6, 1, 6), 0.5),
    EnergyData(DateTime(2025, 6, 1, 8), 1.5),
    EnergyData(DateTime(2025, 6, 1, 10), 3.2),
    EnergyData(DateTime(2025, 6, 1, 12), 4.5),
    EnergyData(DateTime(2025, 6, 1, 14), 4.2),
    EnergyData(DateTime(2025, 6, 1, 16), 3.0),
    EnergyData(DateTime(2025, 6, 1, 18), 1.2),
    EnergyData(DateTime(2025, 6, 1, 20), 0.2),
    EnergyData(DateTime(2025, 6, 1, 22), 0.0),
  ];

  // Consumption dataset (steadier, morning + evening peaks)
  final List<EnergyData> consumptionData = [
    EnergyData(DateTime(2025, 6, 1, 0), 0.6),
    EnergyData(DateTime(2025, 6, 1, 2), 0.5),
    EnergyData(DateTime(2025, 6, 1, 4), 0.6),
    EnergyData(DateTime(2025, 6, 1, 6), 0.9),
    EnergyData(DateTime(2025, 6, 1, 8), 1.2),
    EnergyData(DateTime(2025, 6, 1, 10), 1.5),
    EnergyData(DateTime(2025, 6, 1, 12), 1.6),
    EnergyData(DateTime(2025, 6, 1, 14), 1.7),
    EnergyData(DateTime(2025, 6, 1, 16), 1.8),
    EnergyData(DateTime(2025, 6, 1, 18), 2.0),
    EnergyData(DateTime(2025, 6, 1, 20), 1.5),
    EnergyData(DateTime(2025, 6, 1, 22), 1.0),
  ];

  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    constraints: BoxConstraints(minHeight: 180, maxHeight: 320),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.hours,
        dateFormat: DateFormat('h a'),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'kWh')),
      series: <CartesianSeries>[
        // Generation graph (Green)
        AreaSeries<EnergyData, DateTime>(
          dataSource: generationData,
          xValueMapper: (EnergyData ed, _) => ed.time,
          yValueMapper: (EnergyData ed, _) => ed.consumption,
          color: Colors.green.withAlpha((0.3 * 200).toInt()),
          borderColor: Colors.green,
          borderWidth: 2,
          name: 'Generation',
          markerSettings: MarkerSettings(isVisible: true),
        ),

        // Consumption graph (Red)
        AreaSeries<EnergyData, DateTime>(
          dataSource: consumptionData,
          xValueMapper: (EnergyData ed, _) => ed.time,
          yValueMapper: (EnergyData ed, _) => ed.consumption,
          color: Colors.red.withAlpha((0.3 * 200).toInt()),
          borderColor: Colors.red,
          borderWidth: 2,
          name: 'Consumption',
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      tooltipBehavior: TooltipBehavior(enable: true),
    ),
  );
}

Widget _buildEnergyBarGraphPlaceholder(BuildContext context) {
  final List<BarData> barData = [
    BarData("Mon", 12, 9),
    BarData("Tue", 14, 11),
    BarData("Wed", 10, 8),
    BarData("Thu", 16, 12),
    BarData("Fri", 18, 14),
    BarData("Sat", 20, 15),
    BarData("Sun", 13, 10),
  ];

  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    constraints: const BoxConstraints(minHeight: 180, maxHeight: 320),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(title: AxisTitle(text: "kWh"), minimum: 0),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries>[
        // ✅ Generation (green bars)
        ColumnSeries<BarData, String>(
          dataSource: barData,
          xValueMapper: (BarData data, _) => data.day,
          yValueMapper: (BarData data, _) => data.generation,
          name: "Generation",
          color: Colors.green.withAlpha((0.7 * 200).toInt()),
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
        // ✅ Consumption (red bars)
        ColumnSeries<BarData, String>(
          dataSource: barData,
          xValueMapper: (BarData data, _) => data.day,
          yValueMapper: (BarData data, _) => data.consumption,
          name: "Consumption",
          color: Colors.red.withAlpha((0.7 * 200).toInt()),
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    ),
  );
}

// Simple model for bar chart data
class BarData {
  final String day;
  final double generation;
  final double consumption;

  BarData(this.day, this.generation, this.consumption);
}

// Simple model for line/area chart data
Widget _buildPieChart(BuildContext context) {
  return // Pie chart with only percentage labels
  Container(
    height: MediaQuery.of(context).size.height * 0.22,
    constraints: BoxConstraints(minHeight: 140, maxHeight: 260),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: SfCircularChart(
      legend: Legend(isVisible: true, position: LegendPosition.right),
      series: <PieSeries<_EnergySourceData, String>>[
        PieSeries<_EnergySourceData, String>(
          dataSource: [
            _EnergySourceData('Solar', 55),
            _EnergySourceData('Wind', 30),
            _EnergySourceData('Diesel', 15),
          ],
          xValueMapper: (_EnergySourceData data, _) => data.source,
          yValueMapper: (_EnergySourceData data, _) => data.value,
          dataLabelMapper: (_EnergySourceData data, _) => '${data.value}%',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    ),
  );
}

class _EnergySourceData {
  final String source;
  final double value;
  _EnergySourceData(this.source, this.value);
}
