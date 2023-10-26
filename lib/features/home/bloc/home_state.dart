part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionstate extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingstate extends HomeState {}

class HomeLoadingsuccessstate extends HomeState {
  final List<Productmodal> products;
  HomeLoadingsuccessstate({required this.products});
}

class HomeLoadingerrorstate extends HomeState {}

class HomeNavigatetoWishlist extends HomeActionstate {}

class HomeNavigatetoCart extends HomeActionstate {}

class Homeproductitemwishlisted extends HomeActionstate {}

class Homeproductitemcarted extends HomeActionstate {}
