import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePrefState;
  final RideRepository rideRepo;

  RidesSelectionViewModel({
    required this.ridePrefState,
    required this.rideRepo,
  });

  RidePreference get selectedPreference => ridePrefState.currentPreference!;
  List<Ride> get matchingRides => rideRepo.getRidesFor(selectedPreference);

  void selectNewPreference(RidePreference newPref) {
    ridePrefState.selectPreference(newPref);
    notifyListeners(); 
  }

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {}

  void onRideSelected(Ride ride) {}
}
