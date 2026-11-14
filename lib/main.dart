import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final CruiseBookingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CruiseBookingViewModel();
    _viewModel.addListener(_updateApp);
  }

  void _updateApp() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _viewModel.removeListener(_updateApp);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rajang River Cruise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _viewModel.themeMode,
      home: CruiseBookingScreen(
        viewModel: _viewModel,
      ),
    );
  }
}