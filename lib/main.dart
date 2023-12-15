import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hw2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ponsan pattanakit'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> images = [
    {
      'url': 'assets/images/sakura.png',
      'description': 'ภาพของดอกซากุระที่ผลิบาน',
    },
    {
      'url': 'assets/images/border-collie.png',
      'description': 'ภาพของลูกสุนัข Bordercollie',
    },
    {
      'url': 'assets/images/Milky-Way.png',
      'description': 'ภาพของกาแล็กซีทางช้างเผือก',
    },
  ];

  late Random random;

  @override
  void initState() {
    super.initState();
    random = Random();
  }

  Map<String, String> getRandomImage() {
    final int randomNumber = random.nextInt(images.length);
    return images[randomNumber];
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> randomImage = getRandomImage();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 400, // กำหนดความกว้าง
                height: 400, 
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(randomImage['url']!),
                    fit: BoxFit.cover, // ทำให้รูปภาพที่อยู่ภายใน container ปรับขนาดให้พอดีกับ container
                  ),
                  borderRadius: BorderRadius.circular(12), // กำหนดขอบเขตของรูปให้เป็นสี่เหลี่ยมจัตุรัด
                ),
              ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                randomImage['description']!,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}