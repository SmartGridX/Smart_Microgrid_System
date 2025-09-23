import 'package:flutter/material.dart';

// ---------------- Battery Page ----------------
class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  double batteryLevel = 0.75; // dummy 75% battery

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battery Health"), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Battery Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ---------------- Top Section ----------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----------- Battery Icon (Vertical with Tip) -----------
                Column(
                  children: [
                    // Battery Tip
                    Container(
                      width: 30,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Main Battery Box
                    Container(
                      width: 60,
                      height: 175,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          FractionallySizedBox(
                            heightFactor: batteryLevel,
                            child: Container(
                              decoration: BoxDecoration(
                                color: batteryLevel > 0.5
                                    ? Colors.green
                                    : (batteryLevel > 0.2
                                          ? Colors.orange
                                          : Colors.red),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 24), // Space between battery and details
                // ----------- Battery Details -----------
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoCard("Status", "Normal"),
                      const SizedBox(height: 8),
                      _infoCard("State of Health", "92 %"),
                      const SizedBox(height: 8),
                      _infoCard("Capacity", "18 KWH Remaining"),
                      const SizedBox(height: 8),
                      _infoCard("Backup", "10 Hours"),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------------- Health Section ----------------
            Row(
              children: [
                Expanded(
                  child: _healthCard(
                    "Inverter Health",
                    "Healthy",
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _healthCard(
                    "Transformer Health",
                    "Critical",
                    Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------------- Notification Section ----------------
            const Text(
              "Notifications",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _notificationCard("Battery Low"),
          ],
        ),
      ),
    );
  }
}

// ---------------- Notification Card Widget ----------------
Widget _notificationCard(String message) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 197, 246, 20),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color.fromARGB(255, 222, 244, 54)),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.warning, color: Color.fromARGB(255, 125, 152, 4), size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _healthCard(String title, String status, Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black12),
    ),
    child: Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: color),
        const SizedBox(width: 8),
        Text(
          "$title: $status",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _infoCard(String title, String value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(bottom: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      "$title : $value",
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

// -------------------------------------------------
// ---------------- Efficiency Page ----------------
class EfficiencyPage extends StatefulWidget {
  const EfficiencyPage({super.key});

  @override
  State<EfficiencyPage> createState() => _EfficiencyPageState();
}

class _EfficiencyPageState extends State<EfficiencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Microgrid Efficiency"), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Efficiency Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _efficiencyCard(
                    "Solar Output",
                    "5.2 kW",
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _efficiencyCard("Grid Input", "2.8 kW", Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _efficiencyCard(
                    "Load Consumption",
                    "6.7 kW",
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _efficiencyCard("Losses", "0.3 kW", Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _infoCard("Overall Efficiency", "89 %"),
            const SizedBox(height: 8),
            _infoCard("Peak Efficiency Today", "94 %"),
            const SizedBox(height: 16),
            _statusCard(),
            const SizedBox(height: 16),
            const Text(
              "Notifications",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _notificationCard("Grid Instability Detected"),
            const SizedBox(height: 8),
            _notificationCard("Solar Output Fluctuation"),
            const SizedBox(height: 8),
            _notificationCard("Load Spike Warning"),
          ],
        ),
      ),
    );
  }
}

// ---------------- Efficiency Card Widget ----------------
Widget _efficiencyCard(String title, String value, Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withOpacity(0.3)),
    ),
    child: Row(
      children: [
        CircleAvatar(radius: 8, backgroundColor: color),
        const SizedBox(width: 8),
        Text(
          "$title: $value",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// ---------------- Status Card Widget ----------------
Widget _statusCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.blue),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
      ],
    ),
    child: Row(
      children: const [
        Icon(Icons.bolt, color: Colors.blue, size: 32),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Microgrid Status: Stable",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("All systems operating within normal parameters"),
          ],
        ),
      ],
    ),
  );
}

// -------------------------------------------------
// ---------------- Weather Page ----------------

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather"), elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location + Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delhi",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Current Temperature Block
              Center(
                child: Column(
                  children: const [
                    Text(
                      "31°",
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Text(
                      "Smoke",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(179, 111, 108, 108),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "32° / 25°  •  Feels like 34°",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(153, 101, 99, 99),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Hourly Forecast Card
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Partly cloudy. Low 25°C.",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _hourlyForecast("6:30 PM", "31°", Icons.wb_sunny),
                          _hourlyForecast("7:30 PM", "30°", Icons.wb_cloudy),
                          _hourlyForecast("8:30 PM", "29°", Icons.cloud),
                          _hourlyForecast("9:30 PM", "28°", Icons.cloud),
                          _hourlyForecast("10:30 PM", "28°", Icons.cloud),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Breaking News
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Breaking News: US Needs To Keep Eye On Tropics",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                "Daily Forecast",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),

              _dailyForecastRow(
                "Yesterday",
                "Cloudy",
                "32° / 26°",
                "5.1 kWh",
                Icons.wb_cloudy,
              ),
              _dailyForecastRow(
                "Today",
                "Sunny",
                "32° / 25°",
                "6.2 kWh",
                Icons.wb_sunny,
              ),
              _dailyForecastRow(
                "Wednesday",
                "Cloudy",
                "32° / 24°",
                "4.9 kWh",
                Icons.cloud,
              ),
              _dailyForecastRow(
                "Thursday",
                "Sunny",
                "32° / 25°",
                "6.5 kWh",
                Icons.wb_sunny,
              ),
              _dailyForecastRow(
                "Friday",
                "Partly Cloudy",
                "34° / 26°",
                "5.8 kWh",
                Icons.wb_cloudy,
              ),
              _dailyForecastRow(
                "Saturday",
                "Sunny",
                "34° / 26°",
                "7.1 kWh",
                Icons.wb_sunny,
              ),
              _dailyForecastRow(
                "Sunday",
                "Rain",
                "34° / 26°",
                "3.6 kWh",
                Icons.beach_access,
              ),
              _dailyForecastRow(
                "Monday",
                "Storm",
                "32° / 25°",
                "2.8 kWh",
                Icons.bolt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Daily forecast row with energy info
Widget _dailyForecastRow(
  String day,
  String desc,
  String temp,
  String energy,
  IconData icon,
) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Day + weather info
        Row(
          children: [
            Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 28),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Temperature + energy
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              temp,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              energy,
              style: const TextStyle(
                color: Color.fromARGB(255, 230, 175, 11),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// hourly forecast widget
Widget _hourlyForecast(String time, String temp, IconData icon) {
  return Container(
    width: 80,
    margin: const EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 34, 5, 82).withOpacity(0.15),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(time, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 6),
        Icon(icon, color: const Color.fromARGB(255, 3, 0, 0), size: 28),
        const SizedBox(height: 6),
        Text(
          temp,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

// // -------------------------------------------------
// // ---------------- Forecast Page ----------------
// class ForecastPage extends StatefulWidget {
//   const ForecastPage({super.key});

//   @override
//   State<ForecastPage> createState() => _ForecastPageState();
// }

// class _ForecastPageState extends State<ForecastPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Forecast")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// 🔹 Summary Cards Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 _SummaryCard(
//                   title: "Solar Output",
//                   value: "120 kWh",
//                   icon: Icons.wb_sunny,
//                   color: Colors.orange,
//                 ),
//                 _SummaryCard(
//                   title: "Predicted Demand",
//                   value: "95 kWh",
//                   icon: Icons.flash_on,
//                   color: Colors.blue,
//                 ),
//                 _SummaryCard(
//                   title: "Battery SOC",
//                   value: "78%",
//                   icon: Icons.battery_full,
//                   color: Colors.green,
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             /// 🔹 Demand vs Supply Forecast (Chart Placeholder)
//             _SectionTitle("Demand vs Supply Forecast (Next 24h)"),
//             _ChartPlaceholder(),

//             const SizedBox(height: 20),

//             /// 🔹 Battery SOC Prediction
//             _SectionTitle("Battery SOC Forecast"),
//             _ChartPlaceholder(),

//             const SizedBox(height: 20),

//             /// 🔹 Cost Savings Forecast
//             _SectionTitle("Cost Savings (Next 7 Days)"),
//             _ChartPlaceholder(),

//             const SizedBox(height: 20),

//             /// 🔹 Carbon Savings
//             _SectionTitle("Carbon Savings"),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.green.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text(
//                 "Estimated CO₂ Reduction: 25 kg for next week",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// 🔹 Alerts / Recommendations
//             _SectionTitle("Recommendations"),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.yellow.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text(
//                 "⚠️ High demand expected tomorrow evening. "
//                 "Ensure battery is charged to 80% by 5 PM.",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// 🔹 Reusable Summary Card
// class _SummaryCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;
//   final Color color;

//   const _SummaryCard({
//     required this.title,
//     required this.value,
//     required this.icon,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Icon(icon, size: 28, color: color),
//               const SizedBox(height: 6),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: color,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// 🔹 Section Title
// class _SectionTitle extends StatelessWidget {
//   final String title;
//   const _SectionTitle(this.title);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// /// 🔹 Placeholder for charts
// class _ChartPlaceholder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: const Center(
//         child: Text("Chart Placeholder", style: TextStyle(color: Colors.grey)),
//       ),
//     );
//   }
// }

// ---------------- Earnings Page ----------------
class EarningsPage extends StatefulWidget {
  const EarningsPage({super.key});

  @override
  State<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Earnings")),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Earnings details yahan aayenge..."),
          ),
        ),
      ),
    );
  }
}
