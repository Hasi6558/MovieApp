import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home/componants/movie_card.dart';
import 'package:movie_app/models/movie.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class MovieCarousel extends StatefulWidget {
  MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController = PageController();

  List<Movie> movies = [];

  int initialPage = 1;

  Future getData() async {
    final url = Uri.parse("https://filmszilla.lk/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll("div.data.dfeatur > h3 > a")
        .map((element) => element.innerHtml.trim())
        .toList();

    final posters = html
        .querySelectorAll("div.poster > img")
        .map((element) => element.attributes['src']!)
        .toList();

    final urls = html
        .querySelectorAll("div.data.dfeatur > h3 > a")
        .map((element) => element.attributes['href']!)
        .toList();

    setState(() {
      movies = List.generate(
          titles.length,
          (index) => Movie(
              poster: posters[index],
              backdrop: posters[index],
              title: titles[index],
              id: 1,
              year: 2023,
              numOfRatings: 12,
              criticsReview: 12,
              metascoreRating: 12,
              rating: 20.1,
              genra: [],
              plot: '',
              cast: [],
              url: urls[index]));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
            },
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            itemCount: movies.length,
            itemBuilder: (context, index) => buildMovieSlider(index)),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index.toDouble() - _pageController.page!.toDouble();
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
                angle: math.pi * value,
                child: Moviecard(
                  movie: movies[index],
                )),
          );
        },
      );
}
