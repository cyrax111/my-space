part of 'about_bloc.dart';

@freezed
sealed class AboutEvent with _$AboutEvent {
  const factory AboutEvent.loadAbouts() = _LoadAbouts;
  const factory AboutEvent.loadAbout(String id) = _LoadAbout;
  const factory AboutEvent.createAbout(About about) = _CreateAbout;
  const factory AboutEvent.updateAbout(About about) = _UpdateAbout;
  const factory AboutEvent.deleteAbout(String id) = _DeleteAbout;
}
