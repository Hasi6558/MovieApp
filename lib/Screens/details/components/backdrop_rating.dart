import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/models/movie.dart';

class BackdropAndRating extends StatelessWidget {
  final Movie movie;
  final Size size;
  const BackdropAndRating({
    super.key,
    required this.size,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                image: NetworkImage(movie.backdrop),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Color(0xFF121530).withOpacity(0.2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/star_fill.svg"),
                          SizedBox(
                            height: 3.5,
                          ),
                          RichText(
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${movie.rating}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                  text: "10\n",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "150/212",
                                  style: TextStyle(color: Colors.black38)),
                            ],
                          ))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/star.svg"),
                          SizedBox(height: 3.4),
                          Text("Rate This",
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Color(0xFF51CF66),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              "${movie.metascoreRating}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 3.5,
                          ),
                          Text(
                            "Metascore",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "62 critic reviews",
                            style: TextStyle(color: Colors.black38),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
          SafeArea(child: BackButton())
        ],
      ),
    );
  }
}
