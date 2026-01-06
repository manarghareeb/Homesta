class EndPoint {
  static String baseUrl = "http://homefinish.runasp.net/";
  static String signIn = "api/Auth/login";
  static String signUp = "api/Auth/register";
  static String logOut = "api/Auth/logout";
  static String forgetPassword = "api/Auth/ForgetPassword";
  static String resetPassword = "api/Auth/ResetPassword";
  static String chat = "https://tasabehahmed-chatbot-bert.hf.space/chat";
  static String confirmEmail = "api/Auth/ConfirmEmail";
  static String resendConfirmEmail = "api/Auth/ResendEmailConfirmation";

  static String getAllCategory = "api/Category";
  static String searchCategory = "api/Category/search";
  static String getAllProducts = "api/Product/GetAllProducts";
  static String getProductImages = "api/ProductImages/product";
  static String getSubCategory = "api/SubCategory/by-category";
  static String getProductReviews = "api/Review/product";
  static String addProductReviews = "api/Review";
  static String addCart = 'api/Cart/add';
  static String getCartItem = 'api/Cart/items';
}
