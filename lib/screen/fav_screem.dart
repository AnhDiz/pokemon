import 'package:flutter/material.dart';
import '../model/favorite.dart';

class Favorite extends StatelessWidget {
  Favorite({super.key});
  List<Favorites>? fav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 5,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          SingleChildScrollView(
            child: Column(),
          )
        ],
      ),
    );
  }
}
