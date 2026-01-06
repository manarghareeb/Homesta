import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class StockInputField extends StatefulWidget {
  const StockInputField({super.key, this.initialStock, this.onChanged});
  final int? initialStock;
  final ValueChanged<int>? onChanged;

  @override
  State<StockInputField> createState() => _StockInputFieldState();
}

class _StockInputFieldState extends State<StockInputField> {
  late int stock;

  @override
  void initState() {
    super.initState();
    stock = widget.initialStock ?? 0;
  }

  void updateStock(int value) {
    setState(() {
      stock = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(stock);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Stok", style: TextStyles.font16GreyRegular),
          const SizedBox(height: 8),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$stock", style: TextStyles.font16GreyRegular),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => updateStock(stock + 1),
                      child: const Icon(Icons.arrow_drop_up, size: 18),
                    ),
                    GestureDetector(
                      onTap: () => updateStock(stock > 0 ? stock - 1 : 0),
                      child: const Icon(Icons.arrow_drop_down, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
