import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> specialOffers = const [
    {
      "store": "Fashion Hub",
      "offer": "Up to 50% off on summer collection",
      "image": "assets/images/HomePageBanner.jpg"
    },
    {
      "store": "Tech World",
      "offer": "Buy 1 Get 1 Free on select accessories",
      "image": "assets/images/HomePageBanner.jpg"
    },
    {
      "store": "Foodies Corner",
      "offer": "20% discount on family meals",
      "image": "assets/images/HomePageBanner.jpg"
    },
    {
      "store": "Book Haven",
      "offer": "30% off on bestsellers",
      "image": "assets/images/HomePageBanner.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pine City Mall"),
        backgroundColor: const Color(0xFF2C5F2D), // Pine Green
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mall Banner
            Container(
              width: double.infinity,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://via.placeholder.com/600x200.png?text=Pine+City+Mall",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Special Offers",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 10),

            // Special Offers List
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialOffers.length,
                itemBuilder: (context, index) {
                  final offer = specialOffers[index];
                  return Container(
                    width: 180,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Offer Image
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.asset(
                              offer["image"]!,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  offer["store"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  offer["offer"]!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
