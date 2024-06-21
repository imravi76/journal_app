import 'package:flutter/material.dart';

class WarningSign extends StatelessWidget {
  const WarningSign({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [Color(0xffFF606D), Color(0xff4A82FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning, color: Colors.yellow),
                const SizedBox(width: 8.0),
                Flexible(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      children: [
                        TextSpan(
                          text: 'Important',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                          ': This output is not legal advice & should be reviewed by an expert lawyer before use.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
