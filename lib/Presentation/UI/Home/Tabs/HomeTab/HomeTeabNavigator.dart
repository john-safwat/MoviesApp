import 'dart:ui';

abstract class HomeTabNavigator {
  void showMessage (String message);
  void showLoading (String message);
  void hideLoading();
  void goToDetailsScreen();
}