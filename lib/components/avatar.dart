// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final VoidCallback? onPress;

  Avatar({super.key, required this.imageUrl, required this.size, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl)
          )
        ),
      ),
    );
  }
}
