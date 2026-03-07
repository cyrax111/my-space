/// Contact feature package.
///
/// Contact form with validation, submission handling, and success feedback.
library feature_contact;

// Domain
export 'src/domain/entities/contact_message.dart';
export 'src/domain/use_cases/send_contact_message.dart';

// Presentation
export 'src/presentation/bloc/contact_bloc.dart';
export 'src/presentation/bloc/contact_event.dart';
export 'src/presentation/bloc/contact_state.dart';
export 'src/presentation/pages/contact_page.dart';
