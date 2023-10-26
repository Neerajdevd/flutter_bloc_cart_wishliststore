import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocflutterproject/features/data/cart.dart';
import 'package:blocflutterproject/features/models/homeproductmodal.dart';

part 'cart_page_event.dart';
part 'cart_page_state.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  CartPageBloc() : super(CartPageInitial()) {
    on<CartinitialEvent>(cartPageInitialEvent);
    on<CartRemovefromcart>(cartRemovefromcart);
  }

  FutureOr<void> cartPageInitialEvent(
      CartinitialEvent event, Emitter<CartPageState> emit) {
    emit(CartSuccessstate(cartitems: cartitem));
  }

  FutureOr<void> cartRemovefromcart(
      CartRemovefromcart event, Emitter<CartPageState> emit) {
    cartitem.remove(event.removeitem);
    emit(CartSuccessstate(cartitems: cartitem));
  }
}
