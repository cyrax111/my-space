import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/profile_data.dart';
import 'about_event.dart';
import 'about_state.dart';

/// BLoC for the about feature.
///
/// Loads the user profile data (currently static, future: from API/CMS).
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(const AboutState()) {
    on<AboutLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    AboutLoadRequested event,
    Emitter<AboutState> emit,
  ) async {
    emit(state.copyWith(
      status: AboutStatus.loading,
      errorMessage: () => null,
    ));
    try {
      final profile = getSampleProfile();
      emit(state.copyWith(
        status: AboutStatus.loaded,
        profile: () => profile,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AboutStatus.error,
        errorMessage: () => 'Failed to load profile: $e',
      ));
    }
  }
}
