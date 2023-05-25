import 'package:cloud_firestore/cloud_firestore.dart';

class Favorites {
  String? id;
  String name, image, num, color;

  Favorites(
      {this.id,
      required this.image,
      required this.name,
      required this.num,
      required this.color});
}
