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
  final List<Map<String, dynamic>> menuItems = [
    {
      'image': 'assets/image/bakso_bakar.jpeg',
      'title': 'Bakso Bakar',
      'rating': '4.8',
      'time': '35 mnt',
      'views': '12,8 rb',
    },
    {
      'image': 'assets/image/salad buah.jpeg',
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
      'views': '14,3',
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
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Yummy Hari Ini'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        SizedBox(width: 10),
                        Text(
                          'Yummy Official',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
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
                        SizedBox(height: 4),
                        Text(
                          item['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            // Ikon bintang dan rating
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            SizedBox(width: 4),
                            Text(
                              item['rating'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),

                            // Menambahkan ikon jam dan waktu
                            Icon(Icons.access_time, size: 16), // Ikon jam
                            SizedBox(
                                width:
                                    4), // Jarak antara ikon jam dan teks waktu
                            Text(
                              item['time'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.remove_red_eye, size: 16),
                            SizedBox(width: 4),
                            Text(
                              item['views'],
                              style: TextStyle(fontSize: 12),
                            ),
                            Spacer(),
                            Icon(Icons.bookmark_border, size: 16),
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
