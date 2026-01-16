import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalDatePicker extends StatelessWidget {
  const HorizontalDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    // Generate 8 dates starting from yesterday
    final List<DateTime> dates = List.generate(
      8,
      (index) => today.add(Duration(days: index - 1)),
    );

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final date = dates[index];
          final bool isToday = DateUtils.isSameDay(date, today);

          return Container(
            width: 60,
            decoration: BoxDecoration(
              color: isToday ? Colors.blue : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('EEE').format(date), // Mon, Tue
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  date.day.toString(), // 1,2,3
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
