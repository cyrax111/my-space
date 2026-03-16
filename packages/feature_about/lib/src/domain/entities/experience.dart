import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';

/// A single experience / timeline entry.
@freezed
class Experience with _$Experience {
  const Experience._();

  const factory Experience({
    required String title,
    required String company,
    required DateTime startDate,
    DateTime? endDate,
    String? description,
    @Default([]) List<String> technologies,
  }) = _Experience;

  /// Whether this is the current position.
  bool get isCurrent => endDate == null;

  /// Duration display string.
  String get durationDisplay {
    final end = endDate ?? DateTime.now();
    final months =
        (end.year - startDate.year) * 12 + end.month - startDate.month;
    final years = months ~/ 12;
    final remainingMonths = months % 12;
    if (years > 0 && remainingMonths > 0) {
      return '${years}y ${remainingMonths}m';
    } else if (years > 0) {
      return '${years}y';
    }
    return '${remainingMonths}m';
  }
}
