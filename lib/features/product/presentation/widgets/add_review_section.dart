import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/snack_bar.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/product/domain/entities/params/add_review_params.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_state.dart';
import 'package:homesta/features/product/presentation/widgets/add_photo_or_video.dart';

class AddReviewSection extends StatefulWidget {
  const AddReviewSection({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<AddReviewSection> createState() => _AddReviewSectionState();
}

class _AddReviewSectionState extends State<AddReviewSection> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  late final TextEditingController reviewController;
  int _rating = 0;

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
      child: BlocConsumer<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          return Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add your Review", style: TextStyles.font16BlackW500),

              // Text(
              //   "Your email address will not be published, Required fields are market *  ",
              //   style: TextStyles.font12GreyColorW400,
              // ),

              // TitleToTextField(title: "Full Name"),
              // CustomTextFieldWidget(
              //   controller: nameController,
              //   hintText: "",
              //   textInputType: TextInputType.text,
              //   title: "name",
              // ),
              // TitleToTextField(title: "Email"),
              // CustomTextFieldWidget(
              //   controller: emailController,
              //   hintText: "",
              //   textInputType: TextInputType.text,
              //   title: "email",
              // ),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        _rating = index + 1; // من 1 لـ 5
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      size: 30,
                      color: index < _rating ? Colors.amber : Colors.grey,
                    ),
                  );
                }),
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
              SizedBox(height: 10),
              // Text("Add photo / video", style: TextStyles.font16BlackW500),
              // AddPhotoOrVideo(),
              CustomButtonWidget(
                buttonText: "Submit",
                onPressed: () {
                  if (_rating == 0) {
                    showSnackBar(context, "Please select rating");
                    return;
                  }
                  if (reviewController.text.isEmpty) {
                    showSnackBar(context, "Please enter review");
                    return;
                  }
                  BlocProvider.of<ReviewsCubit>(context).addReview(
                    params: AddReviewParams(
                      productId: widget.productEntity.productId,
                      userId: "0951da65-f160-412d-93cc-e62e2f1f1452",
                      storeId: widget.productEntity.storeId,
                      rating: _rating,
                      comment: reviewController.text.trim(),
                    ),
                  );
                },
                minWidth: 164,
                raduis: 8,
              ),
            ],
          );
        },
        listener: (BuildContext context, state) {
          if (state is AddReviewsSuccess) {
            showSnackBar(context, "review added successfully");
            BlocProvider.of<ReviewsCubit>(
              context,
            ).getReviews(productId: widget.productEntity.productId);
            _rating=0;
            reviewController.clear();
          }
          if (state is AddReviewsFailure) {
            showSnackBar(context, state.message);
          }
        },
      ),
    );
  }
}
