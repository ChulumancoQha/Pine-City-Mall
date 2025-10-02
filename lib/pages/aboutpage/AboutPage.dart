import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final String aboutText = """
Welcome to Pine City Mall 🌲 — the ultimate shopping and entertainment destination! 
Our mall offers a wide variety of shops, restaurants, and facilities to make your visit unforgettable.
Enjoy shopping, dining, movies, and family fun all in one place.
  """;

  final List<String> galleryImages = const [
    "https://via.placeholder.com/300x200.png?text=Mall+Exterior",
    "https://via.placeholder.com/300x200.png?text=Inside+View",
    "https://via.placeholder.com/300x200.png?text=Food+Court",
    "https://via.placeholder.com/300x200.png?text=Cinema",
    "https://via.placeholder.com/300x200.png?text=Shops",
    "https://via.placeholder.com/300x200.png?text=Events",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Pine City Mall"),
        backgroundColor: const Color(0xFF2C5F2D), // Pine Green
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://via.placeholder.com/600x200.png?text=Pine+City+Mall+Banner",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // About Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "About Us",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                aboutText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 10),

            // Gallery Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Gallery",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: galleryImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 images per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      galleryImages[index],
                      fit: BoxFit.cover,
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
