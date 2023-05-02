import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Screens/home/componants/categories.dart';
import 'package:movie_app/Screens/home/componants/genres.dart';
import 'package:movie_app/Screens/home/componants/movie_card.dart';
import 'package:movie_app/Screens/home/componants/movie_carousel.dart';
import 'package:movie_app/Screens/home/componants/see_more_btn.dart';
import 'package:movie_app/models/movie.dart';
import 'dart:math' as math;

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryList(),
          Genre(),
          SizedBox(height: 14),
          MovieCarousel(),
          SeeMoreBtn(),
        ],
      ),
    );
  }
}
