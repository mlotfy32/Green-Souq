import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/core/utiles/widgets/customeLinearButton.dart';
import 'package:green_souq/features/auth/foregetPass/data/generateOtp.dart';
import 'package:green_souq/features/cart/data/models/cart_model.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/customIconButton.dart';
import 'package:green_souq/features/services/presentation/view/widget/hire_workers_fore.dart';

class HireWorkers extends StatefulWidget {
  const HireWorkers({
    super.key,
    required this.image,
    required this.title,
    required this.servicesType,
  });
  final String image;
  final String title;
  final String servicesType;

  @override
  State<HireWorkers> createState() => _HireWorkersState();
}

class _HireWorkersState extends State<HireWorkers> {
  late TextEditingController location;
  late TextEditingController type;
  late TextEditingController houre;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    location = TextEditingController();
    type = TextEditingController();
    houre = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    location.dispose();
    type.dispose();
    houre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 1;
    int price = GenerateOtp().generateRandomNumber(2);
    List<dynamic> amountList = [];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              context.navigateBack(context: context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 30),
          ),
          title: Text(widget.title, style: FontStyle.f22w500black),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.bookmark),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: widget.image,
                    placeholder: (context, url) =>
                        const Center(child: CustomLoadingDialog(size: 40)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Text(widget.title, style: FontStyle.f16w500black),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available in stock',
                    style: FontStyle.f14w400gray.copyWith(color: Colors.green),
                  ),
                  Text('$price\$ / worker', style: FontStyle.f16w500black),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '⭐ ${GenerateOtp().generateRandomNumber(1)}.${GenerateOtp().generateRandomNumber(1)} (${GenerateOtp().generateRandomNumber(3)})',
                    style: FontStyle.f14w400gray,
                  ),
                  Row(
                    children: [
                      CustomIconButton(
                        icon: Icons.remove,
                        onPressed: () {
                          BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).changeAmount(count: count > 1 ? --count : count);
                        },
                      ),
                      BlocBuilder<ChangeAmoutCubit, ChangeAmoutState>(
                        builder: (context, state) {
                          final amount = BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).amount;
                          amountList.add(amount ?? '1');
                          return Text(
                            '  ${amount == null ? 1 : widget.servicesType} ',
                          );
                        },
                      ),
                      CustomIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          BlocProvider.of<ChangeAmoutCubit>(
                            context,
                          ).changeAmount(count: ++count);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Text('Information', style: FontStyle.f22w500black),
              SizedBox(
                height: context.getHeight(context: context) / 2.7,
                child: HireWorkersForm(
                  formKey: formKey,
                  location: location,
                  type: type,
                  houres: houre,
                ),
              ),
              Expanded(
                child: Customelinearbutton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AddtocartCubit>(context).addToCart(
                        cart: CartModel(
                          name: widget.title,
                          amount: amountList.last,
                          price: price.toString(),
                          servicesType: widget.servicesType,
                          iamgeUrl: widget.image,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Add To Cart',
                    style: FontStyle.f22w500black.copyWith(color: Colors.white),
                  ),
                  width: double.infinity,
                  height: 55,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
