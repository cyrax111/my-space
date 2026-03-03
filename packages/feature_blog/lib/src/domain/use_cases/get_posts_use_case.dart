import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

@injectable
class GetPostsUseCase implements UseCaseNoParams<List<Post>> {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Post>>> call() {
    return _repository.getAll();
  }
}
