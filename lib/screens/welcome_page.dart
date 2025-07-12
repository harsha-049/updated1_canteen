import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.grey[50],
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/food_bowl.jpg', fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text('Welcome to Canteen Food Delivery', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())), child: const Text('Login'))),
                      const SizedBox(width: 16),
                      Expanded(child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage())), child: const Text('Register'))),
                    ],
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
