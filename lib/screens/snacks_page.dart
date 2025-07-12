import 'package:flutter/material.dart';
import 'orders_page.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({super.key});

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  final List<Map<String, dynamic>> snackItems = [
    {
      'name': 'Samosa',
      'description': 'Crispy and spicy potato-filled snack.',
      'rating': 4.6,
      'image': 'assets/samosa.jpg',
      'time': '8-10 mins',
      'price': '₹15',
    },
    {
      'name': 'Veg Puff',
      'description': 'Flaky pastry filled with spicy vegetables.',
      'rating': 4.4,
      'image': 'assets/veg_puff.jpg',
      'time': '10-12 mins',
      'price': '₹20',
    },
    {
      'name': 'Pakoda',
      'description': 'Deep-fried crispy fritters made with gram flour.',
      'rating': 4.5,
      'image': 'assets/pakoda.jpg',
      'time': '12-15 mins',
      'price': '₹25',
    },
    {
      'name': 'Masala Tea',
      'description': 'Hot and spicy Indian-style tea with milk.',
      'rating': 4.9,
      'image': 'assets/masala_tea.jpg',
      'time': '5-7 mins',
      'price': '₹10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snacks'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: snackItems.length,
        itemBuilder: (context, index) {
          final item = snackItems[index];
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
                      backgroundColor: Colors.amber,
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
