import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/cart/presentation/cubit/addtocart/addtocart_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/services/presentation/view/widget/customIconButton.dart';

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
                child: Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: BorderRadius.circular(15),
                        onPressed: (context) {
                          state.data[index].delete();
                          BlocProvider.of<AddtocartCubit>(context).getCart();
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      Text('✅  '),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(15),
                        child: CachedNetworkImage(
                          width: 120.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          imageUrl: state.data[index].iamgeUrl,
                          placeholder: (context, url) => const Center(
                            child: CustomLoadingDialog(size: 40),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.getWidth(context: context) - 220,
                            child: Text(
                              state.data[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: FontStyle.f16w500black,
                            ),
                          ),
                          Text(
                            'Available in stock',
                            style: FontStyle.f14w400gray.copyWith(
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            '${state.data[index].price}\$',
                            style: FontStyle.f16w500black,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const CustomIconButton(icon: Icons.remove),
                          Text(
                            '${state.data[index].amount}${state.data[index].servicesType}',
                          ),
                          const CustomIconButton(icon: Icons.add),
                        ],
                      ),
                    ],
                  ),
                ),
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
