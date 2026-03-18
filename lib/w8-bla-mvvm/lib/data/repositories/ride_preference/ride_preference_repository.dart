import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  void addPreferenceToHistory(RidePreference ridePreference);
  List<RidePreference> getHistory();
  int get maxAllowedSeats;
}
