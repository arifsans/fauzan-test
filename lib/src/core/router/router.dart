import 'package:fauzan_test/src/features/bottom_nav/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/bloc/sliding_panel/sliding_panel_bloc.dart';
import 'package:fauzan_test/src/features/bottom_nav/presentation/pages/bottom_nav_page.dart';
import 'package:fauzan_test/src/features/home/presentation/bloc/wellness/wellness_bloc.dart';
import 'package:fauzan_test/src/features/home/presentation/pages/home_page.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kabupaten/kabupaten_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kecamatan/kecamatan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/kelurahan/kelurahan_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/provinsi/provinsi_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/stepper/stepper_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/bloc/user/user_bloc.dart';
import 'package:fauzan_test/src/features/profile/presentation/pages/profile_page.dart';
import 'package:fauzan_test/src/features/wellness_detail/presentation/pages/wellness_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      case '/bottom_nav':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => SlidingPanelBloc()),
              BlocProvider(create: (_) => BottomNavBloc()),
              BlocProvider(
                create: (_) => WellnessBloc()
                  ..add(
                    const WellnessEvent.checkAndInsertInitialData(),
                  ),
              ),
            ],
            child: const BottomNavPage(),
          ),
        );

      case '/home':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const HomePage(),
        );

      case '/profile':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => StepperBloc()),
              BlocProvider(
                create: (_) => UserBloc()
                  ..add(
                    const UserEvent.checkAndInsertInitialData(),
                  ),
              ),
              BlocProvider(
                create: (_) => ProvinsiBloc()
                  ..add(
                    const ProvinsiEvent.get(),
                  ),
              ),
              BlocProvider(create: (_) => KabupatenBloc()),
              BlocProvider(create: (_) => KecamatanBloc()),
              BlocProvider(create: (_) => KelurahanBloc()),
            ],
            child: const ProfilePage(),
          ),
        );

      case '/wellness_detail':
        List wellnessDetailArguments = [];
        if (settings.arguments is List) {
          wellnessDetailArguments = settings.arguments as List;
        }
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => WellnessDetailPage(
            heroTag: wellnessDetailArguments[0],
            wellness: wellnessDetailArguments[1],
          ),
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
