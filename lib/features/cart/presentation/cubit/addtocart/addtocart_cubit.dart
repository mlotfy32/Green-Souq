import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:green_souq/core/utiles/constanse.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
part 'addtocart_state.dart';

class AddtocartCubit extends Cubit<AddtocartState> {
  AddtocartCubit() : super(AddtocartInitial());

  getCart() async {
    emit(AddtocartLoading());
    Box<CartModel> cartModel = await Hive.box(Constanse.kCartBox);
    try {
      List<CartModel> cart = await cartModel.values.toList();
      if (cart.isEmpty) {
        emit(AddtocartEmpty());
      } else {
        emit(AddtocartSuccess(data: cart.reversed.toList()));
        log('${cart.reversed.toList()}');
      }
    } catch (e) {
      emit(AddtocartFailure(error: e.toString()));
    }
  }

  addToCart({required CartModel cart}) async {
    try {
      Box<CartModel> cartModel = await Hive.box(Constanse.kCartBox);
      cartModel.add(cart);
      Helper.FlutterToast(title: 'Added To Cart ✅', success: true);
    } on Exception catch (e) {
      Helper.FlutterToast(title: '$e', success: false);
    }
  }
}
