import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository ridePreferenceRepository;

  RidePreferenceState({required this.ridePreferenceRepository}) {
    _loadHistory();
  }

  List<RidePreference> _history = [];
  RidePreference? _currentPreference;

  List<RidePreference> get history => _history;
  RidePreference? get currentPreference => _currentPreference;

  void _loadHistory() {
    _history = ridePreferenceRepository.getHistory();
    notifyListeners();
  }

  void selectPreference(RidePreference preference) {
    if (_currentPreference != preference) {
      _currentPreference = preference;

      ridePreferenceRepository.addPreferenceToHistory(preference);

      _history.insert(0, preference);

      notifyListeners();
    }
  }
}
