import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/detail_row.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

class CompanyDetailsCard extends StatelessWidget {
  const CompanyDetailsCard({
    super.key,
    required this.store,
  });

  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(2, 4)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Company Details",
            style: TextStyles.font20BlackColorW500,
          ),
          const SizedBox(height: 16),

          DetailRow(label: "Brand Name", value: store.name),
          DetailRow(label: "Phone", value: store.phone),
          DetailRow(label: "Email", value: store.email ?? "—"),
          DetailRow(label: "Address", value: store.address ?? "—"),
          DetailRow(
            label: "Working Hours",
            value: store.workingHours ?? "—",
          ),
          DetailRow(
            label: "Total Products",
            value: store.totalProducts.toString(),
          ),
        ],
      ),
    );
  }
}
