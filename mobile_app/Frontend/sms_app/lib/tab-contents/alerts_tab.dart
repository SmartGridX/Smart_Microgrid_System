import 'package:flutter/material.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({super.key});

  // Example alert data
  final List<Map<String, dynamic>> alerts = const [
    {
      "deviceName": "Battery Module 1",
      "title": "Overheating Detected",
      "description":
          "Temperature has reached 78°C. This may cause battery degradation or thermal runaway.",
      "solution":
          "Reduce load, check cooling fans, and inspect temperature sensors.",
      "severity": "Red",
      "timestamp": "10:45 AM",
    },
    {
      "deviceName": "Solar Inverter 2",
      "title": "Low Efficiency",
      "description":
          "Inverter efficiency dropped to 70%, below the optimal range of 85%-95%.",
      "solution":
          "Inspect solar panels for dirt or shading and check DC-AC conversion components.",
      "severity": "Yellow",
      "timestamp": "10:30 AM",
    },
    {
      "deviceName": "Wind Turbine 1",
      "title": "Generator Failure",
      "description":
          "The turbine generator stopped producing output due to a possible mechanical fault.",
      "solution":
          "Shut down turbine, check bearings and gearbox before restarting.",
      "severity": "Red",
      "timestamp": "9:58 AM",
    },
    {
      "deviceName": "Battery Module 3",
      "title": "Voltage Drop Detected",
      "description":
          "Battery voltage dropped by 20% suddenly, indicating a potential short circuit.",
      "solution": "Isolate battery and test cells for damage.",
      "severity": "Yellow",
      "timestamp": "9:50 AM",
    },
    {
      "deviceName": "Main Grid Connection",
      "title": "Grid Power Loss",
      "description":
          "The main grid is offline. Microgrid switched to islanding mode.",
      "solution":
          "Investigate upstream grid connection. Ensure backup generators are ready.",
      "severity": "Red",
      "timestamp": "9:45 AM",
    },
    {
      "deviceName": "Battery Module 2",
      "title": "High Internal Resistance",
      "description":
          "Battery internal resistance has increased, reducing storage capacity.",
      "solution": "Schedule maintenance and consider battery replacement.",
      "severity": "Yellow",
      "timestamp": "9:40 AM",
    },
    {
      "deviceName": "Solar Array 1",
      "title": "Dirty Panels Detected",
      "description":
          "Solar output dropped by 15% compared to expected production.",
      "solution": "Clean panels to restore full efficiency.",
      "severity": "Yellow",
      "timestamp": "9:25 AM",
    },
    {
      "deviceName": "Inverter 1",
      "title": "Overload Protection Triggered",
      "description":
          "Inverter shut down due to sudden surge beyond rated capacity.",
      "solution": "Check connected loads and restart inverter carefully.",
      "severity": "Red",
      "timestamp": "9:15 AM",
    },
    {
      "deviceName": "Transformer 1",
      "title": "Temperature Rising",
      "description":
          "Transformer temperature is approaching unsafe levels at 95°C.",
      "solution": "Reduce load and check cooling oil levels immediately.",
      "severity": "Yellow",
      "timestamp": "9:10 AM",
    },
    {
      "deviceName": "Control System",
      "title": "Communication Failure",
      "description":
          "Lost communication with Wind Turbine 2 and Battery Module 4.",
      "solution": "Check network switches and fiber connections.",
      "severity": "Red",
      "timestamp": "8:58 AM",
    },
    {
      "deviceName": "Battery Module 5",
      "title": "Imbalance Detected",
      "description":
          "One cell voltage differs significantly from others, causing inefficiency.",
      "solution": "Perform cell balancing cycle and monitor closely.",
      "severity": "Yellow",
      "timestamp": "8:40 AM",
    },
    {
      "deviceName": "Wind Turbine 2",
      "title": "Low Wind Speed Warning",
      "description":
          "Current wind speed is too low to generate power effectively.",
      "solution": "No action required. Monitor until conditions improve.",
      "severity": "Yellow",
      "timestamp": "8:25 AM",
    },
    {
      "deviceName": "Diesel Generator 1",
      "title": "Fuel Level Critical",
      "description":
          "Generator fuel level has dropped below 10%. Automatic shutdown imminent.",
      "solution": "Refill diesel tank immediately to avoid power loss.",
      "severity": "Red",
      "timestamp": "8:15 AM",
    },
    {
      "deviceName": "Solar Inverter 3",
      "title": "Harmonic Distortion",
      "description":
          "Detected harmonic distortion affecting output power quality.",
      "solution": "Inspect inverter filters and grounding system.",
      "severity": "Yellow",
      "timestamp": "8:05 AM",
    },
    {
      "deviceName": "Main Grid Connection",
      "title": "Voltage Fluctuation",
      "description":
          "Voltage fluctuations detected beyond safe tolerance limits.",
      "solution": "Contact utility provider and monitor for further spikes.",
      "severity": "Yellow",
      "timestamp": "7:55 AM",
    },
  ];

  Color _getSeverityColor(String severity) {
    if (severity == "Red") return const Color.fromARGB(255, 255, 22, 6);
    if (severity == "Yellow") return const Color.fromARGB(255, 255, 234, 0);
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];

          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: _getSeverityColor(alert['severity']),
                width: 2,
              ),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            child: ExpansionTile(
              collapsedIconColor: Colors.black,
              iconColor: Colors.black,
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Icon(
                alert['severity'] == "Red"
                    ? Icons.warning_amber_rounded
                    : Icons.info,
                color: _getSeverityColor(alert['severity']),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      alert['deviceName'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      alert['title'],
                      style: const TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      alert['timestamp'],
                      textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
              children: [
                const Divider(thickness: 1, color: Colors.black26),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        alert['description'],
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 12),

                      const Text(
                        "Solution:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        alert['solution'],
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Issue reported for ${alert['deviceName']}",
                                ),
                              ),
                            );
                          },
                          icon: Container(
                            width: 20, // Circle width
                            height: 20, // Circle height
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Hollow (no fill)
                              shape: BoxShape.circle, // Make it a circle
                              border: Border.all(
                              color: Colors.white, // Border color
                              width: 2, // Border thickness
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "•", // The centered dot
                                style: TextStyle(
                                  color: Colors.white, // Dot color
                                  fontSize: 10, // Adjust size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          label: const Text(
                            "Report Issue",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            side: BorderSide(
                              color: _getSeverityColor(alert['severity']),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
