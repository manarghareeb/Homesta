import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/product/presentation/widgets/product_info.dart';

class AProduct {
  final String name;
  final String image;
  final String price;
  final int stock;
  final String category;
  final String company;

  AProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.stock,
    required this.category,
    required this.company,
  });
}


class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AProduct> products = [
      AProduct(
        name: "Wingback Chair",
        image: "assets/images/chair.png",
        price: "\$160.00",
        stock: 30,
        category: "Chairs",
        company: "CasaLux",
      ),
      AProduct(
        name: "Ceramic Table Lamp",
        image: "assets/images/chair.png",
        price: "\$89.00",
        stock: 20,
        category: "Lamp",
        company: "CasaLux",
      ),
      AProduct(
        name: "Ergonomic Office Chair",
        image: "assets/images/chair.png",
        price: "\$399.00",
        stock: 15,
        category: "Office Storage",
        company: "CasaLux",
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Products'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  color: ColorManager.aliceBlue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product', style: TextStyles.font14PrimaryColorW400),
                    Text('Price', style: TextStyles.font14PrimaryColorW400),
                    Text('stock', style: TextStyles.font14PrimaryColorW400),
                    Text('Category', style: TextStyles.font14PrimaryColorW400),
                    Text('Company', style: TextStyles.font14PrimaryColorW400),
                    Text('Add', style: TextStyles.font14PrimaryColorW400),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.aliceBlue),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)
                  )
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ProductInfo(
                        productImage: item.image,
                        productName: item.name,
                        price: item.price,
                        stock: item.stock,
                        category: item.category,
                        company: item.company,
                      ),
                    );
                  },
                  separatorBuilder:
                      (context, index) =>
                          Divider(height: 1, color: ColorManager.lightGreyColor),
                  itemCount: products.length,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
