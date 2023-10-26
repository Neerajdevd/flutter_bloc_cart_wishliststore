import 'package:blocflutterproject/features/cart/ui/cartpage.dart';
import 'package:blocflutterproject/features/home/bloc/home_bloc.dart';
import 'package:blocflutterproject/features/home/ui/product_tile.dart';
import 'package:blocflutterproject/features/models/homeproductmodal.dart';
import 'package:blocflutterproject/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homebloc.add(HomeinitialEvent());
    super.initState();
  }

  final homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homebloc,
        listenWhen: (previous, current) => current is HomeActionstate,
        buildWhen: (previous, current) => current is! HomeActionstate,
        listener: (context, state) {
          if (state is HomeNavigatetoCart) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Cartpage()));
          } else if (state is HomeNavigatetoWishlist) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Wishlist()));
          } else if (state is Homeproductitemcarted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Item carted")));
          } else if (state is Homeproductitemwishlisted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item Added in Wishlist")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingstate:
              return const CircularProgressIndicator();
            case HomeLoadingsuccessstate:
              final successtate = state as HomeLoadingsuccessstate;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 120, 131, 214),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homebloc.add(HometoWishlistEvent());
                        },
                        icon: const Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {
                          homebloc.add(HometocartEvent());
                        },
                        icon: const Icon(Icons.shopping_cart))
                  ],
                  title: const Text("Neeraj Grocery App"),
                ),
                body: ListView.builder(
                    itemCount: successtate.products.length,
                    itemBuilder: ((context, index) {
                      return ProducttileList(
                        homeBloc: homebloc,
                        productmodal: successtate.products[index],
                      );
                    })),
              );
            case HomeLoadingerrorstate:
              return const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            default:
              return const SizedBox();
          }
        });
  }
}
