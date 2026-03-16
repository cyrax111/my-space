import 'feature_flag.dart';

/// Abstract feature flag provider.
///
/// Implementations can read from local storage, remote config,
/// LaunchDarkly, Firebase Remote Config, etc.
abstract class FeatureFlagProvider {
  /// Check if a feature is enabled.
  bool isEnabled(FeatureFlag flag);

  /// Refresh flags from the remote source.
  Future<void> refresh();

  /// Override a flag locally (for development/testing).
  void setOverride(FeatureFlag flag, bool value);

  /// Clear a local override.
  void clearOverride(FeatureFlag flag);

  /// Clear all local overrides.
  void clearAllOverrides();
}
