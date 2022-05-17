import 'package:flutter/material.dart';

const textStyle1 = TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontSize: 18.0,
);

const textStyle2 = TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontSize: 40.0,
  fontWeight: FontWeight.w900
);

const textStyle3 = TextStyle(
  color: Color.fromARGB(255, 0, 0, 0),
  fontSize: 20.0,
);

class DataContainer extends StatelessWidget {

  DataContainer({required this.icon, required this.tittle});

  final IconData icon;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
          const SizedBox(
            height: 15.0,
        ),
        Text(
          tittle,
          style: textStyle1,
        )
      ]
    );
  }
}
