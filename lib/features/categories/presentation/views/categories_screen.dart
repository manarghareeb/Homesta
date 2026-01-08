import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/widgets/category_bloc_builder.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // late stt.SpeechToText _speech;
  bool _isListening = false;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) {
  //         debugPrint('Speech status: $val');
  //         setState(() => _isListening = val == 'listening');
  //       },
  //       onError: (val) {
  //         debugPrint('Speech error: $val');
  //         setState(() => _isListening = false);
  //       },
  //     );

  //     if (available) {
  //       setState(() => _isListening = true);
  //       _speech.listen(
  //         onResult: (val) {
  //           setState(() {
  //             _searchController.text = val.recognizedWords;
  //           });
  //         },
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Voice recognition not available')),
  //       );
  //     }
  //   } else {
  //     setState(() => _isListening = false);
  //     _speech.stop();
  //   }
  // }

  @override
  void dispose() {
    _searchController.dispose();
    // _speech.stop();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryCubit>()..getCategories(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Categories', style: TextStyles.font24BlackColorW500),
              centerTitle: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(Duration(milliseconds: 500), () {
                        context.read<CategoryCubit>().search(value);
                      });
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyles.font14lightGreyColorW400,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorManager.lightGreyColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: ColorManager.lightGreyColor,
                        ),
                        onPressed: () {},
                      ),
                      filled: true,
                      fillColor: ColorManager.soLightGreyColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CategoryBlocBuilder(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
