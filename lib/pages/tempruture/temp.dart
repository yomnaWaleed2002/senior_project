import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(42),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/thermometer 3.png'),
                radius: 33,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  "Temperature".tr,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 30,
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            width: 340,
              height: 340,
             child: SleekCircularSlider(
           appearance: CircularSliderAppearance(angleRange: 180,customColors:CustomSliderColors(progressBarColors: [Colors.yellowAccent,Colors.deepOrange])),
           initialValue: 50,
          ) ,
           
          )
          ),
        SizedBox(
          height: 70,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff469FD1),
            fixedSize: const Size(175, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: SizedBox(
            width: 103,
            height: 31,
            child: Text(
              "Measure".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
