import 'package:core_ui/core_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('classify width to compact', () {
    expect(classifyWidth(320), AdaptiveSizeClass.compact);
  });

  test('classify width to medium', () {
    expect(classifyWidth(800), AdaptiveSizeClass.medium);
  });

  test('classify width to expanded', () {
    expect(classifyWidth(1440), AdaptiveSizeClass.expanded);
  });
}
