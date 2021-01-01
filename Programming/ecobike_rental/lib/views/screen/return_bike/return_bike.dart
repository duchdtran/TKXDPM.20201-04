import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../../controller/return_bike.dart';
import '../../../helper/rental.dart';
import '../../../helper/station.dart';
import '../../../model/bike.dart';
import '../../../model/station.dart';
import '../invoice/invoice.dart';

class ReturnBikeScreen extends StatelessWidget {
  const ReturnBikeScreen._({Key key}) : super(key: key);

  static Widget withDependency() {
    return StateNotifierProvider<ReturnBikeController, ReturnBikeDataSet>(
      create: (_) => ReturnBikeController(ApiStationHelper(), ApiRentalHelper()),
      child: const ReturnBikeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ReturnBikeController>().initDataSet();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vui lòng chọn bãi xe để trả'),
        ),
        body: Selector<ReturnBikeDataSet, bool>(
          builder: (context, data, child) {
            if (!data) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _buildListBikeWidget(context);
            }
          },
          selector: (buildContext, ds) => ds.init,
        ));
  }

  Widget _buildListBikeWidget(BuildContext context) {
    final bikeRented =
        context.select<ReturnBikeDataSet, Bike>((value) => value.bikeRented);
    return ListView.builder(
      itemCount: context
          .select<ReturnBikeDataSet, int>((value) => value.listStation.length),
      itemBuilder: (context, index) => Builder(
        builder: (context) {
          return _buildBikeItemWidget(
            context,
            context.select<ReturnBikeDataSet, Station>(
              (value) => value.listStation[index],
            ),
            bikeRented,
          );
        },
      ),
    );
  }

  Widget _buildBikeItemWidget(
      BuildContext context, Station station, Bike bikeRented) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Image.network(
              station.image,
              width: 200,
              height: 120,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    station.stationName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    station.contactName,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceScreen.withDependency(station.id, bikeRented.id)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).accentColor,
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: const Center(
                        child: Text(
                          'Trả xe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
