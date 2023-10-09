import 'package:intl/intl.dart';

class Formatter {

  // DateTime Formatter : dd MMM yyyy - hh:mm a
  static String formatDateTime({required DateTime dateTime}) {
    final formatter = DateFormat('dd MMM yyyy - hh:mm a');
    return formatter.format(dateTime);
  }

  // Title Generator
  static String generateTitle({required String title}) {
    List<String> words = title.split(" ");
    List<String> selectedWords = [];
    if (words.length <= 10) {
      selectedWords = words;
    } else {
      selectedWords = words.sublist(0, 10);
    }
    return selectedWords.join(" ");
  }
}
