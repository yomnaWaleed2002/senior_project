import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class Oxgen extends StatefulWidget {
  @override
  _oxgenState createState() => _oxgenState();
}

class _oxgenState extends State<Oxgen> with SingleTickerProviderStateMixin {

 late AnimationController animationController;

 @override
  void initState() {
   animationController = AnimationController(
       vsync: this,
     duration: Duration(seconds: 15),
   );
   animationController.addListener(() {
     setState(() {

     });
   });

   animationController.repeat();
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final percentage = animationController.value * 100;
   return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 175,
              width: 175,
              child: LiquidCircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xff469FD1)),
                value: animationController.value,
                center: Text('${percentage.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                borderColor: Colors.grey,
                borderWidth: 1.0,
                direction: Axis.vertical,
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}