import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/setup_service_locator.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/features/payment/data/repos/checkout_rebo_imp.dart';
import 'package:green_souq/features/payment/presentation/cubits/stripe_payment/stripe_payment_cubit.dart';
import 'package:green_souq/features/payment/presentation/view/widget/delivary_view.dart';
import 'package:green_souq/features/services/presentation/view/widget/customIconButton.dart';
import 'package:green_souq/main.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartModel, required this.index});
  final CartModel cartModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              cartModel.delete();
              BlocProvider.of<AddtocartCubit>(context).getCart();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Icon(Icons.check_box, color: Colors.green),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: CachedNetworkImage(
                  width: 120.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  imageUrl: cartModel.iamgeUrl,
                  placeholder: (context, url) =>
                      const Center(child: CustomLoadingDialog(size: 40)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.getWidth(context: context) - 220,
                    child: Text(
                      cartModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: FontStyle.f16w500black,
                    ),
                  ),
                  Text(
                    'Available in stock',
                    style: FontStyle.f14w400gray.copyWith(color: Colors.green),
                  ),
                  Text('${cartModel.price}\$', style: FontStyle.f16w500black),
                ],
              ),

              Column(
                children: [
                  const CustomIconButton(icon: Icons.remove),
                  Text('${cartModel.amount}${cartModel.servicesType}'),
                  const CustomIconButton(icon: Icons.add),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Customelinearbutton(
            onTap: () async {
              String address =
                  await prefs.getString(PrefsKeys.location) ??
                  "Please Let us Access Location";
              String userPhoneNumper =
                  await prefs.getString(PrefsKeys.userPhone) ?? "Not Found";
              context.navigateTo(
                context: context,
                child: BlocProvider<StripePaymentCubit>(
                  create: (context) =>
                      StripePaymentCubit(sl.get<CheckoutReboImp>()),
                  child: DelivaryView(
                    cartModel: cartModel,
                    address: address,
                    amount: cartModel.amount,
                    price: cartModel.price,
                    phoneNumper: userPhoneNumper,
                  ),
                ),
              );
            },
            child: const Text('Checkout', style: FontStyle.f16w500white),
            width: 180,
            height: 40,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
