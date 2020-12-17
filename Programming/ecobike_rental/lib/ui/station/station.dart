import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../model/core/bike.dart';
import '../../provider/station.dart';
import '../bike/bike.dart';
import '../payment/payment.dart';

class StationScreen extends StatelessWidget {
  const StationScreen._({Key key}) : super(key: key);

  static Widget withDependency(int stationId) {
    return StateNotifierProvider<StationProvider, StationDataSet>(
      create: (_) => StationProvider(stationId),
      child: const StationScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<StationProvider>().initDataSet();
    return Scaffold(
      body: Selector<StationDataSet, bool>(
        builder: (context, data, child) {
          if (!data) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return DefaultTabController(
              length: 3,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 150,
                        floating: false,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text(
                                context.select<StationDataSet, String>(
                                    (value) => value.station.stationName),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                )),
                            background: Image.network(
                              context.select<StationDataSet, String>(
                                    (value) => value.station.image),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      SliverPersistentHeader(
                        delegate: _SliverAppBarDelegate(
                          const TabBar(
                            labelColor: Colors.black87,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(text: 'Xe đạp đơn'),
                              Tab(text: 'Xe đạp đôi'),
                              Tab(text: 'Xe đạp điện'),
                            ],
                          ),
                        ),
                        pinned: true,
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      _buildListBikeWidget(context, 1),
                      _buildListBikeWidget(context, 2),
                      _buildListBikeWidget(context, 3),
                    ],
                  )),
            );
          }
        },
        selector: (buildContext, ds) => ds.init,
      ),
    );
  }

  Widget _buildListBikeWidget(BuildContext context, int bikeType) {
    final listBike = context.watch<StationProvider>().loadListBike(bikeType);

    return ListView.builder(
      itemCount:
          context.select<StationDataSet, int>((value) => listBike.length),
      itemBuilder: (context, index) => Builder(
        builder: (context) {
          return _buildBikeItemWidget(context, listBike[index]);
        },
      ),
    );
  }

  Widget _buildBikeItemWidget(BuildContext context, Bike bike) {
    return InkWell(
      onTap: bike.isRented?null:() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BikeScreen.withDependency(bike.id)));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                bike.images[0] ??
                'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bike.bikeName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    bike.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            '${bike.costHourlyRent}đ/h',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Giá thuê',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: bike.isRented?null:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BikeScreen.withDependency(bike.id)));
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context, scrollController) =>
                                  PaymentScreen.withDependency(bike.id));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).accentColor,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child:  Center(
                            child: Text(
                              bike.isRented?'Đã thuê': 'Thuê xe',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
