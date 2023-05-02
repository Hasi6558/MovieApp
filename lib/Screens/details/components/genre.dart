import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/Screens/home/componants/genre_cards.dart';

import '../../../models/movie.dart';

class Genre extends StatelessWidget {
  final Movie movie;
  const Genre({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
          height: 36,
          child: ListView.builder(
              itemCount: movie.genra.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GenreCard(
                    genre: movie.genra[index],
                  ))),
    );
  }
}
