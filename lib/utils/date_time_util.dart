import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();

  static String formatDate({required String inputDate}) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('EEEE, d MMMM').format(dateTime);

    return formattedDate;
  }

  static String formatTimeRange(
      {required String startTime, required String endTime}) {
    DateTime startDateTime = DateTime.parse(startTime);
    DateTime endDateTime = DateTime.parse(endTime);

    String formattedStartTime = DateFormat('HH:mm').format(startDateTime);

    String formattedEndTime = DateFormat('HH:mm').format(endDateTime);

    String timeRange = '$formattedStartTime - $formattedEndTime';

    return timeRange;
  }

  static String formatTimeElapsed({required String inputDateTime}) {
    DateTime inputDate = DateTime.parse(inputDateTime);
    DateTime currentDate = DateTime.now();

    int difference =
        currentDate.millisecondsSinceEpoch - inputDate.millisecondsSinceEpoch;
    int seconds = (difference / 1000).round();
    int minutes = (seconds / 60).round();
    int hours = (minutes / 60).round();

    // Convert hours to days
    int days = (hours / 24).round();

    if (days >= 2) {
      return DateFormat('dd MMMM').format(inputDate);
    } else if (days == 1) {
      return 'Yesterday';
    } else if (hours >= 1) {
      return '$hours hour${hours > 1 ? 's' : ''}';
    } else {
      return '$minutes minute${minutes > 1 ? 's' : ''}';
    }
  }

  static String consultationTimeFormat({required String timeOfScheduling}) {
    DateTime dateTime = DateTime.parse(timeOfScheduling);

    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);

    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    String formattedDateTime = '$formattedDate - $formattedTime';

    return formattedDateTime;
  }
}
