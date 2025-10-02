import 'package:flutter/material.dart';

class SingleMoviePage extends StatelessWidget {
  final Map<String, dynamic> movie;

  const SingleMoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
        backgroundColor: const Color(0xFF2C5F2D), // Pine Green
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie['poster'],
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              movie['title'],
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Actors & Age
            Text(
              "Main Actors: ${movie['actors']}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              "Age Restriction: ${movie['age']}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Synopsis
            Text(
              "Synopsis",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              movie['synopsis'] ?? "No synopsis available.",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // Showtimes
            Text(
              "Showtimes",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 10,
              children: (movie['showtimes'] as List<String>? ?? [])
                  .map((time) => Chip(
                label: Text(time),
                backgroundColor: const Color(0xFFE0E0E0),
              ))
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Optional Gallery
            if (movie['images'] != null && (movie['images'] as List).isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gallery",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (movie['images'] as List).length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              movie['images'][index],
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
