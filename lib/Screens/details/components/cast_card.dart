import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  final Map cast;
  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      width: 80,
      child: Column(children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                cast['image'],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.5,
        ),
        Text(
          cast['orginalName'],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
          maxLines: 2,
        ),
        SizedBox(
          height: 3.5,
        ),
        Text(
          cast['movieName'],
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ]),
    );
  }
}
