import 'feature_flag.dart';
import 'feature_flag_provider.dart';

/// In-memory feature flag provider for development and testing.
///
/// Falls back to [FeatureFlag.defaultValue] when no override is set.
class InMemoryFeatureFlags extends FeatureFlagProvider {
  final Map<FeatureFlag, bool> _overrides = {};

  @override
  bool isEnabled(FeatureFlag flag) =>
      _overrides[flag] ?? flag.defaultValue;

  @override
  Future<void> refresh() async {
    // No-op for in-memory provider.
  }

  @override
  void setOverride(FeatureFlag flag, bool value) {
    _overrides[flag] = value;
  }

  @override
  void clearOverride(FeatureFlag flag) {
    _overrides.remove(flag);
  }

  @override
  void clearAllOverrides() {
    _overrides.clear();
  }
}
