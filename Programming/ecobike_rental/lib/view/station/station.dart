import 'package:ecobike_rental/view/bike/bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../payment/payment.dart';

class Station extends StatefulWidget {
  @override
  _StationState createState() => _StationState();
}

class _StationState extends State<Station> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
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
                      title: const Text('Bãi gửi xe đảo cọ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                      background: Image.network(
                        'https://i.pinimg.com/564x/b1/bc/3a/b1bc3a01ac9b8e70c4f11ef3b0c9cfae.jpg',
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
                _buildListBikeWidget(),
                _buildListBikeWidget(),
                _buildListBikeWidget(),
              ],
            )),
      ),
    );
  }

  Widget _buildListBikeWidget() {
    return ListView.builder(
        itemCount: 10, itemBuilder: (context, index) => _buildBikeItemWidget());
  }

  Widget _buildBikeItemWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bike()));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.network(
                'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Xe đạp thể thao Formix',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'FORNIX F8 mang đến những trải nghiệm \ntốc độ của bộ truyền động đầy mạnh mẽ',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                         Text(
                          '7.000đ/h',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                         const Text(
                          'Giá thuê',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Bike()));
                        showMaterialModalBottomSheet(
                            context: context,
                            builder: (context, scrollController) => Payment());
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
                        child: const Center(
                          child: Text(
                            'Thuê xe',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
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
