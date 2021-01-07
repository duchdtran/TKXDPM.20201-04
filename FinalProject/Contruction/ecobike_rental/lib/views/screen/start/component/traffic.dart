import 'package:flutter/material.dart';

Widget Traffic(String title, IconData icon, bool active, Function() toggleFilter) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 30,
        child: FlatButton(
          onPressed: () {
            toggleFilter();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: active ? const BorderSide(color: Colors.lightBlueAccent) : const BorderSide(color: Colors.white),
          ),
          child: Row(
            children: [
              Icon(icon, size: 16, color: Colors.black.withOpacity(0.7)),
              const SizedBox(
                width: 10,
                height: 0,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
            ],
          ),
      )
  ));
}