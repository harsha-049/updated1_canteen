import 'package:flutter/material.dart';
import 'orders_page.dart'; // ✅ Make sure the path is correct

class BreakfastPage extends StatefulWidget {
  const BreakfastPage({super.key});

  @override
  State<BreakfastPage> createState() => _BreakfastPageState();
}

class _BreakfastPageState extends State<BreakfastPage> {
  final List<Map<String, dynamic>> breakfastItems = [
    {
      'name': 'Idli Sambar',
      'description': 'Steamed rice cakes served with hot sambar and coconut chutney.',
      'rating': 4.5,
      'image': 'assets/idli.jpg',
      'time': '10-15 mins',
      'price': '₹30',
    },
    {
      'name': 'Masala Dosa',
      'description': 'Crispy dosa filled with spicy potato masala.',
      'rating': 4.8,
      'image': 'assets/masala_dosa.jpg',
      'time': '15-20 mins',
      'price': '₹45',
    },
    {
      'name': 'Poha',
      'description': 'Flattened rice cooked with spices and vegetables.',
      'rating': 4.2,
      'image': 'assets/poha.jpg',
      'time': '10 mins',
      'price': '₹25',
    },
    {
      'name': 'Upma',
      'description': 'Savory semolina porridge with vegetables.',
      'rating': 4.0,
      'image': 'assets/upma.jpg',
      'time': '10-12 mins',
      'price': '₹25',
    },
    {
      'name': 'Aloo Paratha',
      'description': 'Stuffed flatbread with spiced potato filling served with curd.',
      'rating': 4.7,
      'image': 'assets/aloo_paratha.jpg',
      'time': '15-18 mins',
      'price': '₹35',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breakfast Menu'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: breakfastItems.length,
        itemBuilder: (context, index) {
          final item = breakfastItems[index];
          return GestureDetector(
            onTap: () => _showPaymentOptions(context, item),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Row(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      item['image'],
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['description'],
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '⏱ ${item['time']}   •   💰 ${item['price']}',
                            style: const TextStyle(fontSize: 13, color: Colors.black87),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                item['rating'].toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
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
