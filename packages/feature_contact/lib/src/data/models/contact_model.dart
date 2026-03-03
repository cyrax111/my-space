import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/contact.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  factory ContactModel.fromEntity(Contact entity) {
    return ContactModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension ContactModelX on ContactModel {
  Contact toEntity() {
    return Contact(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
