import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/helper.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/features/prefile/data/models/saved_model.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/saved_cubit.dart';
import 'package:green_souq/main.dart';

class DetailesAppBar extends StatelessWidget {
  const DetailesAppBar({
    super.key,
    required this.isSaved,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.servicesType,
    required this.description,
  });
  final bool isSaved;
  final String imageUrl;
  final String name;
  final String price;
  final String rating;
  final String servicesType;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.navigateBack(context: context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 30),
        ),
        const Text('Details', style: FontStyle.f22w500black),
        IconButton(
          onPressed: () {
            if (savedList.contains(name)) {
              Helper.FlutterToast(title: 'Already Saved', success: false);
            } else {
              BlocProvider.of<SavedCubit>(context).addToSaved(
                save: SavedModel(
                  imageUrl: imageUrl,
                  name: name,
                  price: price,
                  rating: rating,
                  servicesType: servicesType,
                  description: description,
                ),
              );
            }
          },
          icon: BlocBuilder<SavedCubit, SavedState>(
            builder: (context, state) {
              if (state is AddToSaved) {
                return const Icon(
                  FontAwesomeIcons.solidBookmark,
                  color: Colors.green,
                );
              }
              return Icon(
                color: Colors.green,
                isSaved
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
              );
            },
          ),
        ),
      ],
    );
  }
}
