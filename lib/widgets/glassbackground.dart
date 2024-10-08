import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reward_vpn/utils/constants.dart';
import 'package:reward_vpn/utils/layout.dart';
import 'package:reward_vpn/utils/texts.dart';
import 'package:reward_vpn/widgets/buttons.dart';

class Glassbackground extends StatelessWidget {
  Widget body;
  Glassbackground({required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(),
        ),
        Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ]),
              borderRadius: BorderRadius.circular(39),
              border: Border.all(
                color: Colors.white.withOpacity(0.13),
              ),
            ),
            child: body)
      ],
    );
  }
}
