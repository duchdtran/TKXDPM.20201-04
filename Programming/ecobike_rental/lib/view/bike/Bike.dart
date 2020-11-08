import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../gradien_icon.dart';
import '../payment.dart';

class Bike extends StatefulWidget {
  @override
  _BikeState createState() => _BikeState();
}

class _BikeState extends State<Bike> {
  CarouselSlider carouselSlider;

  int _current = 0;

  List imgList = [
    'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
    'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
    'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
    'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
    'https://salt.tikicdn.com/cache/w444/ts/product/a8/56/fc/74b35562a43d3f40956d3bceff558b32.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Xe đạp thể thao Fornix FR-303',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Bãi cọ ecopark',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: ' (500m)',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                      Spacer(),
                      _buildRatingBar(context, 3.5),
                      Text('(400)'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                carouselSlider = CarouselSlider(
                  height: 200.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 5000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _current == index ? Colors.blue : Colors.grey,
                          width: 1,
                        ),
                        color: _current == index
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text('Giá thuê: 200.000đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: 'Giá khởi điểm cho 30 phút đầu là ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '10.000đ',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text:
                                '. Cứ mỗi 15 phút tiếp theo, bạn sẽ phải trả thêm ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: '3.000đ',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.blue),
                                left: BorderSide(color: Colors.blue),
                                right: BorderSide(color: Colors.blue),
                                bottom: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    width: 3)),
                          ),
                          child: Center(
                            child: Text('Chi tiết'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          // decoration: BoxDecoration(
                          //   border: Border(top: BorderSide(color: Colors.blue), left: BorderSide(color: Colors.blue), right: BorderSide(color: Colors.blue), ),
                          // ),
                          child: Center(
                            child: Text('Chi tiết'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          // decoration: BoxDecoration(
                          //   border: Border(top: BorderSide(color: Colors.blue), left: BorderSide(color: Colors.blue), right: BorderSide(color: Colors.blue), ),
                          // ),
                          child: Center(
                            child: Text('Chi tiết'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      'Mở đầu BST xe đạp thể thao từ FORNIX năm 2020, bạn không thể bỏ qua xe đạp mạnh mẽ FORNIX F8. Với thiết kế mạnh mẽ đầy cá tính, FORNIX F8 còn mang đến cho bạn những trải nghiệm tốc độ của bộ truyền động đầy mạnh mẽ'),
                ),
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
                                  Payment()),
                          child: Center(
                              child: Text(
                            'Thuê xe này',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      ),
                      Expanded(
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
                            margin: EdgeInsets.only(top: 5),
                            width: 1,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Hoặc',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
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
      ),
    );
  }

  Widget _buildPayment() {
    return Container(
      height: 500,
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
