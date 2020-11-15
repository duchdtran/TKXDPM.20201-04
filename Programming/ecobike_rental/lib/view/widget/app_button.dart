import 'package:flutter/material.dart';


// ignore: must_be_immutable
class AppButton extends StatefulWidget {
  AppButton({@required this.title, @required this.onPress, this.icon,});

  String title;
  IconData icon;
  Function onPress;

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      onPressed: widget.onPress,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,

              ],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(80)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: widget.icon != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      widget.icon,
                      size: 18,
                    ),
                  )),
              Text(widget.title),
            ],
          )),
    );
  }
}
