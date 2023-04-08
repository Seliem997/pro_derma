import 'package:pro_derma/models/orders/add_orders_model.dart';

abstract class AppStates{}

class AppInitialState extends AppStates {}

class AppChangeBottomState extends AppStates {}

class AppChangeModeState extends AppStates {}

class AppChangeDrawerState extends AppStates {}

class AppChangeLanguageState extends AppStates {}



class AppLayoutLoadingState extends AppStates{}

class AppLayoutSuccessState extends AppStates {}

class AppLayoutErrorState extends AppStates {
  final String error;
  AppLayoutErrorState(this.error);
}


class AppProductDetailsLoadingState extends AppStates{}

class AppProductDetailsSuccessState extends AppStates {}

class AppProductDetailsErrorState extends AppStates {
  final String error;
  AppProductDetailsErrorState(this.error);
}


class AppAddToCartLoadingState extends AppStates{}

class AppAddToCartSuccessState extends AppStates {}

class AppAddToCartErrorState extends AppStates {
  final String error;
  AppAddToCartErrorState(this.error);
}


class AppCartLoadingState extends AppStates{}

class AppCartSuccessState extends AppStates {}

class AppCartErrorState extends AppStates {
  final String error;
  AppCartErrorState(this.error);
}


class AppMyOrdersLoadingState extends AppStates{}

class AppMyOrdersSuccessState extends AppStates {}

class AppMyOrdersErrorState extends AppStates {
  final String error;
  AppMyOrdersErrorState(this.error);
}


class AppDeleteFromCartLoadingState extends AppStates{}

class AppDeleteFromCartSuccessState extends AppStates {}

class AppDeleteFromCartErrorState extends AppStates {
  final String error;
  AppDeleteFromCartErrorState(this.error);
}


class AppAddOrderLoadingState extends AppStates{}

class AppAddOrderSuccessState extends AppStates {
  final AddOrderModel addOrderModel;
  AppAddOrderSuccessState(this.addOrderModel);
}

class AppAddOrderErrorState extends AppStates {
  final String error;
  AppAddOrderErrorState(this.error);
}


class AppCancelMyOrderLoadingState extends AppStates{}

class AppCancelMyOrderSuccessState extends AppStates {}

class AppCancelMyOrderErrorState extends AppStates {
  final String error;
  AppCancelMyOrderErrorState(this.error);
}