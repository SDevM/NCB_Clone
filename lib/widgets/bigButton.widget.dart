import 'package:flutter/material.dart';
import 'package:untitled/shared/clipPaths.dart';

class BigButton extends StatefulWidget {
  final Icon top;
  final String bottom;
  final Color color;
  final Color textColor;

  const BigButton(
      {Key? key,
      required this.top,
      required this.bottom,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        onPressed: () {},
        color: widget.color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            ClipPath(
              clipper: TopBumpR(),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.top,
                  Center(
                    child: Text(
                      widget.bottom,
                      style: TextStyle(color: widget.textColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
