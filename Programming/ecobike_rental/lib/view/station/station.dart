import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Station extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Ấn đi'),
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            builder: (context, scrollController) => _buildBikeDetail(),
            expand: false,
          ),
        ),
      ),
    );
  }

  Widget _buildBikeDetail() {
    return Container(
      height: 500,
    );
  }
}
