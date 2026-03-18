import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_content.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import 'widgets/ride_preference_modal.dart';
import 'widgets/rides_selection_header.dart';
import 'widgets/rides_selection_tile.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RidesSelectionViewModel(
        ridePrefState: context.read<RidePreferenceState>(), 
        rideRepo: context.read<RideRepository>()
      ),
      child: RidesSelectionContent(),    
    );
  }
}
