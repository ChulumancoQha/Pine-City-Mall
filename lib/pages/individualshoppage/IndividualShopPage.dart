import 'package:flutter/material.dart';

class IndividualShopPage extends StatelessWidget {
  final String shopName;

  const IndividualShopPage({super.key, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
        backgroundColor: const Color(0xFF2C5F2D),
      ),
      body: Center(
        child: Text(
          "Details for $shopName will be here",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
