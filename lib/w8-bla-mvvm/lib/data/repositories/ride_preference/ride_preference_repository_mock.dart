import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock extends RidePreferenceRepository {
  final List<RidePreference> _history = [];

  @override
  void addToHistory(RidePreference ridePreference) {
    _history.add(ridePreference);
  }

  List<RidePreference> getHistory() {
    return _history;
  }
}
