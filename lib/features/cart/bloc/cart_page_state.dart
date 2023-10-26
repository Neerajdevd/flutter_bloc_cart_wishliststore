part of 'cart_page_bloc.dart';

abstract class CartPageState {}

abstract class CartActionstate {}

class CartPageInitial extends CartPageState {}

class CartSuccessstate extends CartPageState {
  final List<Productmodal> cartitems;
  CartSuccessstate({required this.cartitems});
}
