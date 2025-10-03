import 'package:flutter/material.dart';

import '../individualshoppage/IndividualShopPage.dart';

class ListOfShopsPage extends StatelessWidget {
  const ListOfShopsPage({super.key});

  final Map<String, List<Map<String, String>>> shopCategories = const {
    "Clothing": [
      {
        "name": "Fashion Hub",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
      {
        "name": "Style Point",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
    ],
    "Electronics": [
      {
        "name": "Tech World",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
      {
        "name": "Gadget Store",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
    ],
    "Restaurants": [
      {
        "name": "Foodies Corner",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
      {
        "name": "Pizza Palace",
        "logo": "assets/images/ShopsPageBanner.jpg",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shops at Pine City Mall"),
        backgroundColor: const Color(0xFF2C5F2D),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: shopCategories.entries.map((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.key, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              ...category.value.map((shop) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      shop["logo"]!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      shop["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              IndividualShopPage(shopName: shop["name"]!),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}
