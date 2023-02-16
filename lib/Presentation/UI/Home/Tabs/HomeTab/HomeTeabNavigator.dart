import 'dart:ui';

abstract class HomeTabNavigator {
  void showMessage (String message , {
    String? posActionTitle,
    String? nigActionTitle,
    VoidCallback? posAction,
    VoidCallback? nigAction,
  });
  void showLoading (String message);
  void hideLoading();
  void goToDetailsScreen();
}