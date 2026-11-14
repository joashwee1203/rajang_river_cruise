import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CruiseBookingScreen> createState() => _CruiseBookingScreenState();
}

class _CruiseBookingScreenState extends State<CruiseBookingScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_refreshScreen);
  }

  @override
  void didUpdateWidget(CruiseBookingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.removeListener(_refreshScreen);
      widget.viewModel.addListener(_refreshScreen);
    }
  }

  void _refreshScreen() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_refreshScreen);
    super.dispose();
  }

  List<Widget> _buildDetails() {
    final vm = widget.viewModel;
    return [
      TitleSectionWidget(
        name: vm.destination.name,
        location: vm.destination.location,
        starCount: vm.starCount,
        isStarred: vm.isStarred,
        onStarPressed: vm.toggleStar,
      ),
      const ActionBarWidget(),
      DescriptionWidget(
        description: vm.destination.description,
      ),
      BookingControlsWidget(viewModel: vm),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise & Heritage'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                HeaderImageWidget(
                  imagePath: vm.destination.imagePath,
                ),
                ..._buildDetails(),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox.expand(
                    child: HeaderImageWidget(
                      imagePath: vm.destination.imagePath,
                      height: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: _buildDetails(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}