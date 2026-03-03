part of 'contact_bloc.dart';

@freezed
sealed class ContactEvent with _$ContactEvent {
  const factory ContactEvent.loadContacts() = _LoadContacts;
  const factory ContactEvent.loadContact(String id) = _LoadContact;
  const factory ContactEvent.createContact(Contact contact) = _CreateContact;
  const factory ContactEvent.updateContact(Contact contact) = _UpdateContact;
  const factory ContactEvent.deleteContact(String id) = _DeleteContact;
}
