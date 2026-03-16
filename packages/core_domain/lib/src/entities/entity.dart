import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Base class for all domain entities.
///
/// Entities are identified by their [id] and compared by identity,
/// not by attribute values. Two entities with the same [id] are
/// considered equal regardless of other field differences.
///
/// All entities are immutable.
@immutable
abstract class Entity extends Equatable {
  /// Unique identifier for this entity.
  final String id;

  /// When this entity was created.
  final DateTime createdAt;

  /// When this entity was last modified.
  final DateTime updatedAt;

  const Entity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id];

  @override
  String toString() => '${runtimeType}(id: $id)';
}
