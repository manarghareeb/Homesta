<div align="center">

# 🏠 Homesta

**A full-featured Flutter e-commerce marketplace for home finishing & interior products — with multi-role support (Customer, Seller, Admin), AI-powered chat, order management, PDF invoicing, and a rich product discovery experience.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7+-0175C2?logo=dart)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/State%20Management-BLoC%20%2F%20Cubit-blueviolet)](https://bloclibrary.dev)
[![GoRouter](https://img.shields.io/badge/Navigation-GoRouter-blue)](https://pub.dev/packages/go_router)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)]()

</div>

---

## 📖 Project Overview

**Homesta** is a production-ready Flutter marketplace application built for the home finishing and interior design industry. It connects customers looking for home products with sellers managing their own stores, and includes a full admin panel for platform management.

The app delivers a complete e-commerce lifecycle — from browsing products with advanced filtering and sorting, to adding items to a cart, going through shipping and payment checkout, and tracking orders. It also features an **AI-powered chatbot** (powered by a Hugging Face BERT model), **PDF invoice generation**, **speech-to-text search**, **skeleton loading states**, and a multi-role architecture that switches the entire UI experience based on whether the user is a customer, seller, or admin.

Built on strict **Clean Architecture** principles across 12+ feature modules, all wired via GetIt dependency injection.

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| **Framework** | Flutter (Dart 3.7+) |
| **State Management** | Flutter BLoC / Cubit |
| **Navigation** | GoRouter |
| **Networking** | Dio + Cookie Manager |
| **DI / Service Locator** | get_it |
| **Functional Programming** | dartz (Either, Failures) |
| **State Equality** | equatable |
| **Image Handling** | cached_network_image + image_picker |
| **PDF Generation** | pdf + printing |
| **AI Chat** | Hugging Face BERT API (speech_to_text) |
| **Speech-to-Text** | speech_to_text |
| **Local Storage** | SharedPreferences |
| **UI Skeleton Loading** | skeletonizer |
| **UI Utilities** | flutter_screenutil, flutter_svg, font_awesome_flutter, smooth_page_indicator |
| **Grid Layout** | flutter_staggered_grid_view |
| **Country Picker** | country_picker |
| **OTP Verification** | pin_code_fields |
| **Relative Time** | timeago |
| **Device Preview** | device_preview |
| **Font** | Outfit (Regular + Medium) |

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a **feature-first** modular folder structure. Each feature is fully self-contained across three strict layers, and all dependencies are resolved at startup via **GetIt**.

```
Feature
├── data/
│   ├── data_sources/     # Remote API calls via DioConsumer
│   ├── models/           # JSON-serializable models (extend domain entities)
│   └── repositories/     # Concrete repository implementations
├── domain/
│   ├── entities/         # Pure Dart business objects (no Flutter dependency)
│   ├── repositories/     # Abstract interfaces (contracts)
│   └── usecases/         # Single-responsibility use cases
└── presentation/
    ├── cubits/           # BLoC Cubits with typed states
    ├── views/            # Full-screen widgets
    └── widgets/          # Reusable, composable UI components
```

**Key architectural decisions:**

- **Multi-role routing** — `AuthCubit` resolves the user's role (customer / seller / admin) after login and GoRouter redirects to the correct navigation shell (customer tabs, seller dashboard, or admin panel).
- **`dartz Either<Failure, T>`** — all use cases and repositories return `Either`, keeping error handling at the type level and preventing exceptions from reaching the UI.
- **GetIt service locator** — 25+ use cases, 8 repositories, and 18+ Cubits are all lazily registered and injected in `service_locator.dart`.
- **Dio + CookieJar** — session cookies are persisted across requests using `dio_cookie_manager` and `cookie_jar`, keeping authenticated sessions alive.
- **API interceptor** — automatically attaches Bearer tokens to every outgoing request via `ApiInterceptor`.
- **Skeletonizer** — loading states across product lists and reviews use skeleton shimmer animations instead of spinners for a polished feel.
- **Device Preview** — integrated at the root for testing across multiple device form factors during development.
- **Responsive helpers** — `ResponsiveHelpers` and `ResponsiveConstants` utilities adapt layouts for phones, tablets, and landscape orientations.

---

## ✨ Features

### 🔐 Authentication
- Login and Register with full form validation
- Forget password → verify reset code → set new password flow
- Change password from account settings
- Resend reset code support
- Token stored and auto-attached via Dio interceptor
- Logout with full session clearing

### 🏠 Home & Discovery
- Onboarding carousel with page indicator for first-time users
- Animated splash screen
- Product browsing with auto-fetched data on launch
- Category-based navigation (Category → Subcategory → Products)
- Deals of the Day, Flash Discount, and Sales & Promotions sections
- Staggered product grid with smooth image loading via `cached_network_image`

### 🔍 Search & Filtering
- Full-text product and category search
- **Speech-to-text search** — search by voice using the device microphone
- Advanced filter drawer — filter by categories with live active filter tags
- Sort products by relevance, price, or newest
- Active filter chips with individual remove and "Clear All" support

### 🛍️ Product Details
- Image gallery section with multiple product photos
- Tabbed layout: Description, Additional Info, Reviews
- Product specification table
- Color selection widget
- "Suggest for You" section showing related products
- Add to cart directly from the product page
- Add to wishlist / collections

### 🛒 Cart & Checkout
- Add, update quantity, and remove items from cart
- Clear entire cart with confirmation dialog
- **Multi-step checkout:**
  - **Shipping step** — enter and validate shipping details
  - **Payment step** — select payment method and confirm order
  - **Place order** — final order creation via API
- Invoice screen with **PDF export & printing** via `pdf` + `printing` packages

### 📦 Order Management
- View all user orders with status indicators
- Order details screen with full breakdown
- Order tracking with timeline view
- `timeago` package for human-readable order timestamps

### ⭐ Reviews & Ratings
- Star rating widget per product
- Rating breakdown with progress bars per star level
- Add a review with photo/video upload support
- All reviews paginated list with user avatars

### 🤖 AI Chatbot
- In-app AI chat powered by a **Hugging Face BERT model** (`tasabehahmed-chatbot-bert`)
- Chat input with send button and conversation history
- Designed to assist with home finishing and product queries

### 👤 Account & Profile
- Edit profile: name, gender, birthday, country picker, avatar photo upload
- Manage saved addresses (add / delete)
- My Collections (saved/wishlisted products)
- Privacy Policy screen
- Settings screen with theme and account options

### 🆘 Help & Support
- Help Center with categorized help topics
- FAQ screen with category selector and expandable question items
- Customer Support with contact info sections
- Contact Us form with direct message submission
- Contact information display with email, phone, social links

### 🏪 Seller Panel
- **Store management:** create, view, and delete stores
- **Product management:** add, edit (form with category/subcategory selector, stock input, image upload), and delete products
- **Product image upload** with multi-image support and edit/delete per image
- **Sales Analytics dashboard** showing best and least selling products and data analytics charts
- **Company Data screen** with about card, mission/vision card, and detailed company info
- Seller account profile screen

### 🔧 Admin Panel
- **Category management:** add, update, delete categories with image upload
- **Subcategory management:** add, update, delete subcategories
- **Admin Dashboard** with analytics containers showing platform metrics
- **Product review & admin product screen** for platform-wide product oversight
- **Admin account screen** with admin-specific profile management

---

## 🧪 Testing

The project uses Flutter's built-in testing framework with static analysis via `flutter_lints`.

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

Run all tests:

```bash
flutter test
```

The Clean Architecture separation makes each layer independently testable:

- **Use cases** can be unit-tested by mocking repository interfaces — zero network or UI dependency
- **Repositories** can be tested by mocking data sources
- **Cubits** are fully testable with `bloc_test` and mocked use cases

> Recommended additions: `bloc_test` and `mocktail` as dev dependencies for comprehensive Cubit coverage across `AuthCubit`, `CartCubit`, `ProductCubit`, `StoreCubit`, and `OrderCubit`.

---

## 📁 Folder Structure

```
homesta/
├── lib/
│   ├── core/
│   │   ├── api/                        # ApiConsumer, DioConsumer, interceptors, endpoints
│   │   ├── cache/                      # CacheHelper (SharedPreferences wrapper)
│   │   ├── di/                         # service_locator.dart (GetIt wiring)
│   │   ├── error/                      # ErrorModel, Failures, Exception handlers
│   │   ├── funcations/                 # upload_images_to_api.dart (shared upload util)
│   │   ├── routing/                    # app_router.dart (GoRouter + role-based redirects)
│   │   ├── theming/                    # AppColors, TextStyles (Outfit font)
│   │   ├── utils/                      # AppSpacing, ResponsiveConstants, ResponsiveHelpers
│   │   └── widgets/                    # Shared reusable widgets (AppBar, Button, TextField,
│   │                                   # CachedImage, ConfirmDialog, Dropdown, SnackBar)
│   │
│   ├── features/
│   │   ├── account/                    # Profile, Edit Profile, Collections, Addresses,
│   │   │                               # Help Center, FAQs, Customer Support, Contact Us,
│   │   │                               # Invoice, Privacy Policy, Settings
│   │   ├── admin/                      # Admin dashboard, category & subcategory CRUD,
│   │   │                               # admin product review, admin account
│   │   ├── authentication/             # Login, Register, Forget Password, Reset Password,
│   │   │                               # Change Password, Verify Code, Logout
│   │   ├── cart/                       # Cart CRUD, AddItemToCart, CartCubit
│   │   ├── categories/                 # Category & Subcategory browse + search
│   │   ├── chat/                       # AI Chatbot (Hugging Face BERT API)
│   │   ├── home/                       # Home screen, product grid, onboarding
│   │   ├── order/                      # Shipping, Payment, PlaceOrder, OrderDetails,
│   │   │                               # UserOrders, Order Tracking
│   │   ├── product/                    # Product listing, Product Details (tabs: description,
│   │   │                               # additional info, reviews), product images, reviews
│   │   ├── search/                     # Search screen with empty & populated states,
│   │   │                               # speech-to-text integration
│   │   ├── seller/
│   │   │   ├── analytics/              # Sales analytics dashboard
│   │   │   ├── company data/           # Company profile screen
│   │   │   ├── product/                # Seller product CRUD + image upload
│   │   │   └── profile/                # Store create/manage, seller account
│   │   ├── shop/                       # Shop screen with filter drawer, sort, active filters
│   │   └── splash/                     # Animated splash screen
│   │
│   └── main.dart                       # Entry point (DI, MultiRepositoryProvider,
│                                       # MultiBlocProvider, DevicePreview, GoRouter)
│
├── assets/
│   ├── fonts/outfit/                   # Outfit-Regular.ttf, Outfit-Medium.ttf
│   └── images/                         # All image assets organized by category
│       ├── payment icon/
│       ├── setting icon/
│       ├── catrgories_image/
│       ├── seller_image_icon/
│       ├── help_center_images/
│       ├── onboarding_image/
│       ├── notification_icon_image/
│       ├── sales_and_promotions_image/
│       ├── deals_of_day_image/
│       └── flash_discount_image/
│
├── android/                            # Android native project
├── ios/                                # iOS native project
├── pubspec.yaml                        # Dependencies & assets manifest
└── README.md
```

---

## 🚀 How to Run the Project

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.7.2`
- Dart `>=3.7.2`
- Android Studio / VS Code with Flutter & Dart extensions
- A physical device or emulator

### Steps

**1. Clone the repository**

```bash
git clone https://github.com/your-username/homesta.git
cd homesta
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Run the app**

```bash
flutter run
```

**4. Build release APK**

```bash
flutter build apk --release
```

> **API Base URL** is configured in `lib/core/api/end_ponits.dart` as `http://homefinish.runasp.net/`. No additional setup is required for the backend.

> **AI Chatbot** connects to `https://tasabehahmed-chatbot-bert.hf.space/chat` — requires internet access.

> **Device Preview** is enabled in development. To disable it for production, remove the `DevicePreview` wrapper in `main.dart`.

---

## 🌐 API Reference

| Group | Endpoint | Purpose |
|-------|----------|---------|
| **Auth** | `api/Auth/login` | User login |
| **Auth** | `api/Auth/register` | New user registration |
| **Auth** | `api/Auth/logout` | Logout & session clear |
| **Auth** | `api/Auth/ForgetPassword` | Forget password |
| **Auth** | `api/Auth/ResetPassword` | Reset with new password |
| **Auth** | `api/Auth/VerifyResetCode` | Verify OTP reset code |
| **Auth** | `api/Auth/change-password` | Change password |
| **Products** | `api/Product/GetAllProducts` | Browse all products |
| **Products** | `api/Product/Create` | Seller: add product |
| **Products** | `api/Product/Update` | Seller: edit product |
| **Products** | `api/Product/Delete` | Seller: delete product |
| **Categories** | `api/Category` | Get / manage categories |
| **Cart** | `api/Cart/add` | Add item to cart |
| **Cart** | `api/Cart/items` | Get cart items |
| **Cart** | `api/Cart/clear` | Clear entire cart |
| **Order** | `api/Order/shipping` | Set shipping info |
| **Order** | `api/Order/payment` | Set payment method |
| **Order** | `api/Order/Create/Place` | Place the order |
| **Order** | `api/Order/UserOrders` | Get user's orders |
| **Store** | `api/Store` | Create / get stores |
| **Store** | `api/Store/my-stores` | Get seller's own stores |
| **Reviews** | `api/Review` | Add product review |
| **Chat** | HuggingFace BERT endpoint | AI chatbot response |

---

## 🔮 Future Improvements

- [ ] **Dark Mode** — Full dark theme with a theme switcher in Settings
- [ ] **Push Notifications** — Firebase Cloud Messaging for order updates and promotions
- [ ] **Product Wishlist** — Save products to a dedicated wishlist (currently "My Collections")
- [ ] **Real-Time Chat** — WebSocket-based live chat between buyer and seller
- [ ] **Map Integration** — Delivery address selection via Google Maps or OpenStreetMap
- [ ] **Multi-Language (i18n)** — Arabic/English localization support
- [ ] **Payment Gateway** — Integrate a real payment provider (Stripe, PayTabs, Fawry, etc.)
- [ ] **Product Variants** — Size, color, and material variant selection per product
- [ ] **Promotions & Coupons** — Discount code application at checkout
- [ ] **Unit & Widget Tests** — Full BLoC test coverage with `bloc_test` and `mocktail`
- [ ] **CI/CD Pipeline** — Automated testing and APK builds via GitHub Actions

---

## 📸 Screenshots

> Add your screenshots here to showcase the app's UI across all three roles.

| Splash | Onboarding | Login |
|:------:|:----------:|:-----:|
| ![Splash](https://github.com/user-attachments/assets/aab88480-3eea-44e9-8f44-d4bdfb2879f7) | ![Onboarding 3](https://github.com/user-attachments/assets/acd6cac9-570f-4ef1-aadc-4612a0077ecf) | ![Sign In](https://github.com/user-attachments/assets/7e5ebef9-9a74-4dbe-b32a-85e5f8d665b3) |

| Home | Product Details | Shop & Filter |
|:----:|:---------------:|:-------------:|
| ![home screen](https://github.com/user-attachments/assets/b8f03d22-1ebe-43fc-b35c-f46a16508d7e) | ![Details product screen](https://github.com/user-attachments/assets/70206011-1984-4c75-8f4a-835fdb6fee50) | ![Shop](https://github.com/user-attachments/assets/3798cc8d-513e-4791-9577-5d58937d0fb9) |

| Cart | Checkout | Order Tracking |
|:----:|:--------:|:--------------:|
| ![cart](https://github.com/user-attachments/assets/02dc9c48-b28e-4853-88fc-d2375970d1e8) | ![Summary](https://github.com/user-attachments/assets/a057583d-e2ce-4da6-8626-957b1ea7001b) | ![Track your order](https://github.com/user-attachments/assets/d1b253eb-60e8-42c5-bd7e-a2469b24f79c) |


| AI Chat | Seller Dashboard | Admin Panel |
|:-------:|:----------------:|:-----------:|
|![Chat AI](https://github.com/user-attachments/assets/f47dcab1-24f1-407d-8efa-d608debb3a10) | <img width="375" height="812" alt="Profile Company" src="https://github.com/user-attachments/assets/6810ab1f-3da7-4b02-a0ff-3728ed9916bb" /> | <img width="375" height="812" alt="Admin" src="https://github.com/user-attachments/assets/a5f277fc-7b50-4708-a583-f011d9a60d77" /> |

---

## 🤝 Contributing

Contributions are very welcome! Here's how to get started:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'feat: add your feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

Please follow the existing Clean Architecture patterns, keep use cases single-responsibility, and ensure `flutter analyze` passes with no warnings before submitting.

---

## 📬 Social Links

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-@manarghareeb-181717?logo=github)](https://github.com/manarghareeb)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin)](https://linkedin.com/in/manar-ghareeb)
[![Email](https://img.shields.io/badge/Email-Contact%20Me-D14836?logo=gmail)](mailto:manarghareeb@gmail.com)

</div>

---

<div align="center">

Made with ❤️ and Flutter · Built for beautiful homes 🏡

</div>
