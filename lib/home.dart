import 'package:flutter/material.dart';
import './login.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Map<IconData, String> features = {
    Icons.camera_alt: 'Truy vết TSĐB',
    Icons.map: 'Bản đồ',
    Icons.list_rounded: 'Danh sách PTVT cần xử lý',
    Icons.notifications_rounded: 'Thông báo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          children: [
            for (final feature in features.entries)
              Card(
                color: Colors.purple[900],
                shadowColor: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        feature.key,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        feature.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
