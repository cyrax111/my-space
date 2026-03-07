import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/profile_data.dart';
import 'about_event.dart';
import 'about_state.dart';

/// BLoC for the about feature.
///
/// Loads the user profile data (currently static, future: from API/CMS).
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(const AboutState.initial()) {
    on<AboutLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    AboutLoadRequested event,
    Emitter<AboutState> emit,
  ) async {
    emit(const AboutState.loading());
    try {
      final profile = getSampleProfile();
      emit(AboutState.loaded(profile: profile));
    } catch (e) {
      emit(AboutState.error(message: 'Failed to load profile: $e'));
    }
  }
}
