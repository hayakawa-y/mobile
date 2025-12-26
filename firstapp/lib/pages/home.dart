import 'package:flutter/material.dart';
import 'package:firstapp/pages/detail.dart';
import 'dart:convert';

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
      child: FutureBuilder(
        builder: (context, snapshot){
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(itemBuilder: (BuildContext context, int index){
            return MyBox(data[index]['image_url'],data[index]['title'],data[index]['subtitle']);
          },
          itemCount: data.length,);
        },
        future:DefaultAssetBundle.of(context).loadString('assets/data.json')
      )
    );
  }

  Widget MyBox(String imageUrl, String title, String image_url) {
    return Container(
      margin: EdgeInsets.only(top:20),
      padding:EdgeInsets.all(20),
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
            image_url,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              print("next page >>");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ),
              );
            },
            child: const Text(
              "read more",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}