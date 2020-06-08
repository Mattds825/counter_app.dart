import 'dart:core';

import 'package:counters/constants.dart';
import 'package:counters/counter.dart';
import 'package:counters/counter_widget.dart';
import 'package:counters/popup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:vibrate/vibrate.dart';

class MainScreen extends StatefulWidget {
  List<Counter> counterList = List();
  int listSize;
  ColorMode colorMode = ColorMode.black;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    createCounterList(widget.colorMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.listSize,
            itemBuilder: (context, index) {
              return (index < widget.listSize - 2)
                  ? GestureDetector(
                      onLongPress: () {
                        Vibrate.feedback(FeedbackType.selection);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PopUpCard(
                                colorMode: widget.colorMode,
                                cardWidget: widget.counterList[index]
                                    .getCounterWidget(),
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: widget.counterList[index].getCounterWidget(),
                      ),
                    )
                  : (index < widget.listSize - 1)
                      ? Container(
                          padding: EdgeInsets.all(10.0),
                          child: AddButton(() {
                            setState(() {
                              print('adding');
                              addbutton(widget.colorMode);
                              //createCounterList(widget.colorMode);
                            });
                          }, widget.colorMode),
                        )
                      : Container(
                          padding: EdgeInsets.all(10.0),
                          child: ColorButton(() {
                            setState(() {
                              widget.colorMode =
                                  (widget.colorMode == ColorMode.black)
                                      ? ColorMode.white
                                      : ColorMode.black;
                              createCounterList(widget.colorMode);
                            });
                          }, widget.colorMode),
                        );
            },
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor() {
    switch (widget.colorMode) {
      case ColorMode.black:
        return kColor2;
        break;
      case ColorMode.white:
        return klColor2;
        break;
      case ColorMode.green:
        // TODO: Handle this case.
        break;
    }
  }

  void createCounterList(ColorMode colorMode) {
    widget.counterList = List.generate(5, (index) => Counter(index, colorMode));
    widget.listSize = widget.counterList.length + 2;
  }

  void addbutton(ColorMode colorMode) {
    widget.counterList.add(Counter(widget.counterList.length, colorMode));
    widget.listSize++;
  }
}

class AddButton extends StatefulWidget {
  final Function onTap;
  ColorMode colorMode;
  AddButton(this.onTap, this.colorMode);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: getStye(widget.colorMode),
      child: Center(
        child: NeumorphicIconButton(
          colorMode: widget.colorMode,
          icon: Icons.add,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

class ColorButton extends StatefulWidget {
  final Function onTap;
  ColorMode colorMode;
  ColorButton(this.onTap, this.colorMode);

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Neumorphic(
        style: getStye(widget.colorMode),
        child: Center(
          child: NeumorphicIconButton(
            colorMode: widget.colorMode,
            icon: Icons.color_lens,
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}
