import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/company_details_card.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/skeletonizer_company_data.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_cubit.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetStoreBlocBuilder extends StatelessWidget {
  const GetStoreBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
  builder: (context, state) {
    if (state is GetStoreLoading) {
      return SkeletonizerCompanyData();
    }

    if (state is GetStoreError) {
      return Center(child: Text(state.message));
    }

    if (state is GetStoreSuccess) {
      return CompanyDetailsCard(
        store: state.storeEntity,
      );
    }

    return const SizedBox();
  },
);

  }
}