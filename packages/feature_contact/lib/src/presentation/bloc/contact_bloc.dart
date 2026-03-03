import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/contact.dart';
import '../../domain/use_cases/get_contacts_use_case.dart';

part 'contact_event.dart';
part 'contact_state.dart';
part 'contact_bloc.freezed.dart';

@injectable
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUseCase _getContactsUseCase;

  ContactBloc(this._getContactsUseCase) : super(const ContactState.initial()) {
    on<_LoadContacts>(_onLoadContacts);
  }

  Future<void> _onLoadContacts(
    _LoadContacts event,
    Emitter<ContactState> emit,
  ) async {
    emit(const ContactState.loading());
    
    final result = await _getContactsUseCase();
    
    result.fold(
      (failure) => emit(ContactState.error(failure)),
      (contacts) => emit(ContactState.loaded(contacts)),
    );
  }
}
