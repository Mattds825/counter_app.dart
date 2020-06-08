import 'package:counters/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'constants.dart';

class PopUpCard extends StatefulWidget {
  Widget cardWidget;
  ColorMode colorMode;

  PopUpCard({this.cardWidget, this.colorMode});

  @override
  _PopUpCardState createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor2,
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 140.0),
            child: Stack(
              children: [
                Neumorphic(
                  style: getStye(widget.colorMode),
                  child: widget.cardWidget,
                ),
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: GestureDetector(
                    child: NeumorphicText(
                      'Delete',
                      style: getStye(widget.colorMode),
                      textStyle: NeumorphicTextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
                    ),
                    onTap: () {
                      Navigator.pop(context, Options.delete);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Options { delete, none }
