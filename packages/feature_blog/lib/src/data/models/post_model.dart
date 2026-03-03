import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  factory PostModel.fromEntity(Post entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension PostModelX on PostModel {
  Post toEntity() {
    return Post(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
