import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/models/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  final Movie movie;
  const TitleDurationAndFabBtn({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "${movie.year}",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "PG-13",
                    style: TextStyle(color: Colors.black38),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "2h 32min",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              )
            ],
          )),
          SizedBox(
              height: 64,
              width: 64,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: Icon(Icons.add),
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ))
        ],
      ),
    );
  }
}
