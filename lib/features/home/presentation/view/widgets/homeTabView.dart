import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_souq/core/utiles/extentions/extentions.dart';
import 'package:green_souq/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customAppBar.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customSearchRow.dart';
import 'package:green_souq/features/home/presentation/view/widgets/customerService.dart';
import 'package:green_souq/features/home/presentation/view/widgets/featuredItem.dart';
import 'package:green_souq/features/home/presentation/view/widgets/featuredText.dart';
import 'package:green_souq/features/prefile/presentation/cubits/saved/getlocation/getlocation_cubit.dart';
import 'package:green_souq/features/services/presentation/cubit/change_amout/change_amout_cubit.dart';
import 'package:green_souq/features/services/presentation/view/widget/servicesDetailes.dart';
import 'package:green_souq/main.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  SliverGridDelegateWithFixedCrossAxisCount delegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        crossAxisSpacing: 4,
      );
  @override
  void initState() {
    var location = prefs.getString(PrefsKeys.location);
    location ?? BlocProvider.of<GetlocationCubit>(context).accessLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomAppBar(title: '', isSearch: false),
          ),
          const SliverToBoxAdapter(child: CustomSearchRow()),
          const SliverToBoxAdapter(child: CustomerService()),
          const SliverToBoxAdapter(child: FeaturesText()),
          SliverGrid.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.navigateTo(
                  context: context,
                  child: BlocProvider<ChangeAmoutCubit>(
                    create: (context) => ChangeAmoutCubit(),
                    child: ServicesDetailes(
                      price1: '',
                      rating1: '',
                      isSaved: savedList.contains(name[index]),

                      search: name[index],
                      imageUrl: images[index],
                      servicesType: servicesType[index],
                    ),
                  ),
                );
              },
              child: FeaturedProductItem(
                servicesType: 'kg',
                image: images[index],
                name: ' ${name[index]}',
              ),
            ),
            itemCount: 4,
            gridDelegate: delegate,
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  'https://gonefarmers.com/cdn/shop/products/image_0bef0c27-a579-49da-90f2-b1fe09ac2ba0_2048x.jpg?v=1658638294',
  'https://www.thespruce.com/thmb/83Wv7sU2ccdWKuydlsQ82hxoITo=/6016x0/filters:no_upscale():max_bytes(150000):strip_icc()/lime-tree-care-guide-7554268-hero-8172d0f06fa14b3a87543d341a874a0a.JPG',
  'https://images.unsplash.com/photo-1614977645968-6db1d7798ac7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFybSUyMG1hY2hpbmVyeXxlbnwwfHwwfHx8MA%3D%3D',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiEMJt0goFpJ447nwCB4IQtduj9fGjmSYqAdImtQrtJG9_v7sEMClhVir9JH5nrHJkyY&usqp=CAU',
];
List<String> name = ['Rice Seeds', 'Lime', 'Machinery', 'Worker'];
List<String> servicesType = ['kg', 'kg', 'day', 'day'];
