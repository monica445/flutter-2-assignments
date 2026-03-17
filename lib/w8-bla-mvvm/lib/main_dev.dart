import 'package:blabla/data/repositories/location/location_repository.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';
import 'main_common.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final ridePreferenceRepository = RidePreferenceRepositoryMock();

  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferenceRepository>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (_) => RidePreferenceState(ridePreferenceRepository: ridePreferenceRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
