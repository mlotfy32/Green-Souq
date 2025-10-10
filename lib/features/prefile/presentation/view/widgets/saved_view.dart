import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/widgets/customLoadingDialog.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/saved_cubit.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:green_souq/features/prefile/presentation/view/widgets/saved_item.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  void initState() {
    BlocProvider.of<SavedCubit>(context).getSaved();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu_rounded, size: 30, color: Colors.black),
        title: const Text('My Saved', style: FontStyle.f22w500black),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          if (state is SavedEmpty) {
            return const Center(
              child: Text('No Data To Display', style: FontStyle.f25w500black),
            );
          } else if (state is SavedSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: SavedItem(
                  rating: state.data[index].rating,
                  servicesType: state.data[index].servicesType,
                  price: state.data[index].price,
                  imageUrl: state.data[index].imageUrl,
                  name: state.data[index].name,
                ),
              ),
              itemCount: state.data.length,
            );
          } else if (state is SavedFailure) {
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
