import 'package:flutter/material.dart';

// ---------------- Battery Page ----------------
class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battery Health")),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Battery details yahan aayenge..."),
          ),
        ),
      ),
    );
  }
}

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
      appBar: AppBar(title: const Text("Efficiency")),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Efficiency details yahan aayenge..."),
          ),
        ),
      ),
    );
  }
}

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
      appBar: AppBar(title: const Text("Weather")),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Weather details yahan aayenge..."),
          ),
        ),
      ),
    );
  }
}

// ---------------- Forecast Page ----------------
class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forecast")),
      body: const Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Forecast details yahan aayenge..."),
          ),
        ),
      ),
    );
  }
}

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
