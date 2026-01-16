import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:image_picker/image_picker.dart';

class SallerInfo extends StatelessWidget {
  const SallerInfo({super.key, required this.storeEntity});
final StoreEntity storeEntity;
  @override
  Widget build(BuildContext context) {
    return               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhotoProfile(onImageSelected: (XFile? p1) {  },),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      Text(
                        storeEntity.sellerName??"",
                        style: TextStyles.font16BlackRegular.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(storeEntity.name, style: TextStyles.font14GreyColorW400),
                    ],
                  ),
                ],
              );
  }
}