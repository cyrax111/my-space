part of 'contact_bloc.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.loaded(List<Contact> contacts) = _Loaded;
  const factory ContactState.error(Failure failure) = _Error;
}
