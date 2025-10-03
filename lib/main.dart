import 'package:flutter/material.dart';
import 'package:pinecitymall/pages/aboutpage/AboutPage.dart';
import 'package:pinecitymall/pages/contactpage/ContactPage.dart';
import 'package:pinecitymall/pages/homepage/HomePage.dart';
import 'package:pinecitymall/pages/listofshopspage/ListOfShopsPage.dart';
import 'package:pinecitymall/pages/mappage/MapPage.dart';
import 'package:pinecitymall/pages/moviespage/MoviesPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'dart:async';

// Import placeholders for other pages
// import 'package:pinecitymall/pages/shops/ShopsPage.dart';
// import 'package:pinecitymall/pages/movies/MoviesPage.dart';
// import 'package:pinecitymall/pages/map/MapPage.dart';
// import 'package:pinecitymall/pages/contact/ContactPage.dart';

Future<void> main() async {
  // Ensure Flutter is ready
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep the splash showing
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  // Initialize app
  await initialization();
}

Future initialization() async {
  // Simulate some startup delay (e.g., loading prefs, API calls, etc.)
  await Future.delayed(Duration(seconds: 5));  // 👈 adjust time here
  FlutterNativeSplash.remove();  // Remove splash after 5s
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pine City Mall',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: const Color(0xFF2C5F2D), // Pine Green
        hintColor: const Color(0xFFD4AF37), // Soft Gold
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const HomePage(),
    const ListOfShopsPage(),
    const MoviesPage(),
    const MapPage(),
    const ContactPage(),
    // const AboutPage(),
    // const ShopsPage(),
    // const MoviesPage(),
    // const MapPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2C5F2D), // Pine Green
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
