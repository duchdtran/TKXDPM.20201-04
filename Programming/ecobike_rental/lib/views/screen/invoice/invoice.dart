import 'package:ecobike_rental/controller/invoice.dart';
import 'package:ecobike_rental/views/dialog/dialog.dart';
import 'package:ecobike_rental/views/widget/app_button.dart';
import 'package:ecobike_rental/views/widget/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import '../../../helper/rental.dart';
import '../start/start.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen._({Key key, this.stationId, this.bikeId})
      : super(key: key);

  static Widget withDependency(stationId, bikeId) {
    return StateNotifierProvider<InvoiceController, InvoiceDataSet>(
      create: (_) => InvoiceController(ApiRentalHelper()),
      child: InvoiceScreen._(
        stationId: stationId,
        bikeId: bikeId,
      ),
    );
  }

  final int stationId;
  final int bikeId;
  @override
  Widget build(BuildContext context) {
    context.watch<InvoiceController>().initDataSet();
    int returnMoney =
        context.select<InvoiceDataSet, int>((value) => value.returnMoney);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hóa đơn'),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Selector<InvoiceDataSet, bool>(
          selector: (buildContext, ds) => ds.init,
          builder: (context, data, child) {
            if (!data) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Hi vọng bạn hài lòng về chuyến đi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildRowInFo(
                            'Tên xe',
                            context.select<InvoiceDataSet, String>(
                                (value) => value.bikeRented.bikeName)),
                        _buildRowInFo('Thời gian thuê',
                            '${context.select<InvoiceDataSet, int>((value) => value.totalTime)} Phút'),
                        _buildRowInFo('Giá thuê 30 phút đầu',
                            '${context.select<InvoiceDataSet, int>((value) => value.bikeRented.costStartingRent)}đ'),
                        _buildRowInFo('Giá thuê theo giờ',
                            '${context.select<InvoiceDataSet, int>((value) => value.bikeRented.costHourlyRent)}đ'),
                        _buildRowInFo('Chi phí thuê',
                            '${context.select<InvoiceDataSet, int>((value) => value.rentalMoney)}đ'),
                        _buildRowInFo('Tiền đặt cọc',
                            '${context.select<InvoiceDataSet, int>((value) => value.bikeRented.deposits)}đ'),
                        const Divider(
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Tiền trả lại',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                                '${context.select<InvoiceDataSet, int>((value) => value.returnMoney)}đ'),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Đánh giá chuyến đi'),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildRatingBar(context, 5),
                  const SizedBox(
                    height: 50,
                  ),
                  AppButton(
                    title: 'Xác nhận thanh toán',
                    onPress: () async {
                      await showLoadingDialog(
                        context,
                        function: () async {
                          final result = await context
                              .read<InvoiceController>()
                              .refund(returnMoney, 'Thanh toán tiền thuê xe');
                          if (result['result']) {
                            await context
                                .read<InvoiceController>()
                                .returnBike(stationId, bikeId);
                          }
                          Navigator.pop(context);
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialogBox(
                                title: result['message'],
                                onPress: !result['result']
                                    ? null
                                    : () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StartScreen.withDependency())),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            );
          }),
    );
  }

  Widget _buildRowInFo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, double initRating) {
    return Wrap(
      children: List.generate(
        5,
        (index) => GradientIcon(
          Icons.star,
          20,
          LinearGradient(
            colors: <Color>[
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
