import 'package:bankbapakmu/app/shared/color_theme.dart';
import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    Key? key,
    this.image = '',
    this.title = '',
  }) : super(key: key);
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  scale: 2,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: deepBlue,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
