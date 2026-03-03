import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/about.dart';
import '../../domain/use_cases/get_abouts_use_case.dart';

part 'about_event.dart';
part 'about_state.dart';
part 'about_bloc.freezed.dart';

@injectable
class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final GetAboutsUseCase _getAboutsUseCase;

  AboutBloc(this._getAboutsUseCase) : super(const AboutState.initial()) {
    on<_LoadAbouts>(_onLoadAbouts);
  }

  Future<void> _onLoadAbouts(
    _LoadAbouts event,
    Emitter<AboutState> emit,
  ) async {
    emit(const AboutState.loading());
    
    final result = await _getAboutsUseCase();
    
    result.fold(
      (failure) => emit(AboutState.error(failure)),
      (abouts) => emit(AboutState.loaded(abouts)),
    );
  }
}
