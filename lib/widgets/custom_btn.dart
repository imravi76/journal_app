import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final String? text;
  final bool? outlineBtn;

  const CustomBtn({super.key, this.text, this.outlineBtn});

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false;

    final Shader linearGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[Color(0xffFF606D), Color(0xffD468CC)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    final Shader linearGradientWhite = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[Color(0xffffffff), Color(0xffffffff)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Container(
      padding: const EdgeInsets.all(16.0),

      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),

      decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0)
      ),

      height: 55.0,
      child: Center(
        child: Text(
          text ?? "Button",
          style: TextStyle(
            fontSize: 12.0,
            foreground: _outlineBtn ? (Paint()..shader = linearGradientWhite) : (Paint()..shader = linearGradient),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

    );
  }
}