import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yunicorn_empulse/core/constants/color_contants.dart';
import 'package:yunicorn_empulse/core/constants/text_constants.dart';
import 'package:yunicorn_empulse/core/navigation/navigation_services.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});


  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 350.h,
      decoration: BoxDecoration(color: ColorContants.text_grey_white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TextConstants.filter,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  NavigationService.pop(context);
                },
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorContants.card_back_ground_grey,
                  ),
                  child: Icon(Icons.close, size: 20),
                ),
              ),
            ],
          ),
          Divider(),

          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextConstants.eligibilityByTrip,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [Radio(value: 'dubai',)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
