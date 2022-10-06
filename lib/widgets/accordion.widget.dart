import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final Widget content;
  final Color color;

  const Accordion(
      {Key? key,
      required this.title,
      required this.content,
      this.color = Colors.white})
      : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (layoutContext, constraints) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // color: _showContent ? Colors.blue : Colors.grey.shade200,
        elevation: 0,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          ListTile(
            title: Text(widget.title),
            tileColor: _showContent ? Colors.blue : Colors.grey.shade200,
            trailing: IconButton(
              icon: RotatedBox(
                quarterTurns: _showContent ? 1 : -1,
                child: Center(
                  child: Padding(
                    padding: _showContent
                        ? const EdgeInsets.only(left: 10)
                        : const EdgeInsets.only(left: 10),
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
          ),
          _showContent
              ? Container(
                  width: constraints.maxWidth,
                  padding: const EdgeInsets.all(15),
                  color: widget.color,
                  child: widget.content,
                )
              : Container()
        ]),
      );
    });
  }
}
