import 'package:flutter/material.dart';
import 'login_page.dart';
import 'animated_hover_button.dart';
import 'register_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Top image
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/food_bowl.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Home Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),

            // Bottom content
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Canteen Food Delivery',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Life's too short for boring food",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // Login & Register buttons
                    Row(
                      children: [
                        Expanded(
                          child: AnimatedHoverButton(
                            text: "Login",
                            color: Colors.black,
                            destination: LoginPage(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AnimatedHoverButton(
                            text: "Register",
                            color: Colors.black,
                            destination: RegisterPage(), // TODO: Replace with RegisterPage()
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Google Login
                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          // TODO: Add Google login
                        },
                        icon: const Icon(Icons.g_mobiledata, color: Colors.black),
                        label: const Text(
                          "Login using Google",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.black12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
