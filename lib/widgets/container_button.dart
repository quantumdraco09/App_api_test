

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/color.dart';

class ContainerButtonModel extends StatelessWidget {


final Color ? bgColor;
final double ? containerWidth;
final String  itext;



   ContainerButtonModel({super.key, this.bgColor, this.containerWidth, required this.itext});

  @override
  Widget build(BuildContext context) {
    return  Container (

          height : 50,
           width : containerWidth,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor


           ),
           child: Center(
              child: Text( itext,  style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold, fontSize: 18),

              ),

           ),

    );
  }
}