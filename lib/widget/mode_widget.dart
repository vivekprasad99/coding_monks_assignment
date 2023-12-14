import 'package:flutter/material.dart';

class ModeWidget extends StatelessWidget {
  final bool? isButttonClickedValue;
  const ModeWidget(this.isButttonClickedValue,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Image.asset(
              'assets/images/Mode.png',
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  "Mode",
                  style: TextStyle(
                      color: Colors.grey[900]?.withOpacity(isButttonClickedValue ?? false ? 1 : 0.2),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Auto",
                  style: TextStyle(
                      color: Colors.grey[600]?.withOpacity(isButttonClickedValue ?? false ? 1 : 0.2),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
