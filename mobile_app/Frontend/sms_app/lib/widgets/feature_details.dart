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
                  child: _healthCard("Invt Health", "Good", Colors.green),
                ),
                const SizedBox(width: 16),
                Expanded(child: _healthCard("Trans", "Critical", Colors.red)),
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
        const Icon(
          Icons.warning,
          color: Color.fromARGB(255, 125, 152, 4),
          size: 28,
        ),
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

Widget _healthCard(String title, String? status, Color color) {
  return Expanded(
    child: Container(
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
              const Text(
                "Daily Forecast",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),

              _dailyForecastTableHeader(),
              _dailyForecastRow(
                "Yesterday",
                "Cloudy",
                Icons.wb_cloudy,
                "32° / 26°",
                "5.1 kWh",
              ),
              _dailyForecastRow(
                "Today",
                "Sunny",
                Icons.wb_sunny,
                "32° / 25°",
                "6.2 kWh",
              ),
              _dailyForecastRow(
                "Wednesday",
                "Cloudy",
                Icons.cloud,
                "32° / 24°",
                "4.9 kWh",
              ),
              _dailyForecastRow(
                "Thursday",
                "Sunny",
                Icons.wb_sunny,
                "32° / 25°",
                "6.5 kWh",
              ),
              _dailyForecastRow(
                "Friday",
                "Partly Cloudy",
                Icons.wb_cloudy,
                "34° / 26°",
                "5.8 kWh",
              ),
              _dailyForecastRow(
                "Saturday",
                "Sunny",
                Icons.wb_sunny,
                "34° / 26°",
                "7.1 kWh",
              ),
              _dailyForecastRow(
                "Sunday",
                "Rain",
                Icons.beach_access,
                "34° / 26°",
                "3.6 kWh",
              ),
              _dailyForecastRow(
                "Monday",
                "Storm",
                Icons.bolt,
                "32° / 25°",
                "2.8 kWh",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Daily Forecast Header ----------------
Widget _dailyForecastTableHeader() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(
          width: 100,
          child: Text(
            "Day",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            "Temp",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            "Energy",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

// ---------------- Daily Forecast Row ----------------
Widget _dailyForecastRow(
  String day,
  String desc,
  IconData icon,
  String temp,
  String energy,
) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: 100,
          child: Row(
            children: [
              Icon(icon, size: 20, color: Colors.orange),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  desc,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            temp,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(energy, style: const TextStyle(color: Colors.green)),
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

// -------------------------------------------------
// ---------------- Earnings Page ----------------

class EarningsPage extends StatefulWidget {
  const EarningsPage({super.key});

  @override
  State<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  final List<Map<String, dynamic>> transactions = [
    {
      "buyer": "User A",
      "energy": 5.0, // kWh
      "status": "Paid",
      "date": "23 Sep 2025",
    },
    {
      "buyer": "User B",
      "energy": 3.2,
      "status": "Pending",
      "date": "22 Sep 2025",
    },
  ];

  final double standardRate = 50; // ₹ per kWh

  @override
  Widget build(BuildContext context) {
    // Total energy generated
    double totalGeneration = transactions.fold(
      0.0,
      (sum, tx) => sum + (tx['energy'] as double),
    );

    // Total earnings based on standard rate
    double totalEarnings = totalGeneration * standardRate;

    return Scaffold(
      appBar: AppBar(title: const Text("Earnings")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- Generation & Standard Rate Card ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Energy Generated",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${totalGeneration.toStringAsFixed(2)} kWh",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Standard Rate: ₹$standardRate / kWh",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Total Earnings: ₹${totalEarnings.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ---------------- Transaction Summary Card ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Surplus Sold: ${totalGeneration.toStringAsFixed(2)} kWh",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Pending Payments: ${transactions.where((tx) => tx['status'] == 'Pending').length}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ---------------- Transactions List ----------------
            const Text(
              "Transaction History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tx = transactions[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.flash_on, color: Colors.orange),
                    title: Text("${tx['buyer']} - ${tx['energy']} kWh"),
                    subtitle: Text(
                      "Date: ${tx['date']} • Rate: ₹$standardRate/kWh",
                    ),
                    trailing: Text(
                      tx['status'].toString(),
                      style: TextStyle(
                        color: tx['status'] == 'Paid'
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
