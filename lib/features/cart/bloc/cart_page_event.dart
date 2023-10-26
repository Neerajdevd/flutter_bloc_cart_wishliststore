part of 'cart_page_bloc.dart';

abstract class CartPageEvent {}

class CartinitialEvent extends CartPageEvent {}

class CartRemovefromcart extends CartPageEvent {
  final Productmodal removeitem;
  CartRemovefromcart({required this.removeitem});
}
