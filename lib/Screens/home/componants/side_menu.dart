import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selecredcategory2 = 0;
  List<String> subMovieCategories = [
    "English",
    "Tamil",
    "Telugu",
    "Kannada",
    "Bengali",
    "Sinhala",
    "Italian",
    "Romanian",
    "Thai",
  ];

  List<String> subTvSeriesCategories = [
    "English",
    "Japanese",
    "Hindi",
    "Tamil",
  ];

  buildListTile(String t1) {
    return InkWell(
      child: ListTile(
        title: Text(
          t1,
          style: TextStyle(color: Colors.black87),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              ExpansionTile(
                title: Text("Movies"),
                children: [
                  buildListTile("English"),
                  buildListTile("Tamil"),
                  buildListTile("Telugu"),
                  buildListTile("Kannada"),
                  buildListTile("Bengali"),
                  buildListTile("Sinhala"),
                  buildListTile("Italian"),
                  buildListTile("Romanian"),
                  buildListTile("Thais"),
                ],
              ),
              ExpansionTile(
                title: Text("Tv Series"),
                children: [
                  buildListTile("English"),
                  buildListTile("Japanese"),
                  buildListTile("Hindi"),
                  buildListTile("Tamil"),
                ],
              ),
              buildListTile("Movie Request"),
            ],
          ),
        ),
      ),
    );
  }
}
