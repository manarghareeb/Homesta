import 'package:flutter/material.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/company_details_card.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerCompanyData extends StatelessWidget {
  const SkeletonizerCompanyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
    enabled: true,
    child: CompanyDetailsCard(
      store: StoreEntity(
        storeId: 0,
        name: "------",
        phone: "------",
        email: "------",
        address: "------",
        workingHours: "------",
        hasWhatsapp: false,
        hasSms: false,
        totalProducts: 0,
      ),
    ),
  );
  }
}