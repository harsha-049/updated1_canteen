import 'package:flutter/material.dart';
import 'orders_page.dart'; // ✅ Adjust the path if needed

class LunchPage extends StatefulWidget {
  const LunchPage({super.key});

  @override
  State<LunchPage> createState() => _LunchPageState();
}

class _LunchPageState extends State<LunchPage> {
  final List<Map<String, dynamic>> lunchItems = [
    {
      'name': 'Veg Thali',
      'description': 'A wholesome plate with rice, chapati, curry, dal & salad.',
      'rating': 4.5,
      'image': 'assets/lunch_veg_thali.jpg',
      'time': '20-25 mins',
      'price': '₹70',
    },
    {
      'name': 'Paneer Butter Masala',
      'description': 'Rich & creamy tomato-based curry with soft paneer.',
      'rating': 4.8,
      'image': 'assets/paneer_butter_masala.jpg',
      'time': '15-20 mins',
      'price': '₹80',
    },
    {
      'name': 'Chicken Biryani',
      'description': 'Spicy and flavorful rice dish with tender chicken.',
      'rating': 4.7,
      'image': 'assets/chicken_biryani.jpg',
      'time': '25-30 mins',
      'price': '₹100',
    },
    {
      'name': 'Curd Rice',
      'description': 'Comfort food made with rice and seasoned curd.',
      'rating': 4.3,
      'image': 'assets/curd_rice.jpg',
      'time': '10-15 mins',
      'price': '₹40',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lunch Items'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: lunchItems.length,
        itemBuilder: (context, index) {
          final item = lunchItems[index];
          return GestureDetector(
            onTap: () => _showPaymentOptions(context, item),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      item['image'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      item['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['description']),
                        const SizedBox(height: 4),
                        Text('⏱ ${item['time']}   •   💰 ${item['price']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        Text(item['rating'].toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPaymentOptions(BuildContext context, Map<String, dynamic> item) {
    String selectedMethod = 'Google Pay';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Payment',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Amount', style: TextStyle(fontSize: 16)),
                      Text(
                        item['price'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'UPI',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),

                  RadioListTile(
                    title: const Text('Google Pay'),
                    value: 'Google Pay',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() => selectedMethod = value as String);
                    },
                    secondary: Image.asset('assets/gpay_icon.png', height: 24),
                  ),
                  RadioListTile(
                    title: const Text('PhonePe'),
                    value: 'PhonePe',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() => selectedMethod = value as String);
                    },
                    secondary: Image.asset('assets/phonepe_icon.png', height: 24),
                  ),
                  RadioListTile(
                    title: const Text('Add new UPI ID'),
                    value: 'New UPI',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setState(() => selectedMethod = value as String);
                    },
                    secondary: const Icon(Icons.add),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      // ✅ Add order to list
                      orders.add(OrderItem(
                        name: item['name'],
                        image: item['image'],
                        price: item['price'],
                      ));

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Paid ${item['price']} via $selectedMethod')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Pay ${item['price']}'),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
