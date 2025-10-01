import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';

class LinearButton extends StatelessWidget {
  const LinearButton({
    super.key,
    required this.search,
    required this.price,
    required this.servicesType,
    required this.iamgeUrl,
  });
  final String search;
  final String iamgeUrl;
  final String servicesType;
  final int price;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeAmoutCubit, ChangeAmoutState>(
      builder: (context, state) {
        return Customelinearbutton(
          onTap: () async {
            int amount = BlocProvider.of<ChangeAmoutCubit>(context).amount ?? 1;

            BlocProvider.of<AddtocartCubit>(context).addToCart(
              cart: CartModel(
                iamgeUrl: iamgeUrl,
                servicesType: servicesType,
                name: search,
                amount: amount.toString(),
                price: '${amount * price}',
              ),
            );
          },
          child: Text(
            'Add to cart',
            style: FontStyle.f22w500black.copyWith(color: Colors.white),
          ),
          width: double.infinity,
          height: 55,
          color: Colors.green,
        );
      },
    );
  }
}
