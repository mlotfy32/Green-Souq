import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/cart/presentation/view/widget/cart_item.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    BlocProvider.of<AddtocartCubit>(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu_rounded, size: 30, color: Colors.black),
        title: const Text('My Cart', style: FontStyle.f22w500black),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<AddtocartCubit, AddtocartState>(
        builder: (context, state) {
          if (state is AddtocartEmpty) {
            return const Center(
              child: Text('No Data To Display', style: FontStyle.f25w500black),
            );
          } else if (state is AddtocartSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: CartItem(index: index, cartModel: state.data[index]),
              ),
              itemCount: state.data.length,
            );
          } else if (state is AddtocartFailure) {
            return Center(
              child: Text(state.error, style: FontStyle.f25w500black),
            );
          }
          return const Center(child: CustomLoadingDialog(size: 60));
        },
      ),
    );
  }
}
