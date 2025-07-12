import 'package:flutter/material.dart';
import 'orders_page.dart'; // ✅ Ensure the path is correct

class DinnerPage extends StatefulWidget {
  const DinnerPage({super.key});

  @override
  State<DinnerPage> createState() => _DinnerPageState();
}

class _DinnerPageState extends State<DinnerPage> {
  final List<Map<String, dynamic>> dinnerItems = [
    {
      'name': 'Roti Sabzi',
      'description': 'Fresh rotis served with seasonal vegetables.',
      'rating': 4.4,
      'image': 'assets/roti_sabzi.jpg',
      'time': '10-15 mins',
      'price': '₹40',
    },
    {
      'name': 'Dal Khichdi',
      'description': 'Comforting dish made with rice, dal and mild spices.',
      'rating': 4.6,
      'image': 'assets/dal_khichdi.jpg',
      'time': '15-20 mins',
      'price': '₹50',
    },
    {
      'name': 'Egg Curry',
      'description': 'Boiled eggs simmered in spicy curry.',
      'rating': 4.5,
      'image': 'assets/egg_curry.jpg',
      'time': '12-18 mins',
      'price': '₹55',
    },
    {
      'name': 'Mixed Veg Curry',
      'description': 'A mix of vegetables in a rich gravy.',
      'rating': 4.2,
      'image': 'assets/mixed_veg.jpg',
      'time': '15-20 mins',
      'price': '₹45',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinner Items'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: dinnerItems.length,
        itemBuilder: (context, index) {
          final item = dinnerItems[index];
          return GestureDetector(
            onTap: () => _showPaymentSheet(context, item),
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
                      item['image'] as String,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      item['name'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['description'] as String),
                        const SizedBox(height: 4),
                        Text('⏱ ${item['time']}   •   💰 ${item['price']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 20),
                        Text('${item['rating']}'),
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

  void _showPaymentSheet(BuildContext context, Map<String, dynamic> item) {
    String selectedMethod = 'Google Pay';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Payment',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      setModalState(() => selectedMethod = value as String);
                    },
                    secondary: Image.asset('assets/gpay_icon.png', height: 24),
                  ),
                  RadioListTile(
                    title: const Text('PhonePe'),
                    value: 'PhonePe',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setModalState(() => selectedMethod = value as String);
                    },
                    secondary: Image.asset('assets/phonepe_icon.png', height: 24),
                  ),
                  RadioListTile(
                    title: const Text('Add new UPI ID'),
                    value: 'New UPI',
                    groupValue: selectedMethod,
                    onChanged: (value) {
                      setModalState(() => selectedMethod = value as String);
                    },
                    secondary: const Icon(Icons.add),
                  ),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      orders.add(OrderItem(
                        name: item['name'],
                        image: item['image'],
                        price: item['price'],
                      ));

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                          Text('Paid ${item['price']} via $selectedMethod'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: Colors.deepPurpleAccent,
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
