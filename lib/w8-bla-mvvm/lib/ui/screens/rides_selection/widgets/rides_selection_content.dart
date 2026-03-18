import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RidesSelectionViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: vm.selectedPreference,
              onBackPressed: () => vm.onBackTap(context),
              onFilterPressed: vm.onFilterPressed,
              onPreferencePressed: () async {
                final newPref = await Navigator.of(context)
                    .push<RidePreference>(
                      AnimationUtils.createRightToLeftRoute(
                        RidePreferenceModal(
                          initialPreference: vm.selectedPreference,
                        ),
                      ),
                    );
                if (newPref != null) {
                  vm.selectNewPreference(newPref);
                }
              },
            ),

            SizedBox(height: 100),

            Expanded(
              child: ListView.builder(
                itemCount: vm.matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: vm.matchingRides[index],
                  onPressed: () => vm.onRideSelected(vm.matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
