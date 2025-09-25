import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sms_app/auth-widgets/login_page.dart';
import 'package:sms_app/auth-widgets/register_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo + Animation
            Column(
              children: [
                const SizedBox(height: 40),
                FadeIn(
                  duration: const Duration(seconds: 2),
                  child: Center(
                    child: RotatingSvg(assetPath: 'assets/sms_logo.svg'),
                  ),
                ),

                SlideInLeft(
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                      fontSize: 22,
                      color: const Color.fromARGB(255, 255, 173, 66),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                JelloIn(
                  child: Text(
                    "MICROGRID MONITOR",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "CAMBRIA",
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 89, 255, 97),
                            const Color.fromARGB(255, 65, 255, 116),
                          ],
                        ).createShader(Rect.fromLTWH(0, 0, 300, 50)),
                    ),
                  ),
                ),
              ],
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {
                      // Navigate to LoginScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("Log in"),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    onPressed: () {
                      // Navigate to SignUpScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_add),
                    label: const Text("Sign up"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============== ROTATING SVG ANIMATION ===============
class RotatingSvg extends StatefulWidget {
  final String assetPath;
  final double size;

  const RotatingSvg({super.key, required this.assetPath, this.size = 200});

  @override
  State<RotatingSvg> createState() => _RotatingSvgState();
}

class _RotatingSvgState extends State<RotatingSvg>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // infinite rotation
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 2),
      child: RotationTransition(
        turns: _rotationController,
        child: SvgPicture.asset(
          widget.assetPath,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
