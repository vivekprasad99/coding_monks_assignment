import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SwitchWidget extends StatelessWidget {
  final Function() onClickTap;
  final bool? isButttonClickedValue;
  final Function(double value) onVolumeChanged;
  final double volumeValue;

  SwitchWidget(
      this.onClickTap, this.isButttonClickedValue, this.onVolumeChanged,this.volumeValue,
      {super.key});


  List<Color> colorList = [
    const Color(0xff46B2E3),
    const Color(0xff4C24FB),
    const Color(0xff4C24FB),
    const Color(0xff46B2E3)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 8,
            right: 0,
            child: Image.asset(
              'assets/images/white_circle.png',
              height: 300,
            ),
          ),
          circularSliderWidget(context),
        ],
      ),
    );
  }

  Widget circularSliderWidget(BuildContext context)
  {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: 0,
      right: 0,
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: volumeValue,
        appearance: CircularSliderAppearance(
          customWidths: CustomSliderWidths(
            trackWidth: 30,
            progressBarWidth: 0,
            handlerSize: isButttonClickedValue ?? false ? 10 : 0,
            shadowWidth: 0,
          ),
          customColors: CustomSliderColors(
            trackColors: isButttonClickedValue ?? false
                ? colorList
                : [const Color(0xffC9D9E8), const Color(0xffC9D9E8)],
            progressBarColor: Colors.transparent,
            hideShadow: true,
          ),
          size: 200,
          animationEnabled: false,
        ),
        onChange: (double startvalue) {
          isButttonClickedValue ?? false ? onVolumeChanged(startvalue) : onVolumeChanged(0);
        },
        innerWidget: (double value) {
          return InkWell(
            onTap: () {
              onClickTap();
            },
            child: Image.asset(
              isButttonClickedValue ?? false
                  ? 'assets/images/switch.png'
                  : 'assets/images/disable_switch.png',
            ),
          );
        },
      ),
    );
  }
}
