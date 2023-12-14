import 'package:coding_monks/provider/thermostat_provider.dart';
import 'package:coding_monks/widget/curve_clipper.dart';
import 'package:coding_monks/widget/mode_widget.dart';
import 'package:coding_monks/widget/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ThermoStatWidget extends StatefulWidget {
  const ThermoStatWidget({super.key});

  @override
  State<ThermoStatWidget> createState() => _ThermoStatWidgetState();
}

class _ThermoStatWidgetState extends State<ThermoStatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return ClipPath(
      clipper: CurveClipper(),
      child: Consumer<ThermostatProvider>(builder:
          (BuildContext context, ThermostatProvider value, Widget? child) {
        return Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                const Color(0xFFE1EEFF)
                    .withOpacity(value.isButttonClickedValue ? 1 : 0.3),
                const Color(0xFFE1EEFF)
                    .withOpacity(value.isButttonClickedValue ? 1 : 0.3),
              ],
              stops: const [
                0.2,
                0.7,
                1.0,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              buildBackIcon(),
                              buildTitle(context),
                            ],
                          ),
                          const Spacer(),
                          buildEditImg(),
                          buildDeleteIcon()
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      buildTemperatureText(),
                      AnimatedContainer(
                        height: value.containerHeightValue,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      ),
                      SwitchWidget(
                          () {
                            onButtonClick(value);
                          },
                          value.isButttonClickedValue,
                          (double value) {
                            WidgetsBinding.instance.addPostFrameCallback((_) =>
                                context
                                    .read<ThermostatProvider>()
                                    .updateVolumeChanged(value));
                          },
                          value.volumeValue),
                      buildTemperatureWidget(value.isButttonClickedValue),
                      const SizedBox(
                        height: 36,
                      ),
                      ModeWidget(value.isButttonClickedValue),
                    ],
                  ),
                )),
          ),
        );
      }),
    );
  }

  Widget buildBackIcon() {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Icon(
        Icons.arrow_back_sharp,
        color: Colors.black,
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        "Thermostat",
        style: TextStyle(
            color: Colors.grey[900],
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildEditImg() {
    return SvgPicture.asset(
      'assets/images/edit.svg',
    );
  }

  Widget buildDeleteIcon() {
    return const Padding(
      padding: EdgeInsets.only(right: 16, left: 8),
      child: Icon(Icons.delete_outline_outlined),
    );
  }

  Widget buildTemperatureText() {
    return Column(
      children: [
        Text(
          "Room Temperature is 24°C ",
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Room Humidity is Dry",
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget buildTemperatureWidget(bool value) {
    return Column(
      children: [
        Text(
          "16°C ",
          style: TextStyle(
              color: Colors.grey[900]?.withOpacity(value ? 1 : 0.2),
              fontSize: 32.0,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Temperature",
          style: TextStyle(
              color: Colors.grey[600]?.withOpacity(value ? 1 : 0.2),
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  void onButtonClick(ThermostatProvider value) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<ThermostatProvider>().isButttonClicked());
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<ThermostatProvider>()
        .updateContainerHeight(value.isButttonClickedValue ? 30 : 50));
  }
}
