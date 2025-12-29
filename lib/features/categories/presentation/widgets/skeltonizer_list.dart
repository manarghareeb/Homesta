import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonizerList extends StatelessWidget {
  const SkeltonizerList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Skeletonizer(
      enabled: true,
      child: ListView.builder(
                itemCount: 6, // عدد placeholders اللي عايزة تظهر
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.asset("assets/images/catrgories_image/electrical.png",
                      height: 142.h,
                      width: 100,
                      fit: BoxFit.cover,
                      )),
                  );
                },
              ),
    );
  }
}