import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/about_repository.dart';
import 'about_state.dart';

class AboutBloc extends Cubit<AboutState> {
  AboutBloc(this._repository) : super(const AboutState(items: <dynamic>[]));

  final AboutRepository _repository;

  Future<void> load() async {
    emit(AboutState(items: state.items, isLoading: true));
    final result = await _repository.getAll();
    emit(AboutState(items: result));
  }
}
