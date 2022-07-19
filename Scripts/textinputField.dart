import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stl/constraint.dart';

class TextInputFeild extends StatefulWidget {
  final Function onEditingComplete;
  final TextEditingController controller;
  final String hint;
  final bool isReversal;
  final bool isObscure;
  final FocusNode node;

  const TextInputFeild(
      {Key key,
      this.onEditingComplete,
      this.controller,
      this.hint,
      this.isObscure = false,
      this.isReversal = false,
      this.node})
      : super(key: key);

  @override
  _TextInputFeildState createState() => _TextInputFeildState();
}

class _TextInputFeildState extends State<TextInputFeild> {
  final _key = new UniqueKey();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _widgetWidth = _size.width * 0.85;

    return Container(
      decoration: BoxDecoration(
          color: (widget.isReversal) ? Color(cMain) : Color(cGrey)),
      width: _widgetWidth,
      height: _widgetWidth * (9 / 61),
      child: Center(
        child: TextField(
          obscureText: widget.isObscure,
          textAlign: TextAlign.center,
          key: _key,
          onEditingComplete: () {
            widget.onEditingComplete(widget.controller.text);
          },
          focusNode: widget.node,
          style: TextStyle(
              color: (widget.isReversal) ? Colors.white : Color(cMain),
              fontFamily: "Dotum"),
          controller: widget.controller,
          cursorColor: (widget.isReversal) ? Colors.white : Color(cMain),
          decoration: InputDecoration.collapsed(
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: "Dotum",
                  fontSize: getFontSize(
                      context, _widgetWidth, widget.hint.length, 1.3))),
        ),
      ),
    );
  }
}