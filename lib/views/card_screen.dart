import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rate;
  final String description;

  const CardScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        child: Image.network(image),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.pink),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rate,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 221, 169, 12),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
