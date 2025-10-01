import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/features/cart/presentation/view/widget/cart_view_body.dart';

class CartTap extends StatelessWidget {
  const CartTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddtocartCubit>(
      create: (context) => AddtocartCubit(),
      child: const CartViewBody(),
    );
  }
}
