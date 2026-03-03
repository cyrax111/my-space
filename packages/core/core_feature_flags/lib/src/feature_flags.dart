enum FeatureFlag { blog, portfolio, about, contact }

abstract interface class FeatureFlagReader {
  bool isEnabled(FeatureFlag flag);
}
