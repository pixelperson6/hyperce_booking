import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// Utility class for date and time formatting and parsing.
class SDateTimeUtil {
  SDateTimeUtil._();

  // 📅 --- DATE FORMATS ---
  static const String dateIso = 'yyyy-MM-dd';          // e.g. 2025-11-02
  static const String dateSlash = 'dd/MM/yyyy';        // e.g. 02/11/2025
  static const String dateUS = 'MM/dd/yyyy';           // e.g. 11/02/2025
  static const String dateFriendly = 'd MMM, yyyy';    // e.g. 2 Nov, 2025
  static const String dateFull = 'MMMM dd, yyyy';      // e.g. November 02, 2025

  // ⏰ --- TIME / DATETIME FORMATS ---
  static const String time24h = 'HH:mm:ss';            // e.g. 14:35:45
  static const String time12h = 'hh:mm a';             // e.g. 02:35 PM
  static const String dateTimeFull = 'yyyy-MM-dd HH:mm:ss'; // e.g. 2025-11-02 14:35:45
  static const String dateTimeFriendly = 'd MMM, yyyy h:mm a'; // e.g. 2 Nov, 2025 2:35 PM
  static const String dateTimeIso = 'yyyy-MM-ddTHH:mm:ss';     // e.g. 2025-11-02T14:35:45

  /// Converts a formatted [string] to [DateTime].
  /// Returns `null` if parsing fails or input is empty.
  static DateTime? stringToDateTime(
    String? formattedString, {
    String format = dateTimeFull,
  }) {
    if (formattedString == null || formattedString.trim().isEmpty) {
      return null;
    }
    try {
      return DateFormat(format).parse(formattedString);
    } catch (e) {
      if (kDebugMode) log('❌ Invalid date format ($formattedString): $e');
      return null;
    }
  }

  /// Converts a [DateTime] object to a formatted string.
  /// Returns `null` if input is null or formatting fails.
  static String? dateTimeToString(
    DateTime? dateTime, {
    String format = dateTimeFull,
  }) {
    if (dateTime == null) return null;
    try {
      return DateFormat(format).format(dateTime);
    } catch (e) {
      if (kDebugMode) log('❌ Invalid date format: $e');
      return null;
    }
  }

  /// Returns the current time formatted in [format].
  static String now({String format = dateTimeFull}) {
    return DateFormat(format).format(DateTime.now());
  }
}
