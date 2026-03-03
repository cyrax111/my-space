import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAll();
  Future<Either<Failure, Post>> getById(String id);
  Future<Either<Failure, Post>> create(Post post);
  Future<Either<Failure, Post>> update(Post post);
  Future<Either<Failure, void>> delete(String id);
}
