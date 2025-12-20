import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderFlowScreen extends StatefulWidget {
  const OrderFlowScreen({super.key});

  @override
  State<OrderFlowScreen> createState() => _OrderFlowScreenState();
}

class _OrderFlowScreenState extends State<OrderFlowScreen> {
  int currentStep = 0;

  final List<String> steps = [
    "Order",
    "Location",
    "Payment",
    "Summary",
  ];

  final List<Widget> screens = [
    Center(child: Text("🛒 Enter Order Details")),
    Center(child: Text("📍 Choose Delivery Location")),
    Center(child: Text("💳 Select Payment Method")),
    Center(child: Text("✅ Order Summary")),
  ];

  Color get primaryColor => const Color(0xFF4A90E2);
  Color get inactiveColor => Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout Process"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // 🔹 Progress Bar with connecting lines
            SizedBox(
              height: 80.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Horizontal Line
                  Positioned(
                    top: 24.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: List.generate(steps.length - 1, (index) {
                        return Expanded(
                          child: Container(
                            height: 3.h,
                            color: index < currentStep
                                ? primaryColor
                                : inactiveColor,
                          ),
                        );
                      }),
                    ),
                  ),

                  // Step Circles + Labels
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(steps.length, (index) {
                      bool isActive = index == currentStep;
                      bool isCompleted = index < currentStep;

                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 18.r,
                            backgroundColor: isActive || isCompleted
                                ? primaryColor
                                : inactiveColor,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            steps[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isActive
                                  ? primaryColor
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // 🔹 Step content
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: screens[currentStep],
              ),
            ),

            // 🔹 Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() => currentStep--);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                    ),
                    child: const Text("Back"),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (currentStep < steps.length - 1) {
                      setState(() => currentStep++);
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check_circle,
                                  color: primaryColor, size: 60.sp),
                              SizedBox(height: 12.h),
                              const Text(
                                "Order Placed Successfully!",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8.h),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                ),
                                child: const Text("Done"),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    currentStep == steps.length - 1 ? "Finish" : "Next",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
