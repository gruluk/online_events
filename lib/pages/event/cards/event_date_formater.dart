import 'package:intl/intl.dart';

class EventDateFormatter {
  static final daysNorwegian = {
    'Monday': 'Mandag',
    'Tuesday': 'Tirsdag',
    'Wednesday': 'Onsdag',
    'Thursday': 'Torsdag',
    'Friday': 'Fredag',
    'Saturday': 'Lørdag',
    'Sunday': 'Søndag',
  };

  static final monthsNorwegian = {
    'January': 'Januar',
    'February': 'Februar',
    'March': 'Mars',
    'April': 'April',
    'May': 'Mai',
    'June': 'Juni',
    'July': 'Juli',
    'August': 'August',
    'September': 'September',
    'October': 'Oktober',
    'November': 'November',
    'December': 'Desember',
  };

  static String formatEventDates(String startDate, String endDate) {
    DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateFormat outputTimeFormat = DateFormat("HH:mm");
    DateFormat outputDayFormat = DateFormat("EEEE");
    DateFormat outputMonthFormat = DateFormat("MMMM");
    DateFormat outputDayOfMonthFormat = DateFormat("d");

    DateTime startDateTime = inputFormat.parse(startDate, true);
    DateTime endDateTime = inputFormat.parse(endDate, true);

    if (startDateTime.year == endDateTime.year &&
        startDateTime.month == endDateTime.month &&
        startDateTime.day == endDateTime.day) {
      String dayName = daysNorwegian[outputDayFormat.format(startDateTime)]!;
      String monthName = monthsNorwegian[outputMonthFormat.format(startDateTime)]!;
      String dayOfMonth = outputDayOfMonthFormat.format(startDateTime);
      String formattedStartTime = outputTimeFormat.format(startDateTime);
      String formattedEndTime = outputTimeFormat.format(endDateTime);

      return "$dayName, $dayOfMonth. $monthName, $formattedStartTime-$formattedEndTime";
    } else {
      String startDayOfMonth = outputDayOfMonthFormat.format(startDateTime);
      String endDayOfMonth = outputDayOfMonthFormat.format(endDateTime);
      String startMonthName = monthsNorwegian[outputMonthFormat.format(startDateTime)]!;
      String endMonthName = monthsNorwegian[outputMonthFormat.format(endDateTime)]!;
      String formattedStartTime = outputTimeFormat.format(startDateTime);
      String formattedEndTime = outputTimeFormat.format(endDateTime);

      return "$startDayOfMonth. $startMonthName $formattedStartTime - $endDayOfMonth. $endMonthName $formattedEndTime";
    }
  }
}