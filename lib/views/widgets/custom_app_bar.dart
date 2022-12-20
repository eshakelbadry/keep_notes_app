import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Keep Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        CustomSearchIcon()
      ],
    );
  }
}
