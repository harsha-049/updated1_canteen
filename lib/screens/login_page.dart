import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'starting_page.dart'; // Make sure StartPage is defined in this file

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700)),
            const SizedBox(height: 8),
            Text("Login to continue using the app",
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),

            // Email Field
            const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: const Icon(Icons.person_outline),
              ),
            ),

            const SizedBox(height: 16),

            // Password Field
            const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: "Enter password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(color: Colors.grey[600])),
              ),
            ),

            // Login Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Login", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                const Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("or", style: TextStyle(color: Colors.grey)),
                ),
                const Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 16),

            // Google Login
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Implement Google login logic here
                },
                icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
                label: const Text("Login using Google",
                    style: TextStyle(color: Colors.black)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.grey.shade300),
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
            ),

            const Spacer(),

            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to register page here
                },
                child: const Text("Don’t have an account? Register",
                    style: TextStyle(color: Colors.deepPurple)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
