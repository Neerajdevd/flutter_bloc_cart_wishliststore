import 'package:blocflutterproject/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:blocflutterproject/features/wishlist/ui/wishtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    wishlistbloc.add(WishlistinitialEvent());
    super.initState();
  }

  final wishlistbloc = WishlistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistbloc,
        listenWhen: (previous, current) => current is WishlistActionstate,
        buildWhen: (previous, current) => current is! WishlistActionstate,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessfullstate:
              final wishlistSuccessfullstate =
                  state as WishlistSuccessfullstate;
              return ListView.builder(
                  itemCount: wishlistSuccessfullstate.wishlisitem.length,
                  itemBuilder: ((context, index) {
                    return Wishtile(
                      wishlistBloc: wishlistbloc,
                      productmodal: wishlistSuccessfullstate.wishlisitem[index],
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
