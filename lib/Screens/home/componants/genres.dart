import 'package:flutter/material.dart';

import 'genre_cards.dart';

class Genre extends StatelessWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Action",
      "Adult",
      "Action & Adventure",
      "Animation",
      "Crime",
      "Comedy",
      "Documentary",
      "Dance",
      "Drama",
      "Family",
      "Fantasy",
      "Horror",
      "Romance",
      "Sci-Fi",
      "Science Fiction",
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, int index) => GenreCard(genre: genres[index])),
    );
  }
}
