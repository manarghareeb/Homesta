import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_cubit.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_state.dart';
import 'package:homesta/features/seller/profile/presentation/views/widgets/saller_info.dart';

class SallerInfoBlocBuilder extends StatelessWidget {
  const SallerInfoBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
  builder: (context, state) {
    if (state is GetStoreLoading) {
      return SallerInfo(storeEntity: StoreEntity(storeId: 0, name: "name", phone: "phone", email: "email", address: "address", workingHours: "workingHours"),);
    }

    if (state is GetStoreError) {
      return Center(child: Text(state.message));
    }

    if (state is GetStoreSuccess) {
      return SallerInfo(
        storeEntity: state.storeEntity,
      );
    }

    return const SizedBox();
  },
);

  }
}