import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AddPhotoOrVideo extends StatelessWidget {
  const AddPhotoOrVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:Color(0xFFD9D9D9),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Image.asset("assets/images/camer.png"),
              Text(
                'Drag photo or video',
                style: TextStyles.font13LightGreyW500,
              ),
              Text("Browese", style: TextStyles.font16BlackW500.copyWith(color: ColorManager.primaryColor),),  SizedBox(height: 15,),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}