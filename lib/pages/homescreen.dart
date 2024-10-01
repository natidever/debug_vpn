import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reward_vpn/utils/constants.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 62, 37, 37),
      body: LayoutBuilder(builder: (context, constriants) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                fit: BoxFit.cover,
                Constants.homepage_background,
              ),
            )
          ],
        );
      }),
    );
  }
}
