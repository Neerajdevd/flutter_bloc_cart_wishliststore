import 'package:blocflutterproject/features/cart/bloc/cart_page_bloc.dart';
import 'package:blocflutterproject/features/models/homeproductmodal.dart';
import 'package:flutter/material.dart';

class Carttile extends StatelessWidget {
  final Productmodal productmodal;
  final CartPageBloc cartPageBloc;
  const Carttile(
      {super.key, required this.productmodal, required this.cartPageBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productmodal.image))),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            productmodal.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(productmodal.type),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + productmodal.price.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // cartPageBloc.add(HomeClickedLikeButtonEvent(
                        //     clickedProduct: productmodal));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        cartPageBloc
                            .add(CartRemovefromcart(removeitem: productmodal));
                      },
                      icon: const Icon(
                        Icons.shopping_bag,
                        color: Colors.deepPurple,
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
