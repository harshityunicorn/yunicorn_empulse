import 'package:yunicorn_empulse/core/constants/enums.dart';
import 'package:yunicorn_empulse/data/models/user.dart';

class UserFilters {
  final TRIPS? selectedTrip;
  final DEPARTMENT? selectedDepartment;

  UserFilters({this.selectedTrip, this.selectedDepartment});

  UserFilters copyWith({TRIPS? selectedTrip, DEPARTMENT? selectedDepartment}) {
    return UserFilters(
      selectedTrip: selectedTrip ?? this.selectedTrip,
      selectedDepartment: selectedDepartment ?? this.selectedDepartment,
    );
  }
}