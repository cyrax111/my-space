/// Core UI package — design system, adaptive layouts, and shared widgets.
///
/// Inspired by Material 3 with custom design tokens.
/// All widgets are responsive and accessible by default.
library core_ui;

// Theme
export 'src/theme/app_theme.dart';
export 'src/theme/app_colors.dart';
export 'src/theme/app_text_styles.dart';
export 'src/theme/app_spacing.dart';
export 'src/theme/app_shadows.dart';

// Layout
export 'src/layout/breakpoints.dart';
export 'src/layout/adaptive_scaffold.dart';
export 'src/layout/responsive_builder.dart';
export 'src/layout/sliver_adaptive_padding.dart';

// Widgets
export 'src/widgets/app_card.dart';
export 'src/widgets/app_image.dart';
export 'src/widgets/section_header.dart';
export 'src/widgets/skill_bar.dart';
export 'src/widgets/social_icon_button.dart';
export 'src/widgets/tag_chip.dart';
export 'src/widgets/animated_gradient_text.dart';
export 'src/widgets/loading_indicator.dart';
export 'src/widgets/error_view.dart';
export 'src/widgets/empty_state.dart';

// Extensions
export 'src/extensions/context_extensions.dart';

// Platform
export 'src/platform/platform_info.dart';
