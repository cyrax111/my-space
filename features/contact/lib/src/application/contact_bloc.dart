import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/contact_repository.dart';
import 'contact_state.dart';

class ContactBloc extends Cubit<ContactState> {
  ContactBloc(this._repository) : super(const ContactState(items: <dynamic>[]));

  final ContactRepository _repository;

  Future<void> load() async {
    emit(ContactState(items: state.items, isLoading: true));
    final result = await _repository.getAll();
    emit(ContactState(items: result));
  }
}
