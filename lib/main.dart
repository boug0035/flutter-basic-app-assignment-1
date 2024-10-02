import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> remoteImages = [
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg',
    'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
  ];

  final List<String> localImages = [
    'assets/images/image-1.jpg',
    'assets/images/image-2.jpg',
    'assets/images/image-3.jpg',
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Flutter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // First horizontal ListView with remote images
            SizedBox(
              height: 200.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: remoteImages.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 16.0),
                itemBuilder: (context, index) {
                  return Image.network(remoteImages[index]);
                },
              ),
            ),

            const SizedBox(height: 24.0),

            // Four ListTile widgets with different font variants
            const ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Regular Font Weight',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text(
                'Bold Font Weight',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text(
                'Italic Font Style',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'System Default Font',
                style: TextStyle(fontFamily: 'Arial'),
              ),
            ),

            const SizedBox(height: 24.0),

            // Second horizontal ListView with local images
            SizedBox(
              height: 200.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: localImages.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 16.0),
                itemBuilder: (context, index) {
                  return Image.asset(localImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
