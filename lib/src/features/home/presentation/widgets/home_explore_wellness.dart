import 'package:collection/collection.dart';
import 'package:fauzan_test/src/core/helper/helper.dart';
import 'package:fauzan_test/src/core/router/app_route_enum.dart';
import 'package:fauzan_test/src/core/styles/app_colors.dart';
import 'package:fauzan_test/src/features/home/presentation/bloc/wellness/wellness_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeExploreWellness extends StatefulWidget {
  const HomeExploreWellness({
    super.key,
  });

  @override
  State<HomeExploreWellness> createState() => _HomeExploreWellnessState();
}

class _HomeExploreWellnessState extends State<HomeExploreWellness> {
  String wellnessSortValue = 'Terpopuler';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Explore Wellness',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.lightGray,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: <String>['Terpopuler', 'Termurah', 'Termahal'].map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  value: wellnessSortValue,
                  isDense: true,
                  isExpanded: false,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  onChanged: (value) {
                    setState(() {
                      wellnessSortValue = value ?? 'Terpopuler';
                      context.read<WellnessBloc>().add(
                            WellnessEvent.getWellnessData(
                              sort: value == 'Terpopuler'
                                  ? WellnessSorting.normal
                                  : value == 'Termurah'
                                      ? WellnessSorting.termurah
                                      : WellnessSorting.termahal,
                            ),
                          );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        BlocConsumer<WellnessBloc, WellnessState>(
          listener: (context, state) => state.mapOrNull(
            loaded: (item) => context.read<WellnessBloc>().add(
                  const WellnessEvent.getWellnessData(),
                ),
          ),
          builder: (context, state) => state.map(
            initial: (item) {
              return Container();
            },
            loading: (item) {
              return Container();
            },
            dataLoaded: (item) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.only(bottom: 100),
                physics: const NeverScrollableScrollPhysics(),
                children: item.wellnessData
                    .mapIndexed(
                      (index, wellness) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRouteEnum.wellnessDetailPage.name,
                                arguments: ['hero-$index', wellness],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 80,
                                      width: 160,
                                      child: Hero(
                                        tag: 'hero-$index',
                                        child: Image.asset(
                                          wellness.gambar,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    wellness.judul,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    Helper.rupiahFormatter('${wellness.harga}'),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            loaded: (item) {
              return Container();
            },
            error: (item) {
              return Text(item.message);
            },
          ),
        ),
      ],
    );
  }
}
