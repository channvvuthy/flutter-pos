import 'package:flutter/cupertino.dart';

import '../../constants/color.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          width: double.infinity,
          height: 50,
          color: white,
          child: Text('Helllo'),
        ),
      )
    ],);
  }
}
