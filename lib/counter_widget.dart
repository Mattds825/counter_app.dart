import 'package:counters/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'constants.dart';

class CounterWidget extends StatefulWidget {
  Counter counterClass;
  ColorMode colorMode;
  CounterWidget({this.counterClass, this.colorMode});

  @override
  _CounterWidget createState() => _CounterWidget();
}

class _CounterWidget extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: getStye(widget.colorMode),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: NeumorphicIconButton(
                colorMode: widget.colorMode,
                icon: Icons.add,
                onTap: () {
                  setState(() {
                    widget.counterClass.countAmount++;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: NeumorphicText(widget.counterClass.countAmount.toString(),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.w700),
                  style: getStye(widget.colorMode)),
            ),
          ),
          Expanded(
            child: Center(
              child: NeumorphicIconButton(
                colorMode: widget.colorMode,
                icon: Icons.remove,
                onTap: () {
                  if (widget.counterClass.countAmount > 0) {
                    setState(
                      () {
                        widget.counterClass.countAmount--;
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NeumorphicIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final ColorMode colorMode;

  NeumorphicIconButton({this.colorMode, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: NeumorphicIcon(icon, size: 40.0, style: getStye(colorMode)),
      onTap: onTap,
    );
  }
}
