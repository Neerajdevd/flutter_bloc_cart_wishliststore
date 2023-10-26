part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistinitialEvent extends WishlistEvent {}

class WishlistRemoveEvent extends WishlistEvent {
  final Productmodal wishlistitems;
  WishlistRemoveEvent({required this.wishlistitems});
}
