/// Feature flags for runtime feature toggling.
///
/// Supports local overrides and remote configuration.
/// Use [FeatureFlagProvider] to check if features are enabled.
library core_feature_flags;

export 'src/feature_flag.dart';
export 'src/feature_flag_provider.dart';
export 'src/in_memory_feature_flags.dart';
