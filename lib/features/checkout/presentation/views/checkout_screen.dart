import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/checkout/presentation/views/payment_success__screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'credit_card';

  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  bool acceptTerms = false;
  bool requireInvoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Checkout',
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(42.w, 24.h),
                maximumSize: Size(42.w, 24.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: ColorManager.mainColor,
              ),
              child: Text(
                '10sn',
                style: TextStyles.font13BlackW500.copyWith(
                  color: ColorManager.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// USER INFO
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: const AssetImage(
                      'assets/images/image 1.png',
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Maram Ahmed',
                        style: TextStyles.font14BlackColorW400,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 14.w),
                          SizedBox(width: 4.w),
                          Text(
                            'Cairo, Egypt',
                            style: TextStyles.font14BlackColorW400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 14.w),
                          SizedBox(width: 4.w),
                          Text(
                            'Nov 23 - 22:00',
                            style: TextStyles.font14BlackColorW400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'Adult / A. Category / C Block',
                      style: TextStyles.font13BlackW500.copyWith(
                        color: ColorManager.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'x1',
                      style: TextStyles.font13BlackW500.copyWith(
                        color: ColorManager.blackColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              Divider(color: ColorManager.greyColor),
              SizedBox(height: 16.h),

              /// PAYMENT METHOD
              Text(
                'Payment Method',
                style: TextStyles.font16BlackRegular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),

              _buildPaymentOption(
                value: 'credit_card',
                title: 'Credit Card',
                trailing: _buildPaymentIcon('visa_mastercard'),
              ),
              SizedBox(height: 12.h),
              _buildPaymentOption(
                value: 'apple_pay',
                title: 'Apple Pay',
                trailing: _buildPaymentIcon('apple_pay'),
              ),
              SizedBox(height: 12.h),
              _buildPaymentOption(
                value: 'google_pay',
                title: 'Google pay',
                trailing: _buildPaymentIcon('google_pay'),
              ),
              SizedBox(height: 12.h),
              _buildPaymentOption(
                value: 'paypal',
                title: 'Paypal',
                trailing: _buildPaymentIcon('paypal'),
              ),

              /// CARD DETAILS
              if (selectedPaymentMethod == 'credit_card') ...[
                SizedBox(height: 24.h),
                Text(
                  'Card Holder Name',
                  style: TextStyles.font14BlackColorW400,
                ),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: cardHolderController,
                  hint: 'Enter name on card',
                ),
                SizedBox(height: 16.h),
                Text('Card Number', style: TextStyles.font14BlackColorW400),
                SizedBox(height: 8.h),
                _buildTextField(
                  controller: cardNumberController,
                  hint: '.... .... .... ....',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: expiryDateController,
                        hint: 'MM/YY',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildTextField(
                        controller: cvvController,
                        hint: '***',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],

              SizedBox(height: 24.h),

              _buildCheckbox(
                value: acceptTerms,
                text:
                    'I have read the preliminary information conditions and the distance sales agreement.',
                onChanged: (v) => setState(() => acceptTerms = v),
              ),
              SizedBox(height: 12.h),
              _buildCheckbox(
                value: requireInvoice,
                text: 'I require a corporate invoice.',
                onChanged: (v) => setState(() => requireInvoice = v),
              ),

              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$58,00',
                    style: TextStyles.font16BlackRegular.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        acceptTerms
                            ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PaymentSuccessScreen(),
                                ),
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C5F5D),
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.w,
                        vertical: 14.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text(
                      'Pay',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// PAYMENT OPTION (بدون بوردر)
  Widget _buildPaymentOption({
    required String value,
    required String title,
    required Widget trailing,
  }) {
    final bool isSelected = selectedPaymentMethod == value;

    return InkWell(
      onTap: () => setState(() => selectedPaymentMethod = value),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF4CAF50)
                          : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                      : null,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyles.font14BlackColorW400.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentIcon(String type) {
    switch (type) {
      case 'visa_mastercard':
        return Row(
          children: const [
            Text(
              'VISA',
              style: TextStyle(
                color: Color(0xFF1A1F71),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.circle, size: 14, color: Color(0xFFEB001B)),
            Icon(Icons.circle, size: 14, color: Color(0xFFF79E1B)),
          ],
        );
      case 'apple_pay':
        return Row(children: const [Icon(Icons.apple), Text(' Pay')]);
      case 'google_pay':
        return const Text(
          'G Pay',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      case 'paypal':
        return const Text(
          'PayPal',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required bool value,
    required String text,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (v) => onChanged(v ?? false),
          activeColor: const Color.fromARGB(255, 52, 199, 89),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyles.font13BlackW500.copyWith(
              color: ColorManager.blackColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}
