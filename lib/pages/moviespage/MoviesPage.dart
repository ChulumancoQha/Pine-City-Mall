import 'package:flutter/material.dart';
import '../singlemoviepage/SingleMoviePage.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  final List<Map<String, String>> movies = const [
    {
      "title": "The Adventure",
      "poster": "https://via.placeholder.com/100x150.png?text=Adventure",
      "actors": "John Doe, Jane Smith",
      "age": "PG-13",
    },
    {
      "title": "Space Odyssey",
      "poster": "https://via.placeholder.com/100x150.png?text=Space+Odyssey",
      "actors": "Alice Green, Bob Brown",
      "age": "PG",
    },
    {
      "title": "Mystery Manor",
      "poster": "https://via.placeholder.com/100x150.png?text=Mystery+Manor",
      "actors": "Carol White, Dave Black",
      "age": "R",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Now Showing"),
        backgroundColor: const Color(0xFF2C5F2D), // Pine Green
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie["poster"]!,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Actors: ${movie["actors"]!}\nAge: ${movie["age"]!}"),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SingleMoviePage(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
