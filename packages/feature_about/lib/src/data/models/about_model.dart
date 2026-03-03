import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/about.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
class AboutModel with _$AboutModel {
  const factory AboutModel({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AboutModel;

  factory AboutModel.fromJson(Map<String, dynamic> json) =>
      _$AboutModelFromJson(json);

  factory AboutModel.fromEntity(About entity) {
    return AboutModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension AboutModelX on AboutModel {
  About toEntity() {
    return About(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
