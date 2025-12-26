import 'package:flutter/material.dart';

class ReviewPhotoList extends StatelessWidget {
  const ReviewPhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return      Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/images/catrgories_image/bedroom.png", fit: BoxFit.cover,)),
          );
        },
      ),
    );
  }
}