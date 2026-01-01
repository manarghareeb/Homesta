import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/features/account/presentation/views/contact_us_screen.dart';
import 'package:homesta/features/account/presentation/views/customer_support_screen.dart';
import 'package:homesta/features/account/presentation/views/edit_profile_screen.dart';
import 'package:homesta/features/account/presentation/views/faqs_screen.dart';
import 'package:homesta/features/account/presentation/views/help_center_screen.dart';
import 'package:homesta/features/account/presentation/views/logout_screen.dart';
import 'package:homesta/features/account/presentation/views/manage_address_screen.dart';
import 'package:homesta/features/account/presentation/views/my_order_screen.dart';
import 'package:homesta/features/account/presentation/views/password_manager_screen.dart';
import 'package:homesta/features/cart/presentation/views/empty_cart_screen.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/chat/data/models/chat_message_model.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';
import 'package:homesta/features/chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:homesta/features/chat/presentation/views/chat_message_screen.dart';
import 'package:homesta/features/order/presentation/views/track_order_details_screen.dart';
import 'package:homesta/features/order/presentation/views/track_your_order_screen.dart';
import 'package:homesta/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:homesta/features/payment/presentation/views/payment_account_screen.dart';
import 'package:homesta/features/account/presentation/views/privacy_policy_screen.dart';
import 'package:homesta/features/account/presentation/views/setting_screen.dart';
import 'package:homesta/features/authentication/presentation/views/add_new_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/login_screen.dart';
import 'package:homesta/features/authentication/presentation/views/set_new_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/signup_screen.dart';
import 'package:homesta/features/authentication/presentation/views/verification_screen.dart';
import 'package:homesta/features/cart/presentation/views/wishlist_screen.dart';
import 'package:homesta/features/categories/presentation/views/category_section_screen.dart';
import 'package:homesta/features/chat/presentation/views/chat_screen.dart';
import 'package:homesta/features/order/presentation/views/order_flow_screen.dart';
import 'package:homesta/features/home/presentation/views/home.dart';
import 'package:homesta/features/notification/presentaion/views/notification.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/product/presentation/views/product_details_view.dart';
import '../../features/account/presentation/views/account_screen.dart';
import '../../features/account/presentation/views/add_review.dart';
import '../../features/account/presentation/views/invoice.dart';
import '../../features/account/presentation/views/my_collections_screen.dart';
import '../../features/cart/presentation/views/cart_screen.dart';
import '../../features/categories/presentation/views/SubCategoriesScreen.dart';
import '../../features/notification/presentaion/views/notification_empty_screen.dart';
import '../../features/order/presentation/views/seller_screen.dart';
import '../../features/search/presentation/views/search_screen.dart';
import '../../features/shop/presentation/view/shop_screen.dart';

abstract class AppRouter {
  static final loginScreen = '/loginScreen';
  static final signUpScreen = '/signUpScreen';
  static final forgetPasswordScreen = '/forgetPasswordScreen';
  static final editProfileScreen = '/editProfileScreen';
  static final myOrderScreen = '/myOrderScreen';
  static final helpCenterScreen = '/helpCenterScreen';
  static final productDetailsScreen = '/productDetailsScreen';
  static final categoryScreen = '/categoriesScreen';
  static final homeScreen = '/homeView';
  static final searchScreen = '/searchScreen';
  static final cartScreen = '/cartScreen';
  static final accountScreen = '/accountScreen';
  static final notificationScreen = '/notificationScreen';
  //static final categorySectionScreen = '/categorySectionScreen';
  //static const String categorySectionScreen = '/categorySection/:title';
  //add sub category screen
    static const String subcategoryScreen = '/subcategoryScreen';
  static final addNewPasswordScreen = '/addNewPasswordScreen';
  static final setNewPasswordScreen = '/setNewPasswordScreen';
  static final verficationScreen = '/verificationScreen';
  static final chatScreen = '/chatScreen';
  static final emptyNotificationScreen = '/emptyNotificationScreen';
  static final wishlistScreen = '/wishlistScreen';
  static final contactUsScreen = '/contactUsScreen';
  static final fAQsScreen = '/fAQsScreen';
  static final settingScreen = '/settingScreen';
  static const String trackOrder = '/trackOrder';
  static const String invoice = '/invoice';
  static const String cancelOrder = '/cancelOrder';
  static const String addReview = '/addReview';
  static final logoutScreen = '/logoutScreen';
  static final customerSupportScreen = '/customerSupportScreen';
  static final paymentAccountScreen = '/paymentAccountScreen';
  static final privacyPolicyScreen = '/privacyPolicyScreen';
  static final orderFlowScreen = '/orderFlowScreen';
  static final manageAddress = '/manageAddress';
  static final passwordManager = '/passwordManager';
  static final sellerScreen = '/sellerScreen';
  static final trackOrderDetails = '/trackOrderDetails';
  static final chatMessageScreen = '/chatMessageScreen';
  static final filtersScreen = '/filtersScreen';
  static final collectionsScreen = '/collectionsScreen';
  static final emptyCartScreen = '/emptyCartScreen';

  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
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
        
        builder: (context, state) {
          final  product=state.extra as ProductEntity;
          return  BlocProvider(
        
            create: (context) => sl<ReviewsCubit>()..getReviews(productId: 1),
          child: const ProductDetailsView());
        }  
        
       
      ),
      GoRoute(path: homeScreen, builder: (context, state) => const HomeView()),
      GoRoute(
        path: searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: wishlistScreen,
        builder: (context, state) => const WishlistScreen(),
      ),
      GoRoute(
        path: accountScreen,
        builder: (context, state) => const AccountScreen(),
      ),
      GoRoute(
        path: chatScreen,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: filtersScreen,
        builder: (context, state) => const FiltersScreen(),
      ),

      GoRoute(
        path: subcategoryScreen,
        builder: (context, state) {
 final int id = state.extra! as int;

          return SubCategoriesScreen(id: id);
        },
      ),
      // GoRoute(
      //   path: '/categorySection/:categoryName/:subCategoryName',
      //   builder: (context, state) {
      //     final categoryName = Uri.decodeComponent(
      //       state.pathParameters['categoryName']!,
      //     );
      //     final subCategoryName = Uri.decodeComponent(
      //       state.pathParameters['subCategoryName']!,
      //     );

      //     return CategorySectionScreen(
      //       title: categoryName,
      //       subCategory: subCategoryName,
      //     );
      //   },
      // ),

      GoRoute(
        path: addNewPasswordScreen,
        builder: (context, state) => const AddNewPasswordScreen(),
      ),
      GoRoute(
        path: setNewPasswordScreen,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),
      GoRoute(
        path: verficationScreen,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        path: emptyNotificationScreen,
        builder: (context, state) => const NotificationEmptyScreen(),
      ),
      GoRoute(
        path: settingScreen,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: contactUsScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: fAQsScreen,
        builder: (context, state) => const FAQsScreen(),
      ),
      GoRoute(
        path: myOrderScreen,
        builder: (context, state) => const MyOrderScreen(),
      ),
      GoRoute(
        path: trackOrder,
        builder: (context, state) => const TrackYourOrderScreen(),
      ),
      GoRoute(
        path: invoice,
        builder: (context, state) => const InvoiceScreen(),
      ),
      GoRoute(
        path: addReview,
        builder: (context, state) => const AddReviewScreen(),
      ),
      GoRoute(
        path: privacyPolicyScreen,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: customerSupportScreen,
        builder: (context, state) => const CustomerSupportScreen(),
      ),
      GoRoute(
        path: paymentAccountScreen,
        builder: (context, state) => const PaymentAccountScreen(),
      ),
      GoRoute(
        path: orderFlowScreen,
        builder: (context, state) => const OrderFlowScreen(),
      ),
      GoRoute(
        path: logoutScreen,
        builder: (context, state) => const LogoutScreen(),
      ),
      GoRoute(
        path: manageAddress,
        builder: (context, state) => const ManageAddressScreen(),
      ),
      GoRoute(
        path: passwordManager,
        builder: (context, state) => const PasswordManagerScreen(),
      ),
      GoRoute(
        path: trackOrderDetails,
        builder: (context, state) => const TrackOrderDetailsScreen(),
      ),
      GoRoute(
        path: sellerScreen,
        builder:
            (context, state) => const SellerProfileScreen(sellerName: "Ahmad"),
      ),
      GoRoute(
        path: chatMessageScreen,
        builder: (context, state) {
          final chat = state.extra as ChatMessageModel?;
          return BlocProvider(
            create: (_) {
              final chatRepo = context.read<ChatRepo>();
              return ChatCubit(chatRepo);
            },
            child: ChatMessageScreen(
              chatTitle: chat?.firstQuestion ?? "Default Chat",
              initialMessages: chat?.messages ?? [],
            ),
          );
        },
      ),
      GoRoute(
        path: collectionsScreen,
        builder: (context, state) => const CollectionsScreen(),
      ),
      GoRoute(
        path: emptyCartScreen,
        builder: (context, state) => const EmptyCartScreen(),
      ),
    ],
  );
}
