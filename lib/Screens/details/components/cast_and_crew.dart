import 'package:flutter/material.dart';
import 'package:movie_app/Screens/details/components/cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;
  const CastAndCrew({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 7, top: 14),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Cast & Crew",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(cast: casts[index]),
            ),
          )
        ],
      ),
    );
  }
}
