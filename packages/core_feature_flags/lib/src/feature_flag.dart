/// Defines all feature flags in the application.
///
/// Each flag has a [key] (for remote config lookup) and a [defaultValue].
enum FeatureFlag {
  /// Whether the blog section is visible.
  blogEnabled('blog_enabled', true),

  /// Whether the portfolio section is visible.
  portfolioEnabled('portfolio_enabled', true),

  /// Whether the contact form is active.
  contactFormEnabled('contact_form_enabled', true),

  /// Whether dark mode is available to users.
  darkModeEnabled('dark_mode_enabled', true),

  /// Whether to show the "Work in Progress" banner.
  wipBannerEnabled('wip_banner_enabled', false),

  /// Whether analytics collection is active.
  analyticsEnabled('analytics_enabled', false),
  ;

  /// Remote config key for this flag.
  final String key;

  /// Default value when remote config is unavailable.
  final bool defaultValue;

  const FeatureFlag(this.key, this.defaultValue);
}
