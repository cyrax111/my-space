import 'package:core_feature_flags/core_feature_flags.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InMemoryFeatureFlags', () {
    late InMemoryFeatureFlags flags;

    setUp(() {
      flags = InMemoryFeatureFlags();
    });

    test('returns default value when no override', () {
      expect(flags.isEnabled(FeatureFlag.blogEnabled), isTrue);
      expect(flags.isEnabled(FeatureFlag.wipBannerEnabled), isFalse);
    });

    test('setOverride overrides default', () {
      flags.setOverride(FeatureFlag.blogEnabled, false);
      expect(flags.isEnabled(FeatureFlag.blogEnabled), isFalse);
    });

    test('clearOverride restores default', () {
      flags.setOverride(FeatureFlag.blogEnabled, false);
      flags.clearOverride(FeatureFlag.blogEnabled);
      expect(flags.isEnabled(FeatureFlag.blogEnabled), isTrue);
    });

    test('clearAllOverrides restores all defaults', () {
      flags.setOverride(FeatureFlag.blogEnabled, false);
      flags.setOverride(FeatureFlag.portfolioEnabled, false);
      flags.clearAllOverrides();

      expect(flags.isEnabled(FeatureFlag.blogEnabled), isTrue);
      expect(flags.isEnabled(FeatureFlag.portfolioEnabled), isTrue);
    });

    test('refresh completes without error', () async {
      await expectLater(flags.refresh(), completes);
    });
  });

  group('FeatureFlag', () {
    test('all flags have unique keys', () {
      final keys = FeatureFlag.values.map((f) => f.key).toSet();
      expect(keys.length, FeatureFlag.values.length);
    });

    test('key matches expected format', () {
      for (final flag in FeatureFlag.values) {
        expect(flag.key, matches(RegExp(r'^[a-z_]+$')));
      }
    });
  });
}
