import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class CollectionCard extends StatelessWidget {
  final String title;
  final int savedCount;
  final List<String> thumbnails;

  const CollectionCard({
    super.key,
    required this.title,
    required this.savedCount,
    required this.thumbnails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              for (int i = 0; i < thumbnails.length; i += 2)
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Image.asset(
                            thumbnails[i],
                            height: (200.h / ((thumbnails.length / 2).ceil())),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      if (i + 1 < thumbnails.length)
                        Expanded(
                          child: ClipRRect(
                            child: Image.asset(
                              thumbnails[i + 1],
                              height:
                                  (200.h / ((thumbnails.length / 2).ceil())),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Text(title, style: TextStyles.font16BlackW500),
        Text("$savedCount Saved", style: TextStyles.font15GreyColorW400),
        SizedBox(height: 16.h),
      ],
    );
  }
}

//هاي بحالة الصورة صارلها تنقل او اكتر من اربع صور

// @override
// Widget build(BuildContext context) {
//   // نحدد الصور اللي رح تنعرض (أقصى 4)
//   final displayThumbnails = thumbnails.length > 4
//       ? thumbnails.sublist(0, 4)
//       : thumbnails;
//
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.all(12.w),
//         child: Column(
//           children: [
//             for (int i = 0; i < displayThumbnails.length; i += 2)
//               Padding(
//                 padding: EdgeInsets.only(bottom: 8.h),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: GestureDetector(
//                         onTap: () {
//                           // ✅ هنا بتحطي التنقل اللي بدك إياه
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => DetailsScreen(
//                                 imagePath: displayThumbnails[i],
//                               ),
//                             ),
//                           );
//                         },
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8.r),
//                           child: Image.asset(
//                             displayThumbnails[i],
//                             height: (200.h / ((displayThumbnails.length / 2).ceil())),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 8.w),
//                     if (i + 1 < displayThumbnails.length)
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => DetailsScreen(
//                                   imagePath: displayThumbnails[i + 1],
//                                 ),
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.r),
//                             child: Image.asset(
//                               displayThumbnails[i + 1],
//                               height: (200.h / ((displayThumbnails.length / 2).ceil())),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//
//       /// النصوص تحت الصور
//       Text(title, style: TextStyles.font16BlackW500),
//       Text("$savedCount Saved", style: TextStyles.font15GreyColorW400),
//       SizedBox(height: 16.h),
//
//       /// لو فيه صور زيادة نعرض زر أو Overlay
//       if (thumbnails.length > 4)
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => AllImagesScreen(images: thumbnails),
//               ),
//             );
//           },
//           child: Text("Show all (${thumbnails.length})"),
//         ),
//     ],
//   );
// }
