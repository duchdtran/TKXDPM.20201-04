import 'package:ecobike_rental/controller/home.dart';
import 'package:ecobike_rental/views/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../../entity/station/station.dart';
import 'home.dart';
import 'rental.dart';

class StartScreen extends StatelessWidget {
  const StartScreen._({Key key}) : super(key: key);

  static Widget withDependency() {
    return StateNotifierProvider<HomeController, HomeDataSet>(
      create: (_) => HomeController(),
      child: const StartScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomeController>().initDataSet();

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
              selector: (buildContext, ds) => ds.bike != null);
        }
      },
      selector: (buildContext, ds) => ds.init,
    );
  }
}
