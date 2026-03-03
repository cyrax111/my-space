import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/portfolio_repository.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Cubit<PortfolioState> {
  PortfolioBloc(this._repository) : super(const PortfolioState(items: <dynamic>[]));

  final PortfolioRepository _repository;

  Future<void> load() async {
    emit(PortfolioState(items: state.items, isLoading: true));
    final result = await _repository.getAll();
    emit(PortfolioState(items: result));
  }
}
