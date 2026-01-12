import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/seller/profile/presentation/views/widgets/create_store_form.dart';

class CreateStoreView extends StatelessWidget {
  const CreateStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text("Store Profile", style: TextStyles.font20BlackColorW500,),
              Text("tell us about your brand", style: TextStyles.font14GreyColorW400),
          
              CreateStoreForm(),
            ],
          ),
        ),
      ),
    );
  }
}