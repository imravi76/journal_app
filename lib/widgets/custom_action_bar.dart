import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomActionBar extends StatelessWidget {

  final String title;
  final bool isHome;

  const CustomActionBar({super.key, required this.title, required this.isHome});

  @override
  Widget build(BuildContext context) {

    bool _isHome = isHome;

    final Shader linearGradient = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[Color(0xffFF606D), Color(0xffD468CC)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Container(
      padding: const EdgeInsets.only(
          top: 40.0,
          left: 24.0,
          right: 24.0,
          bottom: 20.0
      ),

      decoration: BoxDecoration(
        color: _isHome ? Colors.white : Colors.transparent
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){ !_isHome ?
              Navigator.pop(context) : null;
            },
            child:  Icon(
              Icons.arrow_back_ios,
              color: _isHome ? null : Colors.white,
            ),
          ),

            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, foreground: _isHome ? (Paint()..shader = linearGradient) : null, color: _isHome ? null : Colors.white),
            ),

          InkWell(
            onTap: (){ _isHome ?
              Get.snackbar("Info", "Click on FAB to go to second screen.") : null;
            },
            child: Icon(Icons.info_outline,
              color: _isHome ? null : Colors.white,),
          )

        ],
      ),
    );
  }
}