part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionstate {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessfullstate extends WishlistState {
  final List<Productmodal> wishlisitem;
  WishlistSuccessfullstate({required this.wishlisitem});
}
