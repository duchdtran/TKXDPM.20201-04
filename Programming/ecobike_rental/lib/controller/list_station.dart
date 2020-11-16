import 'package:ecobike_rental/view/station/station.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ListStation extends StatefulWidget{


  @override
  _ListStationState createState() => _ListStationState();

}

class _ListStationState extends State<ListStation>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Tìm kiếm',
            style: TextStyle(color: Colors.grey),
          ),

          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
              Icons.search,
              color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.black,
              ),
            ),
          ],
        ),
      body:Column(
          children: [
            _buildStationItemWidget(),
            _buildStationItemWidget(),
            _buildStationItemWidget()
          ],
      )
    );
  }

  Widget _buildStationItemWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Station()));
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Station()));
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
                            'Xem trạm xe',
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
