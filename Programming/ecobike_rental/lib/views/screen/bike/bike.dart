import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecobike_rental/controller/bike.dart';
import 'package:ecobike_rental/views/widget/gradient_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../helper/bike.dart';
import '../../../model/bike.dart';
import '../payment/payment.dart';

class BikeScreen extends StatelessWidget {
  const BikeScreen._({Key key}) : super(key: key);

  static Widget withDependency(int bikeId) {
    return StateNotifierProvider<BikeController, BikeDataSet>(
      create: (_) => BikeController(bikeId, ApiBikeHelper()),
      child: const BikeScreen._(),
    );
  }

  List<T> map<T>(List list, Function handler) {
    final result = <T>[];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<BikeController>().initDataSet();
    final bike = context.select<BikeDataSet, Bike>((value) => value.bike);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Selector<BikeDataSet, bool>(
        builder: (context, data, child) {
          if (!data) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          bike.bikeName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "Biển số xe: ${bike.licensePlates}",

                                style: const TextStyle(color: Colors.black),
                                // children: [
                                //   const TextSpan(
                                //       text: ' (500m)',
                                //       style: TextStyle(color: Colors.blue)),
                                // ],
                              ),
                            ),
                            const Spacer(),
                            _buildRatingBar(context, 3.5),
                            const Text('(5)'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        height: 200,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 5000),
                        pauseAutoPlayOnTouch: const Duration(seconds: 10),
                        scrollDirection: Axis.horizontal,
                        items: context
                            .select<BikeDataSet, List<String>>(
                                (value) => value.bike.images)
                            .map((imgUrl) {
                          return Builder(
                            builder: (context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Image.network(
                                  imgUrl,
                                  fit: BoxFit.fitHeight,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        'Tiền đặt cọc: ${context.select<BikeDataSet, int>((value) => value.bike.deposits)}đ',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black87, width: 1),
                        ),
                        child: _buildRentCost(context),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        // ignore: lines_longer_than_80_chars
                        child: Text(context.select<BikeDataSet, String>(
                            (value) => value.bike.description)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => showMaterialModalBottomSheet(
                                    context: context,
                                    builder: (context, scrollController) =>
                                        PaymentScreen.withDependency(
                                          bike.id,
                                        )),
                                child: const Center(
                                    child: Text(
                                  'Thuê xe này',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Liên hệ bãi xe',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 1,
                                  height: double.infinity,
                                  color: Colors.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Hoặc',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  width: 1,
                                  height: double.infinity,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
        selector: (buildContext, ds) => ds.init,
      ),
    );
  }

  Widget _buildRentCost(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Giá khởi điểm cho 30 phút đầu là ',
          style: const TextStyle(color: Colors.black87),
          children: [
            TextSpan(
              text:
                  '${context.select<BikeDataSet, int>((value) => value.bike.costStartingRent)}đ',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: '. Cứ mỗi 15 phút tiếp theo, bạn sẽ phải trả thêm ',
              style: TextStyle(color: Colors.black87),
            ),
            TextSpan(
              text:
                  '${context.select<BikeDataSet, int>((value) => value.bike.costHourlyRent)}đ',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: '.',
              style: TextStyle(color: Colors.black87),
            ),
          ]),
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
    ));
  }
}
