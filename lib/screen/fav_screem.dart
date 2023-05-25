import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/favorite.dart';

class Favorite extends StatelessWidget {
  Favorite({super.key});
  List<Favorites>? fav;

  static Color getcolor(String type) {
    switch (type) {
      case 'Grass':
        return Colors.greenAccent;
      case 'Fire':
        return Colors.redAccent;
      case 'Water':
        return Colors.blue;
      case 'Poison':
        return Colors.deepPurpleAccent;
      case 'Electric':
        return Colors.amber;
      case 'Rock':
        return Colors.grey;
      case 'Ground':
        return Colors.brown;
      case 'Psychic':
        return Colors.indigo;
      case 'Fighting':
        return Colors.orange;
      case 'Bug':
        return Colors.lightGreenAccent;
      case 'Ghost':
        return Colors.deepPurple;
      case 'Normal':
        return Colors.black26;
      default:
        return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('user')
        .doc(user!.email)
        .collection("items")
        .snapshots();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text("Favorites Pokemon")),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Text('Loading...');
                  }
                  if (snapshot.hasError) {
                    return const Text('Something went wrong.');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: getcolor(data.docs[index]['type'])),
                          child: Row(
                            children: [
                              Hero(
                                tag: index,
                                child: CachedNetworkImage(
                                    imageUrl: data.docs[index]['image'],
                                    height: 100,
                                    fit: BoxFit.fitHeight,
                                    placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(),
                                        )),
                              ),
                              Text(
                                data.docs[index]['name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "#" + data.docs[index]['num'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        );
                      }));
                }),
          )
        ],
      ),
    );
  }
}
