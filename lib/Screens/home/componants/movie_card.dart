import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Screens/details/detail_screen.dart';
import 'package:movie_app/models/movie.dart';

class Moviecard extends StatelessWidget {
  final Movie movie;

  const Moviecard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: OpenContainer(
          closedElevation: 0,
          openElevation: 0,
          closedBuilder: (context, action) => BuildMovieCard(context),
          openBuilder: (context, action) => DetailsScreen(
            movie: movie,
          ),
        ));
  }

  Column BuildMovieCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(movie.poster),
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/star_fill.svg",
              height: 20,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "${movie.rating}",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ],
    );
  }
}
