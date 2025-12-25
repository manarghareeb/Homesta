import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

class AddReviewSection extends StatefulWidget {
  const AddReviewSection({super.key});

  @override
  State<AddReviewSection> createState() => _AddReviewSectionState();
}

class _AddReviewSectionState extends State<AddReviewSection> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  late final TextEditingController reviewController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();

    reviewController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add your Review", style: TextStyles.font16BlackW500),
      
          Text(
            "Your email address will not be published, Required fields are market *  ",
            style: TextStyles.font12GreyColorW400,
          ),
          TitleToTextField(title: "Full Name"),
          CustomTextFieldWidget(
            controller: nameController,
            hintText: "",
            textInputType: TextInputType.text,
            title: "name",
          ),
          TitleToTextField(title: "Email"),
          CustomTextFieldWidget(
            controller: emailController,
            hintText: "",
            textInputType: TextInputType.text,
            title: "email",
          ),
          Text("Add detailed review", style: TextStyles.font16BlackW500),
          CustomTextFieldWidget(
            controller: reviewController,
            hintText: "Write Your Review",
            textInputType: TextInputType.text,
            title: "reviwe",
            maxLines: 5,
            fillColor: Color(0xFFD9D9D9),
            isFilled: true,
          ),
          SizedBox(height: 10,),
          CustomButtonWidget(buttonText: "Submit", onPressed: (){},minWidth: 164,raduis: 8,),
      
        ],
      ),
    );
  }
}
