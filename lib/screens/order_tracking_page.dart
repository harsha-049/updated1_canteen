// lib/pages/order_tracking_page.dart

import 'package:flutter/material.dart';
import 'orders_page.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  @override
  void initState() {
    super.initState();
    _startStatusUpdates();
  }

  void _startStatusUpdates() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          for (var order in orders) {
            order.updateStatus();
          }
        });
        _startStatusUpdates(); // Repeat
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: orders.isEmpty
          ? const Center(
        child: Text(
          "No orders placed yet.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(order.name),
              subtitle: Text(order.status),
              trailing: Text(order.price),
            ),
          );
        },
      ),
    );
  }
}
