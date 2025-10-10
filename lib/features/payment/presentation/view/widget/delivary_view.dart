import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:green_souq/features/payment/data/Model/payment_Intent_Input_model.dart';
import 'package:green_souq/features/payment/presentation/cubits/stripe_payment/stripe_payment_cubit.dart';
import 'package:green_souq/features/payment/presentation/view/widget/custom_deliverey_container.dart';
import 'package:green_souq/features/payment/presentation/view/widget/order_info.dart';
import 'package:green_souq/main.dart';

class DelivaryView extends StatelessWidget {
  const DelivaryView({
    super.key,
    required this.amount,
    required this.price,
    required this.phoneNumper,
    required this.address,
    required this.cartModel,
  });
  final String amount;
  final String price;
  final String phoneNumper;
  final String address;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.navigateBack(context: context),
          icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
        ),
        title: const Text('Order Summery', style: FontStyle.f22w500black),
        centerTitle: true,
      ),
      body: BlocListener<StripePaymentCubit, StripePaymentState>(
        listener: (context, state) async {
          if (state is StripePaymentSuccess) {
            cartModel.delete();

            Helper.FlutterToast(
              title:
                  '💳 Payment of ${state.amount}\$ was successful. Thank you for shopping with us!',
              success: true,
            );
            await prefs.setInt(PrefsKeys.userOrders, ++orders);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Delivery Address', style: FontStyle.f22w500black),
              const SizedBox(height: 10),
              CustomDeliveryContainer(address: address),
              const SizedBox(height: 20),
              Text(
                'Total Items: ',
                style: FontStyle.f22w500black.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 30),
              const Text('Order Info', style: FontStyle.f22w500black),
              OrderInfo(title: 'Sub Total', subTitle: price),
              OrderInfo(
                title: 'Delivery Charge',
                subTitle: ((int.parse(price) / 10).toInt()).toString(),
              ),
              const OrderInfo(title: 'Discount', subTitle: '0'),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text('    Total Amount', style: FontStyle.f22w500black),
                  const Spacer(),
                  Text(
                    '${(int.parse(price) + (int.parse(price) / 10).toInt()).toString()}     ',
                    style: FontStyle.f22w500black,
                  ),
                ],
              ),
              const Spacer(),
              Customelinearbutton(
                onTap: () async {
                  int intPrice = int.parse(price);
                  int amountPayment = intPrice + (intPrice / 10).toInt();
                  BlocProvider.of<StripePaymentCubit>(context).stripePayment(
                    paymentEntientInputModel: PaymentIntentInputModel(
                      amount: amountPayment,
                      currency: "USD",
                    ),
                  );
                },
                child: Text(
                  'Continue To Payment',
                  style: FontStyle.f22w500black.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                width: double.infinity,
                height: 50,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
