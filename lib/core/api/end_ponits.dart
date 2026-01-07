class EndPoint {
  static String baseUrl = "http://homefinish.runasp.net/";
  static String signIn = "api/Auth/login";
  static String signUp = "api/Auth/register";
  static String logOut = "api/Auth/logout";
  static String forgetPassword = "api/Auth/ForgetPassword";
  static String resetPassword = "api/Auth/ResetPassword";
  // static String confirmEmail = "api/Auth/ConfirmEmail";
  // static String resendConfirmEmail = "api/Auth/ResendEmailConfirmation";
  static String verifyResetCode = "/api/Auth/VerifyResetCode";
  static String resendResetCode = "/api/Auth/resend-reset-code";
  static String changePassword = "/api/Auth/change-password";
  static String chat = "https://tasabehahmed-chatbot-bert.hf.space/chat";

  static String getAllCategory = "api/Category";
  static String searchCategory = "api/Category/search";
  static String getAllProducts = "api/Product/GetAllProducts";
  static String getProductImages = "api/ProductImages/product";
  static String getSubCategory = "api/SubCategory/by-category";
  static String getProductReviews = "api/Review/product";
  static String addProductReviews = "api/Review";
  static String addCart = 'api/Cart/add';
  static String getCartItem = 'api/Cart/items';

  //saller endpoints
  static String getSallerProducts = "api/Store/";
  static String addProduct = "api/Product/Create";
  static String editProduct = "api/Product/Update";
  static String deleteProduct = "api/Product/Delete";

}
