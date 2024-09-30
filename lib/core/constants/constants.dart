class AppConstants {
  static const String baseUrl = 'https://codingarabic.online/api';
  // Auth
  static const String registerEndpoints = '/register';
  static const String loginEndpoints = '/login';
  static const String sendForgetPasswordEndpoints = '/forget-password';
  static const String verifyCodeEndpoints = '/check-forget-password';
  static const String logOutEndpoints = '/logout';

  // Home
  static const String bestSellerBooksEndpoints = '/products-bestseller';
  static const String homeBannerEndpoints = '/sliders';

  // search
  static const String searchEndpoints = '/products-search';

  // wishlist
  static const String addToWishlistEndpoints = '/add-to-wishlist';
  static const String removeFromWishlistEndpoints = '/remove-from-wishlist';
  static const String getWishlistEndpoints = '/wishlist';

  // cart
  static const String addToCartEndpoints = '/add-to-cart';
  static const String removeFromCartEndpoints = '/remove-from-cart';
  static const String getCartEndpoints = '/cart';
  static const String updateCartEndpoints = '/update-cart';

  // checkout
  static const String checkoutEndpoints = '/checkout';
  static const String placeOrderEndpoints = '/place-order';
  static const String governoratesEndpoints = '/governorates';

  // Profile
  static const String profileEndpoints = '/profile';
  static const String updateprofileEndpoints = '/update-profile';
  static const String changePasswordEndpoints = '/update-password';
}
