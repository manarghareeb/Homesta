import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/authentication/presentation/widgets/agree_terms_and_privacy.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/features/authentication/presentation/widgets/continue_with.dart';
import 'package:homesta/features/authentication/presentation/widgets/social_media_button.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theming/colors.dart';
import '../cubit/auth/auth_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  // الدور المختار
  String? selectedRole; // Admin, User, Seller

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 16.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text('Sign Up', style: TextStyles.font24BlackColorW500),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 52.5.w),
                child: Text(
                  'Fill your information below or register with your social account.',
                  style: TextStyles.font14GreyColorW400,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text("Admin"),
                    selected: selectedRole == "Admin",
                    onSelected: (val) {
                      setState(() => selectedRole = "Admin");
                    },
                    selectedColor: ColorManager.lightGreyColor,
                    backgroundColor: ColorManager.soLightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),
                    ),
                    labelStyle: TextStyle(
                      color: selectedRole == "Admin" ? ColorManager.primaryColor : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ChoiceChip(
                    label: const Text("User"),
                    selected: selectedRole == "User",
                    onSelected: (val) {
                      setState(() => selectedRole = "User");
                    },
                    selectedColor: ColorManager.lightGreyColor,
                    backgroundColor: ColorManager.soLightGreyColor,
                    shape: RoundedRectangleBorder(),
                    labelStyle: TextStyle(
                      color: selectedRole == "User" ? ColorManager.primaryColor : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ChoiceChip(
                    label: const Text("Seller"),
                    selected: selectedRole == "Seller",
                    onSelected: (val) {
                      setState(() => selectedRole = "Seller");
                    },
                    selectedColor: ColorManager.lightGreyColor,
                    backgroundColor: ColorManager.soLightGreyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),
                    ),
                    labelStyle: TextStyle(
                      color: selectedRole == "Seller" ? ColorManager.primaryColor : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    const TitleToTextField(title: 'First Name'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: firstNameController,
                      hintText: 'Enter First Name',
                      textInputType: TextInputType.name,
                      title: 'Enter First Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    const TitleToTextField(title: 'Last Name'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: lastNameController,
                      hintText: 'Enter Last Name',
                      textInputType: TextInputType.name,
                      title: 'Enter Last Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    const TitleToTextField(title: 'Email'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: emailController,
                      hintText: 'Enter Email',
                      textInputType: TextInputType.emailAddress,
                      title: 'Enter Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    const TitleToTextField(title: 'Password'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: 'Enter Password',
                      textInputType: TextInputType.text,
                      title: 'Enter Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),

                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        const AgreeTermsAndPrivacy(),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.response.message)),
                          );
                          GoRouter.of(context).push(AppRouter.loginScreen);
                        } else if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator();
                        }
                        return CustomButtonWidget(
                          buttonText: 'Sign Up',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (!isChecked) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("You must agree to the terms")),
                                );
                                return;
                              }

                              if (selectedRole == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please select a role")),
                                );
                                return;
                              }

                              List<Map<String, dynamic>> selectedRoles = [];
                              if (selectedRole == "Admin") {
                                selectedRoles.add({"id": "1", "roleName": "Admin", "isSelected": true});
                              }
                              if (selectedRole == "User") {
                                selectedRoles.add({"id": "2", "roleName": "User", "isSelected": true});
                              }
                              if (selectedRole == "Seller") {
                                selectedRoles.add({"id": "3", "roleName": "Seller", "isSelected": true});
                              }

                              context.read<AuthCubit>().register(
                                firstNameController.text.trim(),
                                lastNameController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                isChecked,
                                selectedRoles,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const ContinueWith(),
              SizedBox(height: 16.h),
              const SocialMediaButton(),
              SizedBox(height: 16.h),
              AuthNavigationText(
                text: 'Already have an account?',
                textButton: ' Sign In',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
