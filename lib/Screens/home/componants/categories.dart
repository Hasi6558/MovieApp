import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> mainCategories = [
    "dfsfsfsdfdsfsd",
    "Movies",
    "Tv Shows",
    "Top Movies",
    "Top TV Shows"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mainCategories.length,
          itemBuilder: ((context, index) => buildCategory(index, context))),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          children: [
            Text(
              mainCategories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == selectedCategory
                      ? Colors.black87
                      : Colors.grey.shade400),
            ),
            Container(
              height: 6,
              width: 40,
              margin: EdgeInsets.symmetric(vertical: 7.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? Colors.pinkAccent
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
