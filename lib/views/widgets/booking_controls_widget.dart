import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  State<BookingControlsWidget> createState() =>
      BookingControlsWidgetState();
}

class BookingControlsWidgetState extends State<BookingControlsWidget> {
  Future<void> selectDate() async {
    final now = DateTime.now();
    final initialDate = widget.viewModel.selectedDate ?? now;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (pickedDate != null) {
      widget.viewModel.setVisitDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trip Preferences',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Cruise Date'),
            subtitle: Text(
              vm.selectedDate == null
                  ? 'Select a date'
                  : '${vm.selectedDate!.day}/'
                  '${vm.selectedDate!.month}/'
                  '${vm.selectedDate!.year}',
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: selectDate,
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: vm.selectedPackage,
            decoration: const InputDecoration(
              labelText: 'Cruise Package',
              border: OutlineInputBorder(),
            ),
            items: vm.cruisePackages.map((package) {
              return DropdownMenuItem<String>(
                value: package,
                child: Text(package),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                vm.setCruisePackage(value);
              }
            },
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode'),
            value: vm.isDarkMode,
            onChanged: vm.toggleTheme,
          ),
        ],
      ),
    );
  }
}