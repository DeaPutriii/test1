import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> menuItems = [
    {
      'image': 'assets/image/bakso_bakar.jpeg',
      'title': 'Bakso Bakar',
      'rating': '4.8',
      'time': '35 mnt',
      'views': '12,8 rb',
    },
    {
      'image': 'assets/image/Salad.jpeg',
      'title': 'Salad Buah',
      'rating': '4.5',
      'time': '30 mnt',
      'views': '13 rb',
    },
    {
      'image': 'assets/image/Sate.jpeg',
      'title': 'Sate',
      'rating': '4.4',
      'time': '38 mnt',
      'views': '14,3 rb',
    },
    {
      'image': 'assets/image/gacoan.jpeg',
      'title': 'Mie Gacoan',
      'rating': '4.7',
      'time': '32 mnt',
      'views': '2,5 rb',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assigning the key to Scaffold
      appBar: AppBar(
        title: const Text('Menu Yummy Hari Ini'),
        centerTitle: true,
        // Button to open the drawer
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Opens the drawer
          },
        ),
      ),
      // Drawer with logo
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/image/yummy.jpg'), // Your image path
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/image/settings.jpg'), // Your image path
              ),
              title: const Text('Settings'),
              onTap: () {
                // Logic to navigate to the settings page
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/image/about.jpg'), // Your image path
              ),
              title: const Text('About'),
              onTap: () {
                // Logic to navigate to the about page
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return Card(
              color: Colors.blue.shade50,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/image/Yummy.jpeg',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Yummy Official',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      item['image'],
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              item['rating'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.access_time, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              item['time'],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              item['views'],
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Spacer(),
                            const Icon(Icons.bookmark_border, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
