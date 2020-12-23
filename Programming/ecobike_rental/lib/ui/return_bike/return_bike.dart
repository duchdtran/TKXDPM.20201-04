import 'package:ecobike_rental/model/service/network/request/transaction.dart';
import 'package:ecobike_rental/provider/providers.dart';
import 'package:ecobike_rental/ui/invoice/invoice.dart';
import 'package:ecobike_rental/ui/start/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../model/core/cores.dart';
import '../../provider/return_bike.dart';
import '../dialog.dart';

class ReturnBikeScreen extends StatelessWidget {
  const ReturnBikeScreen._({Key key}) : super(key: key);

  static Widget withDependency() {
    return StateNotifierProvider<ReturnBikeProvider, ReturnBikeDataSet>(
      create: (_) => ReturnBikeProvider(),
      child: const ReturnBikeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ReturnBikeProvider>().initDataSet();
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => InvoiceScreen()));
                    //   await showLoadingDialog(
                    //     context,
                    //     function: () async {
                    //       final transactionRefund = TransactionRequest(
                    //         owner: 'Group 4',
                    //         createdAt: '2020-11-12 10:55:26',
                    //         amount: bikeRented.deposits,
                    //         cvvCode: '228',
                    //         dateExpired: '1125',
                    //         cardCode: '118609_group4_2020',
                    //         transactionContent: 'Trả lại tiền cọc',
                    //         command: 'refund',
                    //       );
                    //       await context
                    //           .read<ReturnBikeProvider>()
                    //           .processTransaction(transactionRefund);
                    //       final money = await context
                    //           .read<ReturnBikeProvider>()
                    //           .returnBike(station.id, bikeRented.id);
                    //       final transactionPay = TransactionRequest(
                    //         owner: 'Group 4',
                    //         createdAt: '2020-11-12 10:55:26',
                    //         amount: money,
                    //         cvvCode: '228',
                    //         dateExpired: '1125',
                    //         cardCode: '118609_group4_2020',
                    //         transactionContent: 'Trả tiền thuê xe',
                    //         command: 'pay',
                    //       );
                    //       final message = await context
                    //           .read<ReturnBikeProvider>()
                    //           .processTransaction(transactionPay);
                    //       await showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return CustomDialogBox(
                    //             title: message,
                    //             onPress: () => Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         StartScreen.withDependency())),
                    //           );
                    //         },
                    //       );
                    //     },
                    //   );
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
