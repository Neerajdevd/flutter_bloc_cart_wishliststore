import 'package:blocflutterproject/features/cart/bloc/cart_page_bloc.dart';
import 'package:blocflutterproject/features/cart/ui/carttile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final cartbloc = CartPageBloc();

  @override
  void initState() {
    cartbloc.add(CartinitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: BlocConsumer<CartPageBloc, CartPageState>(
        bloc: cartbloc,
        listenWhen: (previous, current) => current is CartActionstate,
        buildWhen: (previous, current) => current is! CartActionstate,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessstate:
              final cartSuccessstate = state as CartSuccessstate;
              return ListView.builder(
                  itemCount: cartSuccessstate.cartitems.length,
                  itemBuilder: ((context, index) {
                    return Carttile(
                      cartPageBloc: cartbloc,
                      productmodal: cartSuccessstate.cartitems[index],
                    );
                  }));
            default:
          }
          return Container();
        },
      ),
    );
  }
}
