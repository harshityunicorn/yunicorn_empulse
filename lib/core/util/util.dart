class Util {
  static String getTimeDifference(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  // For future dates
  static String getTimeDifferenceFromNow(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.isNegative) {
      // Past date
      final absDifference = difference.abs();
      if (absDifference.inDays > 0) {
        return '${absDifference.inDays} ${absDifference.inDays == 1 ? 'day' : 'days'} ago';
      } else if (absDifference.inHours > 0) {
        return '${absDifference.inHours} ${absDifference.inHours == 1 ? 'hour' : 'hours'} ago';
      } else if (absDifference.inMinutes > 0) {
        return '${absDifference.inMinutes} ${absDifference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      } else {
        return 'Just now';
      }
    } else {
      // Future date
      if (difference.inDays > 0) {
        return 'In ${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'}';
      } else if (difference.inHours > 0) {
        return 'In ${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'}';
      } else if (difference.inMinutes > 0) {
        return 'In ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'}';
      } else {
        return 'Now';
      }
    }
  }

  // If you only want days
  static int getDaysFromNow(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    return difference.inDays;
  }
}
