import 'package:flutter/material.dart';
import 'package:sms_app/widgets/feature_card.dart';
import 'package:sms_app/widgets/hompage_card.dart';

// Custom FeatureCard widget

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row
                Row(
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
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/3785079/pexels-photo-3785079.jpeg",
                        ),
                      ),
                    ),
                  ],
                ),

                // Location Row
                GestureDetector(
                  onTap: () {
                    print("Location tapped");
                  },
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
                ),

                // Search Bar
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
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
                ),

                // Features
                SizedBox(height: 20),
                Text(
                  "Features",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FeatureCard(
                        icon: Icons.battery_4_bar_sharp,
                        label: "Battery Health",
                        onTap: () {
                          print("Lighting tapped");
                        },
                      ),
                      SizedBox(width: 16),
                      FeatureCard(
                        icon: Icons.ac_unit,
                        label: "Efficiency",
                        onTap: () {
                          print("AC Control tapped");
                        },
                      ),
                      SizedBox(width: 16),
                      FeatureCard(
                        icon: Icons.cloud,
                        label: "Weather",
                        onTap: () {
                          print("Power Usage tapped");
                        },
                      ),
                      SizedBox(width: 16),
                      FeatureCard(
                        icon: Icons.wb_sunny,
                        label: "Forecast",
                        onTap: () {
                          print("Power Usage tapped");
                        },
                      ),
                      SizedBox(width: 16),
                      FeatureCard(
                        icon: Icons.currency_rupee,
                        label: "Earnings",
                        onTap: () {
                          print("Power Usage tapped");
                        },
                      ),
                    ],
                  ),
                ),

                // Today's Summary
                SizedBox(height: 20),
                Text(
                  "Today's Summary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),

                // GridView for HompageCard
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.3,
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
                ),

                // Energy Consumption Chart Placeholder
                SizedBox(height: 20),
                Text(
                  "Energy Consumption",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Energy Consumption Chart Placeholder",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
