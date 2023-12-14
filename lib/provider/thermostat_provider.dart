import 'package:flutter/widgets.dart';

class ThermostatProvider extends ChangeNotifier {
  bool _isButttonClicked = false;
  bool get isButttonClickedValue => _isButttonClicked;

  double _volumeValue = 0;
  double get volumeValue => _volumeValue;

  double _containerHeight = 50.0;
  double get containerHeightValue => _containerHeight;

  void isButttonClicked() {
    _isButttonClicked = !_isButttonClicked;
    notifyListeners();
  }

  void updateVolumeChanged(double volumeValue) {
    _volumeValue = volumeValue;
    notifyListeners();
  }

  void updateContainerHeight(double containerHeight) {
    _containerHeight = containerHeight;
    notifyListeners();
  }
}
