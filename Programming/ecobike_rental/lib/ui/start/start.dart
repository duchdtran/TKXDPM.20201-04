import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../model/core/cores.dart';
import '../../provider/home.dart';
import '../widget/loading.dart';
import 'home/home.dart';
import 'rental/rental.dart';

class StartScreen extends StatelessWidget {
  const StartScreen._({Key key}) : super(key: key);

  static Widget withDependency() {
    return StateNotifierProvider<HomeProvider, HomeDataSet>(
      create: (_) => HomeProvider(),
      child: const StartScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomeProvider>().initDataSet();

    return Selector<HomeDataSet, bool>(
      builder: (context, data, child) {
        if (!data) {
          return Center(child: LoadingScreen());
        } else {
          final listStation = context
              .select<HomeDataSet, List<Station>>((ds) => ds.listStation);
          return Selector<HomeDataSet, bool>(
          builder: (context, data, child) {
          if (data) {
          return RentalScreen(listStation);
          } else {
          return HomeScreen(listStation);
          }
          },
          selector: (buildContext, ds) => ds.rental == null);
        }
      },
      selector: (buildContext, ds) => ds.init,
    );
  }
}
