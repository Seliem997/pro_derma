import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_derma/layout/cubit/states.dart';
import 'package:pro_derma/models/orders/add_orders_model.dart';
import 'package:pro_derma/models/cart_model.dart';
import 'package:pro_derma/models/products/home_model.dart';
import 'package:pro_derma/modules/cart/cart_view.dart';
import 'package:pro_derma/modules/favorite/favorite_view.dart';
import 'package:pro_derma/shared/components/show_toast.dart';
import 'package:pro_derma/shared/network/end_points.dart';
import 'package:pro_derma/shared/network/remote/dio_helper.dart';
import 'package:sizer/sizer.dart';

import '../../models/orders/my_orders_model.dart';
import '../../models/products/products_details_model.dart';
import '../../modules/home/home_view.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/settings/settings_view.dart';
import '../../shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//-------------------------------------------- Create Navigation Bar --------------------
  int currentIndex = 0;

  List<Widget> bottomScreens=[
    const HomeView(),
    // const FavoriteView(),
    const CartView(),
    const ProfileView(),
    const SettingsView(),
  ];

  void changeBottom(int index){

    currentIndex = index;
    if(index == 1){
      getCartData(
        userToken: CacheHelper.returnData(key: 'token'),
      );
    }

    emit(AppChangeBottomState());
  }

//-------------------------------------------- changeSideBarDrawer -------

  double xOffset= 0;
  double yOffset= 0;
  bool isDrawerOpen= false;

  void changeSideBarDrawer(){
    if(isDrawerOpen){
      xOffset= 0;
      yOffset= 0;
      isDrawerOpen= false;
      emit(AppChangeDrawerState());
    }else{
      xOffset = 100.w - 120;
      yOffset = 100.h /5;
      isDrawerOpen = true;
      emit(AppChangeDrawerState());
    }
  }

//---------------------------------------------- Change App Mode To Dark Mode -------------
  bool isDark = false;

  void changeAppMode({bool? modeFromShared}){

    if(modeFromShared != null){
      isDark = modeFromShared;
      emit(AppChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDarkMode', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }

  }

//-------------------------------------------- Get Data Of Product in Home Screen -------

  HomeModel? homeModel;
void getHomeData({String? userToken}){
    emit(AppLayoutLoadingState());

    DioHelper.getData(url: HOME,token: userToken)
        .then((value) {
          homeModel = HomeModel.fromJson(value.data);
          print('homeModel.toString()${homeModel.toString()}');
          print('homeModel!.dataModel[0].title${homeModel!.dataModel[0].title}');
          print('value.data${value.data}');
          print('value.data.toString()${value.data.toString()}');
          emit(AppLayoutSuccessState());

    }).catchError((error){
      print('error in get home Data => ${error.toString()}');
      emit(AppLayoutErrorState(error.toString()));
    });
}


//-------------------------------------------- Get Details Of Product in details Screen -------

  ProductsDetailsModel? detailsModel;
void getProductDetails({String? userToken,int? productId}){
    emit(AppProductDetailsLoadingState());

    DioHelper.getData(url: '$PRODUCTDETAILS/$productId',token: userToken)
        .then((value) {
          detailsModel = ProductsDetailsModel.fromJson(value.data);
          print('detailsModel.toString()${detailsModel.toString()}');
          print('detailsModel!.data.title${detailsModel!.data!.title}');
          print('value.data${value.data}');
          print('value.data.toString()${value.data.toString()}');
          emit(AppLayoutSuccessState());

    }).catchError((error){
      print('error in get home Data => ${error.toString()}');
      emit(AppLayoutErrorState(error.toString()));
    });
}

//-------------------------------------------- Add products To Cart  -------


void addProductsToCart({int? productId,String? userToken}){
    emit(AppAddToCartLoadingState());

    DioHelper.getData(url: '$ADDTOCART/$productId',token: userToken)
        .then((value) {

          print('Added To Cart in cubit Successfully');
          print('value.data${value.data}');
          print('value.data.toString()${value.data.toString()}');
          emit(AppAddToCartSuccessState());
          showToast(message: value.data.toString(), state: ToastStates.success);
          getCartData(userToken: userToken);

    }).catchError((error){
      print('error in add to cart  => ${error.toString()}');
      emit(AppAddToCartErrorState(error.toString()));
    });
}


//-------------------------------------------- Get Data Of Products in Cart Screen -------

  CartModel? cartModel;
  void getCartData({String? userToken}){
    emit(AppCartLoadingState());

    DioHelper.getData(url: CART,token: userToken)
        .then((value) {
      cartModel = CartModel.fromJson(value.data);
      print('cartModel.toString()${cartModel.toString()}');
      print('cartModel!.dataModel[0].title${cartModel!.data[0].productId}');
      print('value.data${value.data}');
      print('value.data.toString()${value.data.toString()}');
      emit(AppCartSuccessState());

    }).catchError((error){
      print('error in get cart Data => ${error.toString()}');
      emit(AppCartErrorState(error.toString()));
    });
  }

//-------------------------------------------- Delete Data Of Products in Cart Screen -------


  void deleteProductsInCart({String? productId,String? userToken}){
    emit(AppDeleteFromCartLoadingState());

    DioHelper.getData(url: '$DELETEFROMCART/$productId',token: userToken)
        .then((value) {
      getCartData(userToken: userToken); //================ Take Care of it When Run
      print('delete from Cart in cubit Successfully');
      print('value.data${value.data}');
      print('value.data.toString()${value.data.toString()}');
      emit(AppDeleteFromCartSuccessState());
      showToast(message: value.data.toString(), state: ToastStates.success);


    }).catchError((error){
      print('error in delete from cart  => ${error.toString()}');
      emit(AppDeleteFromCartErrorState(error.toString()));
    });
  }


//---------------------------------------------- Add order to my orders-------------

  AddOrderModel? addOrderModel;

  void addOrder({required int addressId}) {
    emit(AppAddOrderLoadingState());

    DioHelper.postData(
      url: CHECKOUT,
      data: {
        'address_id': addressId,
      },
    ).then(
          (value) {
        addOrderModel = AddOrderModel.fromJson(value.data);
        print('addOrderModel status code in cubit = ');
        print(addOrderModel!.code);
        print('addOrderModel value in layout cubit = ');
        print(value);
        emit(AppAddOrderSuccessState(addOrderModel!));
      },
    ).catchError(
          (onError) {
        print(onError.toString());
        print('error in addOrderModel checkout cubit');
        emit(AppAddOrderErrorState(onError.toString()),
        );
      },
    );
  }


//-------------------------------------------- Get my orders Of Products in Orders Screen -------

  MyOrdersModel? ordersModel;
  void getMyOrdersData({String? userToken}){
    emit(AppMyOrdersLoadingState());

    DioHelper.getData(url: MYORDERS, token: userToken)
        .then((value) {
      ordersModel = MyOrdersModel.fromJson(value.data);
      print('ordersModel.toString()${ordersModel.toString()}');
      print('ordersModel!.dataModel[0].title${ordersModel!.dataModel[0].address}');
      print('value.data${value.data}');
      print('value.data.toString()${value.data.toString()}');
      emit(AppMyOrdersSuccessState());

    }).catchError((error){
      print('error in get my order Data => ${error.toString()}');
      emit(AppMyOrdersErrorState(error.toString()));
    });
  }

//-------------------------------------------- Cancel order Of Products in My Order Screen -------


  void cancelProductsInMyOrders({String? productId,String? userToken}){
    emit(AppCancelMyOrderLoadingState());

    DioHelper.getData(url: '$CANCELORDER/$productId',token: userToken)
        .then((value) {
      getMyOrdersData(userToken: userToken); //================ Take Care of it When Run
      print('Cancel My Order in cubit Successfully');
      print('value.data${value.data}');
      print('value.data.toString()${value.data.toString()}');
      emit(AppCancelMyOrderSuccessState());
      showToast(message: value.data.toString(), state: ToastStates.success);


    }).catchError((error){
      print('error in Cancel My Order  => ${error.toString()}');
      emit(AppCancelMyOrderErrorState(error.toString()));
    });
  }


//---------------------------------------------- Change Language -------------

Locale _locale = const Locale('en');

Locale get locale => _locale;

void setLocale(Locale locale){
  // if(!S.delegate.contains(locale)) return;
  _locale = locale;
  CacheHelper.saveData(key: 'lang', value: locale.languageCode);
  emit(AppChangeLanguageState());
}

  void clearLocale(){
    _locale= const Locale('en');
    emit(AppChangeLanguageState());
  }


}