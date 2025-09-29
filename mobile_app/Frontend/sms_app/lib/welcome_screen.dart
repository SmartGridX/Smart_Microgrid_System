import 'package:flutter/material.dart';
import 'package:sms_app/auth-widgets/admin_sign_in.dart';
import 'package:sms_app/auth-widgets/user_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light mode background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Illustration Placeholder (replace with Image.asset or SVG)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ), // same radius as container
                    child: Image.network(
                      "https://energyfocus.the-eic.com/sites/default/files/web_p22-24_renewables_renewable-energy-illustration_credit_istock-1321094102.jpg",
                      fit: BoxFit.cover, // ensures it fills nicely
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // App Title & Subtext
                Column(
                  children: [
                    Text(
                      "🔋 SmartGridX",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Smart Microgrid Management System\nMonitor, optimize, and control microgrids in real time.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Navigate to Admin Sign In
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminSignInScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Admin Sign In",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Navigate to User Sign In
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserSignInScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "User Sign In",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
