import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Screens/details/components/backdrop_rating.dart';
import 'package:movie_app/Screens/details/components/cast_and_crew.dart';
import 'package:movie_app/Screens/details/components/cast_card.dart';
import 'package:movie_app/Screens/details/components/genre.dart';
import 'package:movie_app/Screens/details/components/title_duration_fab_btn.dart';
import 'package:movie_app/Screens/home/componants/genre_cards.dart';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Body extends StatefulWidget {
  final Movie movie;

  const Body({super.key, required this.movie});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Movie innerMovie = Movie(
      url: '',
      poster: '',
      backdrop: '',
      title: '',
      id: 0,
      year: 200,
      numOfRatings: 0,
      criticsReview: 1,
      metascoreRating: 0,
      rating: 0.0,
      genra: [],
      plot: '',
      cast: [
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
        {
          "orginalName": "",
          "movieName": "",
          "image": "",
        },
      ]);
  Future getInnerData(String innerURl) async {
    final url = Uri.parse(innerURl);
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll("div.sheader > div.data > h1")
        .map((element) => element.innerHtml.trim())
        .toList();

    final actorsNames = html
        .querySelectorAll("div.data > div.name > a")
        .map((element) => element.innerHtml.trim())
        .toList();

    final actorsMovieNames = html
        .querySelectorAll("div.data > div.caracter")
        .map((element) => element.innerHtml.trim())
        .toList();
    final actorsImages = html
        .querySelectorAll("div.img > a > img")
        .map((element) => element.attributes['src']!)
        .toList();

    final ratings = html
        .querySelectorAll("div.starstruck-rating > span.dt_rating_vgs")
        .map((element) => element.innerHtml.trim())
        .toList();

    final posters = html
        .querySelectorAll("div.poster > img")
        .map((element) => element.attributes['src']!)
        .toList();

    setState(() {
      innerMovie.backdrop = posters[0];
      innerMovie.rating = double.parse(ratings[0]);
      innerMovie.title = titles[0];

      for (int i = 0; i < actorsNames.length; i++) {
        innerMovie.cast[i] = {
          "orginalName": actorsNames[i],
          "movieName": actorsMovieNames[i],
          "image": actorsImages[i],
        };
      }
    });

    print(innerMovie.title);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInnerData(widget.movie.url);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          BackdropAndRating(
            size: size,
            movie: innerMovie,
          ),
          TitleDurationAndFabBtn(
            movie: innerMovie,
          ),
          Genre(
            movie: innerMovie,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 14),
              child: Text(
                "Plot Summary",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              widget.movie.plot,
              style: TextStyle(color: Color(0xFF737599)),
            ),
          ),
          CastAndCrew(
            casts: innerMovie.cast,
          ),
        ],
      ),
    );
  }
}
