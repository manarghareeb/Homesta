import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/search/presentation/views/cubit/cubit/search_cubit.dart';
import 'package:homesta/features/search/presentation/widgets/search_bloc_builder.dart';
import 'package:homesta/features/search/presentation/widgets/search_empty_state.dart';
import 'package:homesta/features/search/presentation/widgets/search_populated_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../core/theming/styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool get _isSearching => _searchController.text.isNotEmpty;
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allCategories = [
    {
      'title': 'Electrical Appliances',
      'image': 'assets/images/catrgories_image/electrical.png',
    },
    {
      'title': 'Bedrooms',
      'image': 'assets/images/catrgories_image/bedroom.png',
    },
    {
      'title': 'Living Room',
      'image': 'assets/images/catrgories_image/livingroom.png',
    },
    {'title': 'Kitchen', 'image': 'assets/images/catrgories_image/kitchen.png'},
    {
      'title': 'Medical Devices',
      'image': 'assets/images/catrgories_image/medical.png',
    },
    {
      'title': 'Home Tools',
      'image': 'assets/images/catrgories_image/tools.png',
    },
  ];

  List<Map<String, String>> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _filteredCategories = _allCategories;
    _searchController.addListener(_filterCategories);
    _speech = stt.SpeechToText();
  }

  void _filterCategories() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCategories =
          _allCategories.where((category) {
            return category['title']!.toLowerCase().contains(query);
          }).toList();
    });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          debugPrint('Speech status: $val');
          setState(() => _isListening = val == 'listening');
        },
        onError: (val) {
          debugPrint('Speech error: $val');
          setState(() => _isListening = false);
        },
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _searchController.text = val.recognizedWords;
              _filterCategories();
            });
          },
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Voice recognition not available')),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductCubit>()..getAllProducts(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],

    

      child: Scaffold(
        appBar: AppBar(
          title: Text('Search', style: TextStyles.font24BlackColorW500),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      final res=BlocProvider.of<ProductCubit>(context).allProducts;
                      context.read<SearchCubit>().search(res,value);
                    },
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
                        onPressed: _listen,
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
                  // Expanded(
                  //   child:
                  //       _isSearching
                  //           ? const SearchPopulatedState()
                  //           : const SearchEmptyState(),
                  // ),
                  SearchBlocBuilder()
            
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
