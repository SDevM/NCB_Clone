

import 'package:flutter/material.dart';

import '../pages/home.page.dart';

class TopRow extends StatelessWidget {
  final String title;
  final String sub;

  const TopRow({
    Key? key,
    required this.widget,
    required this.title,
    required this.sub,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: widget.titleStyle,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                sub,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxWidth: 30, maxHeight: 30),
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                ))
          ],
        ),
      ],
    );
  }
}