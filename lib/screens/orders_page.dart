// lib/models/order_data.dart

class OrderItem {
  final String name;
  final String image;
  final String price;
  String status;
  DateTime orderedAt;

  OrderItem({
    required this.name,
    required this.image,
    required this.price,
    this.status = 'Confirmed',
    DateTime? orderedAt,
  }) : orderedAt = orderedAt ?? DateTime.now();

  void updateStatus() {
    final diff = DateTime.now().difference(orderedAt).inMinutes;

    if (diff >= 0 && diff < 2) {
      status = 'Confirmed';
    } else if (diff >= 2 && diff < 5) {
      status = 'Preparing';
    } else if (diff >= 5 && diff < 10) {
      status = 'Prepared - Collect at Counter';
    } else {
      status = 'Completed';
    }
  }
}

// Global order list (can later be replaced with Provider or database)
List<OrderItem> orders = [];
