import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Contact({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, description, createdAt, updatedAt];
}
