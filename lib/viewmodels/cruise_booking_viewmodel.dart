import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest '
        'river, the Rajang. Cruise past historic temples, timber '
        'hubs, and waterfront settlements.',
    imagePath: 'assets/images/Rajang_River_Cruise.jpeg',
    initialRating: 43,
  );

  int _starCount = 43;
  bool _isStarred = false;

  int get starCount => _starCount;
  bool get isStarred => _isStarred;

  void toggleStar() {
    _isStarred = !_isStarred;
    if (_isStarred) {
      _starCount++;
    } else {
      _starCount--;
    }
    notifyListeners();
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  void setVisitDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  final List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  String _selectedPackage = 'Private River Cruise';
  String get selectedPackage => _selectedPackage;

  void setCruisePackage(String package) {
    if (cruisePackages.contains(package)) {
      _selectedPackage = package;
      notifyListeners();
    }
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode =>
      _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}