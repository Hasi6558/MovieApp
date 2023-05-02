import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  const GenreCard({super.key, required this.genre});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left: 14),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3.5),
      child: Text(
        genre,
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
    );
  }
}
