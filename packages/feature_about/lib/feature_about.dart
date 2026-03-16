/// About feature package.
///
/// Displays personal information, skills, experience timeline, and social links.
library feature_about;

// Domain
export 'src/domain/entities/profile.dart';
export 'src/domain/entities/skill.dart';
export 'src/domain/entities/experience.dart';

// Data
export 'src/data/profile_data.dart';

// Presentation
export 'src/presentation/bloc/about_bloc.dart';
export 'src/presentation/bloc/about_event.dart';
export 'src/presentation/bloc/about_state.dart';
export 'src/presentation/pages/about_page.dart';
