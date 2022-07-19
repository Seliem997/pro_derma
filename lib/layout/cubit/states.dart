abstract class AppStates{}

class AppInitialState extends AppStates {}

class AppChangeBottomState extends AppStates {}

class AppChangeModeState extends AppStates {}


class AppChangeLanguageState extends AppStates {}



class AppLayoutLoadingState extends AppStates{}

class AppLayoutSuccessStates extends AppStates {}

class AppLayoutErrorState extends AppStates {

  final String error;

  AppLayoutErrorState(this.error);

}