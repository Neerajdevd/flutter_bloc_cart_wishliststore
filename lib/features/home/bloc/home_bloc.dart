import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocflutterproject/features/data/cart.dart';
import 'package:blocflutterproject/features/data/data.dart';
import 'package:blocflutterproject/features/data/wishlist.dart';
import 'package:blocflutterproject/features/models/homeproductmodal.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeinitialEvent>(homeinitialEvent);

    on<HomeClickedLikeButtonEvent>(homeClickedLikeButtonEvent);

    on<HomeClickedProductCartButtonEvent>(homeClickedProductCartButtonEvent);

    on<HometocartEvent>(hometocartevent);
    on<HometoWishlistEvent>(hometowishlistevent);
  }

  FutureOr<void> hometocartevent(
      HometocartEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigatetoCart());
  }

  FutureOr<void> hometowishlistevent(
      HometoWishlistEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigatetoWishlist());
  }

  FutureOr<void> homeinitialEvent(
      HomeinitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingstate());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadingsuccessstate(
        products: Grocerydata.groceries
            .map((e) => Productmodal(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  type: e['type'],
                  quantity: e['quantity'],
                  image: e['image'],
                ))
            .toList()));
  }

  FutureOr<void> homeClickedLikeButtonEvent(
      HomeClickedLikeButtonEvent event, Emitter<HomeState> emit) {
    print('clicked wishlist');
    wishlist.add(event.clickedProduct);
    emit(Homeproductitemwishlisted());
  }

  FutureOr<void> homeClickedProductCartButtonEvent(
      HomeClickedProductCartButtonEvent event, Emitter<HomeState> emit) {
    print("Clicked Cart");
    cartitem.add(event.clickedProduct);
    emit(Homeproductitemcarted());
  }
}
