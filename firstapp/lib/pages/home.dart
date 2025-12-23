import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          MyBox(
            "https://cdn.pixabay.com/photo/2015/05/15/02/07/computer-767781_1280.jpg",
            "What is a computer?",
            "A computer is a machine used to calculate data and perform many other tasks such as storing information and processing data.",
          ),
          const SizedBox(height: 24),

          MyBox(
            "https://tse3.mm.bing.net/th/id/OIP.uUYae2Owmp6KLDMgbE0npgHaEo",
            "What is Flutter?",
            "Flutter is a framework used to create mobile applications. It allows developers to build Android and iOS apps using a single codebase.",
          ),
          const SizedBox(height: 24),

          MyBox(
            "https://tse3.mm.bing.net/th/id/OIP.YISSk4gkvtyenmEXj5tVsgHaE8",
            "What is Dart?",
            "Dart is the programming language used in Flutter to build mobile applications.",
          ),
        ],
      ),
    );
  }

  Widget MyBox(String imageUrl, String title, String content) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
