import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloths_list/controllers/Store_controller.dart';
import 'package:cloths_list/models/store_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 213, 227),
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Consumer<StoreProvider>(
          builder: (context, provider, _) {
            if (provider.isloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.error.isNotEmpty) {
              return Center(
                child: Text(provider.error),
              );
            } else {
              return ListView.builder(
                itemCount: provider.storeList.length,
                itemBuilder: (context, index) {
                  final StoreModel store = provider.storeList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        store.title,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0), // Add space between title and subtitle
                        child: Text(
                          "\$${store.price.toString()}",
                          style: const TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      leading: SizedBox(
                        height: 60,
                        width: 70,
                        child: Image.network(store.image),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}