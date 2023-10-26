import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocflutterproject/features/data/wishlist.dart';
import 'package:blocflutterproject/features/models/homeproductmodal.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistinitialEvent>(wishlistinitialEvent);
    on<WishlistRemoveEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistinitialEvent(
      WishlistinitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessfullstate(wishlisitem: wishlist));
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEvent event, Emitter<WishlistState> emit) {
    wishlist.remove(event.wishlistitems);
    emit(WishlistSuccessfullstate(wishlisitem: wishlist));
  }
}
