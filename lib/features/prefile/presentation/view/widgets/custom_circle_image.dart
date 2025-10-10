import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/core/utiles/styles/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/getlocation/getlocation_cubit.dart';
import 'package:green_souq/main.dart';

class CustomCircleImage extends StatefulWidget {
  const CustomCircleImage({
    super.key,
    required this.location,
    required this.userPic,
  });
  final String location;
  final String userPic;
  @override
  State<CustomCircleImage> createState() => _CustomCircleImageState();
}

class _CustomCircleImageState extends State<CustomCircleImage> {
  @override
  void initState() {
    if (widget.location == 'not found') {
      BlocProvider.of<GetlocationCubit>(context).accessLocation();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          savedList.length.toString(),
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,

                          'Favorite',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          orders.toString(),
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,

                          'Orders',
                          style: FontStyle.f22w500black.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                width: double.infinity,
                height: 100,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(widget.userPic),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            prefs.getString(PrefsKeys.userName) == null
                ? 'Not Found'
                : '${prefs.getString(PrefsKeys.userName)}',
            style: FontStyle.f22w500black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_pin, color: Colors.grey),
              BlocBuilder<GetlocationCubit, GetlocationState>(
                builder: (context, state) {
                  return Text(
                    textAlign: TextAlign.center,
                    state is GetlocationSuccess ? state.town : widget.location,
                    style: FontStyle.f16w400gray,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
