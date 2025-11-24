import 'package:go_router/go_router.dart';
import 'package:homesta/features/account/presentation/views/edit_profile_screen.dart';
import 'package:homesta/features/account/presentation/views/help_center_screen.dart';
import 'package:homesta/features/account/presentation/views/my_order_screen.dart';
import 'package:homesta/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/login_screen.dart';
import 'package:homesta/features/authentication/presentation/views/signup_screen.dart';
import 'package:homesta/features/home/presentation/views/home.dart';
import 'package:homesta/features/home/presentation/views/product_details_screen.dart';

abstract class AppRouter {
  static final loginScreen = '/loginScreen';
  static final signUpScreen = '/signUpScreen';
  static final forgetPasswordScreen = '/forgetPasswordScreen';
  static final editProfileScreen = '/editProfileScreen';
  static final myOrderScreen = '/myOrderScreen';
  static final helpCenterScreen = '/helpCenterScreen';
  static final productDetailsScreen = '/productDetailsScreen';

  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeView()),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: myOrderScreen,
        builder: (context, state) => const MyOrderScreen(),
      ),
      GoRoute(
        path: helpCenterScreen,
        builder: (context, state) => const HelpCenterScreen(),
      ),
      GoRoute(
        path: productDetailsScreen,
        builder: (context, state) => const ProductDetailsScreen(),
      ),
    ],
  );
}
