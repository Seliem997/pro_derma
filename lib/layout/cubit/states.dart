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

class AppDeleteFromCartLoadingState extends AppStates{}

class AppDeleteFromCartSuccessState extends AppStates {}

class AppDeleteFromCartErrorState extends AppStates {
  final String error;
  AppDeleteFromCartErrorState(this.error);
}
