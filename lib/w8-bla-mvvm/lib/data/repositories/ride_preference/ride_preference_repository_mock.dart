import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  final int _maxAllowedSeats = 8;
  final List<RidePreference> _history = [];

  @override
  void addPreferenceToHistory(RidePreference ridePreference) {
    _history.add(ridePreference);
  }

  List<RidePreference> getHistory() {
    return _history;
  }
 
  @override
  int get maxAllowedSeats => _maxAllowedSeats;
}
