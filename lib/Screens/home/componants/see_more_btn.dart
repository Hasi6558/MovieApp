import 'package:flutter/material.dart';

class SeeMoreBtn extends StatelessWidget {
  const SeeMoreBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Text(
                "See More",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Icon(Icons.arrow_circle_right_outlined)
          ],
        ),
      ),
    );
  }
}
