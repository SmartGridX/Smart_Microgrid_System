import 'package:flutter/material.dart';
import 'package:sms_app/welcome_screen.dart';
import 'package:sms_app/widgets/feature_card.dart';
import 'package:sms_app/widgets/feature_details.dart';
import 'package:sms_app/widgets/hompage_card.dart';
import 'package:sms_app/widgets/profile_sidebar.dart';
import 'package:sms_app/widgets/bottom_nav.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// Importing individual tabs
import 'package:sms_app/tab-contents/analytics_tab.dart';
import 'package:sms_app/tab-contents/grid_tab.dart';
import 'package:sms_app/tab-contents/alerts_tab.dart';

// Custom FeatureCard widget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_currentIndex) {
      case 0:
        body = _homeContent(context);
        break;
      case 1:
        body = const AnalyticsTab(); // ✅ Moved to separate file
        break;
      case 2:
        body = const GridTab(); // ✅ Moved to separate file
        break;
      case 3:
        body = const AlertsTab(); // ✅ Moved to separate file
        break;
      default:
        body = _homeContent(context);
    }

    return Scaffold(
      endDrawer: ProfileSidebar(
        username: "Pritam",
        profileImage:
            "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg",
        onLogout: () {
          // Clear user session or token here if applicable
          // Navigate to WelcomeScreen and remove all previous routes
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const WelcomeScreen()),
            (route) => false,
          );
        },
      ),
      body: body,
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

// Home tab content
Widget _homeContent(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopRow(context),
            _buildLocationRow(),

            SizedBox(height: 10),
            _buildSearchBar(),

            SizedBox(height: 20),
            Text(
              "Features",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16),
            _buildFeatureList(context),

            SizedBox(height: 16),
            Text(
              "Today's Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildSummaryGrid(context),

            SizedBox(height: 20),
            _buildDeviceDetails(devices),

            SizedBox(height: 20),
            Text(
              "Energy Consumption",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildEnergyChartPlaceholder(context),

            SizedBox(height: 20),
            // Energy Source Breakdown Placeholder
            Text(
              "Energy Source Breakdown",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Pie chart with only percentage labels
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              constraints: BoxConstraints(minHeight: 140, maxHeight: 260),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
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
                    dataLabelMapper: (_EnergySourceData data, _) =>
                        '${data.value}%',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
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

Widget _buildTopRow(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "SmartGridX",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade500,
        ),
      ),
      Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: const CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg",
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildLocationRow() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'HOME',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' - Pritam, E - 204, Tower B'),
            ],
          ),
        ),
        Icon(Icons.keyboard_arrow_down_rounded),
      ],
    ),
  );
}

Widget _buildSearchBar() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300, width: 2),
      color: Colors.grey.shade100,

      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(Icons.search, color: Colors.grey),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for appliances",
              border: InputBorder.none,
            ),
          ),
        ),
        Icon(Icons.mic, color: Colors.grey),
      ],
    ),
  );
}

Widget _buildFeatureList(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.11,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        FeatureCard(
          icon: Icons.battery_4_bar_sharp,
          label: "Battery Health",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BatteryPage()),
            );
          },
        ),
        const SizedBox(width: 16),
        FeatureCard(
          icon: Icons.ac_unit,
          label: "Efficiency",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EfficiencyPage()),
            );
          },
        ),
        const SizedBox(width: 16),
        FeatureCard(
          icon: Icons.cloud,
          label: "Weather",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WeatherPage()),
            );
          },
        ),
        const SizedBox(width: 16),
        FeatureCard(
          icon: Icons.currency_rupee,
          label: "Earnings",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EarningsPage()),
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildSummaryGrid(BuildContext context) {
  // Responsive summary grid
  final screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount;
  double childAspectRatio;

  if (screenWidth < 400) {
    crossAxisCount = 1;
    childAspectRatio = 2.5;
  } else if (screenWidth < 600) {
    crossAxisCount = 2;
    childAspectRatio = 1.3;
  } else if (screenWidth < 900) {
    crossAxisCount = 3;
    childAspectRatio = 1.6;
  } else {
    crossAxisCount = 4;
    childAspectRatio = 1.8;
  }

  return GridView.count(
    crossAxisCount: crossAxisCount,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
    childAspectRatio: childAspectRatio,
    children: [
      HompageCard(
        title: "Production",
        titleColor: Colors.green.shade700,
        value: "5.4 kWh",
        valueColor: Colors.green.shade900,
        changeText: "+12% from yesterday",
        changeTextColor: Colors.green.shade700,
        color: Colors.green,
        icon: Icons.bolt,
        iconColor: Colors.green.shade400,
      ),
      HompageCard(
        title: "Consumption",
        titleColor: Colors.red.shade700,
        value: "3.2 kWh",
        valueColor: Colors.red.shade900,
        changeText: "-8% from yesterday",
        color: Colors.red,
        changeTextColor: Colors.red.shade900,
        icon: Icons.flash_off,
        iconColor: Colors.red.shade400,
      ),
      HompageCard(
        title: "Peak Demand",
        value: "4.5 kW",
        changeText: "+5% from yesterday",
        color: Colors.orange,
        icon: Icons.trending_up,
        titleColor: Colors.orange.shade700,
        valueColor: Colors.orange.shade900,
        changeTextColor: Colors.orange.shade900,
        iconColor: Colors.orange.shade400,
      ),
      HompageCard(
        title: "Active Devices",
        titleColor: Colors.blue.shade700,
        value: "7 Devices",
        valueColor: Colors.blue.shade900,
        changeText: "+3% from yesterday",
        color: Colors.blue,
        icon: Icons.device_hub,
        changeTextColor: Colors.blue.shade900,
        iconColor: Colors.blue.shade400,
      ),
    ],
  );
}

class EnergyData {
  final DateTime time;
  final double consumption;

  EnergyData(this.time, this.consumption);
}

class _EnergySourceData {
  final String source;
  final double value;
  _EnergySourceData(this.source, this.value);
}

Widget _buildEnergyChartPlaceholder(BuildContext context) {
  final List<EnergyData> data = [
    EnergyData(DateTime(2025, 6, 1, 0), 0.6),
    EnergyData(DateTime(2025, 6, 1, 2), 0.5),
    EnergyData(DateTime(2025, 6, 1, 4), 0.4),
    EnergyData(DateTime(2025, 6, 1, 6), 0.7),
    EnergyData(DateTime(2025, 6, 1, 8), 1.2),
    EnergyData(DateTime(2025, 6, 1, 10), 2.0),
    EnergyData(DateTime(2025, 6, 1, 12), 2.8),
    EnergyData(DateTime(2025, 6, 1, 14), 2.5),
    EnergyData(DateTime(2025, 6, 1, 16), 2.2),
    EnergyData(DateTime(2025, 6, 1, 18), 1.8),
    EnergyData(DateTime(2025, 6, 1, 20), 1.1),
    EnergyData(DateTime(2025, 6, 1, 22), 0.8),
  ];

  return Container(
    height: MediaQuery.of(context).size.height * 0.25,

    // Minimum height fallback for very small screens
    constraints: BoxConstraints(minHeight: 180, maxHeight: 320),

    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300, width: 2),
    ),
    child: SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.hours,
        dateFormat: DateFormat('h a'), // 12-hour format (e.g., 1 AM, 2 PM)
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
      primaryYAxis: NumericAxis(title: AxisTitle(text: 'Consumption (kWh)')),
      series: <CartesianSeries>[
        AreaSeries<EnergyData, DateTime>(
          dataSource: data,
          xValueMapper: (EnergyData ed, _) => ed.time,
          yValueMapper: (EnergyData ed, _) => ed.consumption,
          color: Colors.green.withAlpha((0.6 * 255).toInt()),
          borderColor: Colors.green,
          borderWidth: 2,
          name: 'Consumption',
          markerSettings: MarkerSettings(isVisible: true),
        ),
      ],
      legend: Legend(isVisible: false),
      tooltipBehavior: TooltipBehavior(enable: true),
    ),
  );
}

Widget _buildDeviceDetails(List<Map<String, dynamic>> devices) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Device Details",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 160, // Height for device cards
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: devices.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final device = devices[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              constraints: BoxConstraints(minWidth: 180, maxWidth: 300),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Device name & status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            device['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(device['icon'], size: 28),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Status: ${getDeviceStatus(device)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: getDeviceStatus(device) == "Active"
                              ? Colors.green
                              : (getDeviceStatus(device) == "Warning"
                                    ? Colors.orange
                                    : Colors.red),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("Total Sensors: ${device['Total Sensors']}"),
                      const SizedBox(height: 2),
                      Text(
                        "Active Sensors: ${device['Active Sensors']}",
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Inactive Sensors: ${device['Inactive Sensors']}",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

final devices = [
  {
    "name": "Device 1",
    "Total Sensors": 5,
    "Active Sensors": 3,
    "Inactive Sensors": 2,
    "icon": Icons.solar_power,
  },
  {
    "name": "Device 2",
    "Total Sensors": 10,
    "Active Sensors": 0,
    "Inactive Sensors": 10,
    "icon": Icons.wind_power,
  },
];

String getDeviceStatus(Map device) {
  if ((device['Active Sensors'] ?? 0) == 0) {
    return "Inactive";
  } else if ((device['Active Sensors'] ?? 0) <
      (device['Total Sensors'] ?? 1) / 2) {
    return "Warning";
  } else {
    return "Active";
  }
}
