import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;

  HomeViewModel({required this.ridePreferenceState});

  List<RidePreference> get history => ridePreferenceState.history;
  RidePreference? get currentPreference => ridePreferenceState.currentPreference;

  void onRidePrefSelected(RidePreference selectedPreference) async {
    ridePreferenceState.selectPreference(selectedPreference);
    notifyListeners();
  }

}
