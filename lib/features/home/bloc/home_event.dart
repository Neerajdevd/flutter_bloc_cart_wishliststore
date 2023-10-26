part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeinitialEvent extends HomeEvent {}

class HomeClickedLikeButtonEvent extends HomeEvent {
  final Productmodal clickedProduct;
  HomeClickedLikeButtonEvent({required this.clickedProduct});
}

class HomeClickedProductCartButtonEvent extends HomeEvent {
  final Productmodal clickedProduct;
  HomeClickedProductCartButtonEvent({required this.clickedProduct});
}

class HometoWishlistEvent extends HomeEvent {}

class HometocartEvent extends HomeEvent {}
