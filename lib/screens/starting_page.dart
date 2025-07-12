import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'animated_hover_button.dart';
import '../widgets/meal_card.dart';
import 'breakfast_page.dart'; // Update path as needed
import 'lunch_page.dart'; // Add this import
import 'snacks_page.dart';
import 'dinner_page.dart';
import 'order_tracking_page.dart'; // ✅ Import added
import 'orders_page.dart'; // ✅ If needed

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ✅ Conditional body based on selected index
      body: SafeArea(
        child: _selectedIndex == 0
            ? Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search meals, items...",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.tune),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),

            // Top Banner
            Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/food_bowl.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to Canteen!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Meal Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Meals",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    // Meal Cards
                    Expanded(
                      child: ListView(
                        children: [
                          MealCard(
                            title: 'Breakfast',
                            icon: Icons.free_breakfast,
                            color: Colors.orange,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const BreakfastPage(),
                                ),
                              );
                            },
                          ),
                          MealCard(
                            title: 'Lunch',
                            icon: Icons.lunch_dining,
                            color: Colors.green,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LunchPage(),
                                ),
                              );
                            },
                          ),
                          MealCard(
                            title: 'Snacks',
                            icon: Icons.fastfood,
                            color: Colors.blue,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SnacksPage()),
                              );
                            },
                          ),
                          MealCard(
                            title: 'Dinner',
                            icon: Icons.dinner_dining,
                            color: Colors.purple,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const DinnerPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
            : const OrderTrackingPage(), // ✅ Show order tracking when index == 1
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'Bookmark'),
        ],
      ),
    );
  }
}
