import 'package:flutter/material.dart';
import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/data/models/user.dart';
import 'package:yunicorn_empulse/data/models/user_filters.dart';

class UserFilterBottomSheet extends StatefulWidget {
  final UserFilters? initialFilters;

  const UserFilterBottomSheet({Key? key, this.initialFilters})
    : super(key: key);

  @override
  State<UserFilterBottomSheet> createState() => _UserFilterBottomSheetState();

  static Future<UserFilters?> show(
    BuildContext context, {
    UserFilters? initialFilters,
  }) {
    return showModalBottomSheet<UserFilters>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          UserFilterBottomSheet(initialFilters: initialFilters),
    );
  }
}

class _UserFilterBottomSheetState extends State<UserFilterBottomSheet> {
  TRIPS? selectedTrip;
  DEPARTMENT? selectedDepartment;

  @override
  void initState() {
    super.initState();
    selectedTrip = widget.initialFilters?.selectedTrip;
    selectedDepartment = widget.initialFilters?.selectedDepartment;
  }

  String _getTripLabel(TRIPS trip) {
    switch (trip) {
      case TRIPS.dubai:
        return 'Dubai';
      case TRIPS.europe:
        return 'Europe';
      case TRIPS.venice:
        return 'Venice';
      case TRIPS.all:
        return 'All';
    }
  }

  String _getDepartmentLabel(DEPARTMENT dept) {
    switch (dept) {
      case DEPARTMENT.development:
        return 'Development team';
      case DEPARTMENT.business:
        return 'Business team';
      case DEPARTMENT.design:
        return 'Design team';
      case DEPARTMENT.humanResources:
        return 'HR';
      case DEPARTMENT.qa:
        return "QA";
      case DEPARTMENT.marketing:
        return "Marketing";
      case DEPARTMENT.all : 
        return "All";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filters',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Eligibility by trip',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          ...TRIPS.values.map(
            (trip) => _buildRadioOption(
              label: _getTripLabel(trip),
              value: trip,
              groupValue: selectedTrip,
              onChanged: (value) {
                setState(() {
                  selectedTrip = value as TRIPS?;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Department / Teams',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          ...DEPARTMENT.values.map(
            (dept) => _buildRadioOption(
              label: _getDepartmentLabel(dept),
              value: dept,
              groupValue: selectedDepartment,
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value as DEPARTMENT?;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  UserFilters(
                    selectedTrip: selectedTrip,
                    selectedDepartment: selectedDepartment,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2C3E7C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Apply Filter',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }

  Widget _buildRadioOption<T>({
    required String label,
    required T value,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
  }) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2C3E7C)
                      : const Color(0xFFD0D5DD),
                  width: isSelected ? 6 : 2,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: const Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
