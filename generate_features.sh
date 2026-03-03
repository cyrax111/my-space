#!/bin/bash

# Script to generate boilerplate code for all features
# This creates the basic structure following Clean Architecture

set -e

echo "🚀 Generating feature boilerplate..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

generate_feature() {
    local feature_name=$1
    local entity_name=$2
    
    echo -e "${BLUE}📦 Generating $feature_name...${NC}"
    
    local feature_dir="packages/feature_$feature_name"
    
    # Domain Layer - Entity
    cat > "$feature_dir/lib/src/domain/entities/${entity_name}.dart" << EOF
import 'package:equatable/equatable.dart';

class $entity_name extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const $entity_name({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, description, createdAt, updatedAt];
}
EOF

    # Domain Layer - Repository Interface
    cat > "$feature_dir/lib/src/domain/repositories/${entity_name,,}_repository.dart" << EOF
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/${entity_name,,}.dart';

abstract class ${entity_name}Repository {
  Future<Either<Failure, List<$entity_name>>> getAll();
  Future<Either<Failure, $entity_name>> getById(String id);
  Future<Either<Failure, $entity_name>> create($entity_name ${entity_name,,});
  Future<Either<Failure, $entity_name>> update($entity_name ${entity_name,,});
  Future<Either<Failure, void>> delete(String id);
}
EOF

    # Domain Layer - Use Cases
    cat > "$feature_dir/lib/src/domain/use_cases/get_${entity_name,,}s_use_case.dart" << EOF
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../entities/${entity_name,,}.dart';
import '../repositories/${entity_name,,}_repository.dart';

@injectable
class Get${entity_name}sUseCase implements UseCaseNoParams<List<$entity_name>> {
  final ${entity_name}Repository _repository;

  Get${entity_name}sUseCase(this._repository);

  @override
  Future<Either<Failure, List<$entity_name>>> call() {
    return _repository.getAll();
  }
}
EOF

    # Data Layer - Model
    cat > "$feature_dir/lib/src/data/models/${entity_name,,}_model.dart" << EOF
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/${entity_name,,}.dart';

part '${entity_name,,}_model.freezed.dart';
part '${entity_name,,}_model.g.dart';

@freezed
class ${entity_name}Model with _\$${entity_name}Model {
  const factory ${entity_name}Model({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _${entity_name}Model;

  factory ${entity_name}Model.fromJson(Map<String, dynamic> json) =>
      _\$${entity_name}ModelFromJson(json);

  factory ${entity_name}Model.fromEntity($entity_name entity) {
    return ${entity_name}Model(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

extension ${entity_name}ModelX on ${entity_name}Model {
  $entity_name toEntity() {
    return $entity_name(
      id: id,
      title: title,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
EOF

    # Data Layer - Repository Implementation
    cat > "$feature_dir/lib/src/data/repositories/${entity_name,,}_repository_impl.dart" << EOF
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/${entity_name,,}.dart';
import '../../domain/repositories/${entity_name,,}_repository.dart';
import '../data_sources/${entity_name,,}_local_data_source.dart';
import '../models/${entity_name,,}_model.dart';

@LazySingleton(as: ${entity_name}Repository)
class ${entity_name}RepositoryImpl implements ${entity_name}Repository {
  final ${entity_name}LocalDataSource _localDataSource;

  ${entity_name}RepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<$entity_name>>> getAll() async {
    try {
      final models = await _localDataSource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, $entity_name>> getById(String id) async {
    try {
      final model = await _localDataSource.getById(id);
      if (model == null) {
        return const Left(Failure.notFound());
      }
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, $entity_name>> create($entity_name ${entity_name,,}) async {
    try {
      final model = ${entity_name}Model.fromEntity(${entity_name,,});
      final created = await _localDataSource.create(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, $entity_name>> update($entity_name ${entity_name,,}) async {
    try {
      final model = ${entity_name}Model.fromEntity(${entity_name,,});
      final updated = await _localDataSource.update(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await _localDataSource.delete(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure.storage(message: e.toString()));
    }
  }
}
EOF

    # Data Layer - Local Data Source
    cat > "$feature_dir/lib/src/data/data_sources/${entity_name,,}_local_data_source.dart" << EOF
import 'package:injectable/injectable.dart';
import '../models/${entity_name,,}_model.dart';

abstract class ${entity_name}LocalDataSource {
  Future<List<${entity_name}Model>> getAll();
  Future<${entity_name}Model?> getById(String id);
  Future<${entity_name}Model> create(${entity_name}Model ${entity_name,,});
  Future<${entity_name}Model> update(${entity_name}Model ${entity_name,,});
  Future<void> delete(String id);
}

@LazySingleton(as: ${entity_name}LocalDataSource)
class ${entity_name}LocalDataSourceImpl implements ${entity_name}LocalDataSource {
  // TODO: Implement with Drift/SQLite
  // For now, using in-memory storage
  final List<${entity_name}Model> _storage = [];

  @override
  Future<List<${entity_name}Model>> getAll() async {
    return List.from(_storage);
  }

  @override
  Future<${entity_name}Model?> getById(String id) async {
    try {
      return _storage.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<${entity_name}Model> create(${entity_name}Model ${entity_name,,}) async {
    _storage.add(${entity_name,,});
    return ${entity_name,,};
  }

  @override
  Future<${entity_name}Model> update(${entity_name}Model ${entity_name,,}) async {
    final index = _storage.indexWhere((item) => item.id == ${entity_name,,}.id);
    if (index != -1) {
      _storage[index] = ${entity_name,,};
    }
    return ${entity_name,,};
  }

  @override
  Future<void> delete(String id) async {
    _storage.removeWhere((item) => item.id == id);
  }
}
EOF

    # Presentation Layer - BLoC Events
    cat > "$feature_dir/lib/src/presentation/bloc/${entity_name,,}_event.dart" << EOF
part of '${entity_name,,}_bloc.dart';

@freezed
sealed class ${entity_name}Event with _\$${entity_name}Event {
  const factory ${entity_name}Event.load${entity_name}s() = _Load${entity_name}s;
  const factory ${entity_name}Event.load${entity_name}(String id) = _Load${entity_name};
  const factory ${entity_name}Event.create${entity_name}($entity_name ${entity_name,,}) = _Create${entity_name};
  const factory ${entity_name}Event.update${entity_name}($entity_name ${entity_name,,}) = _Update${entity_name};
  const factory ${entity_name}Event.delete${entity_name}(String id) = _Delete${entity_name};
}
EOF

    # Presentation Layer - BLoC States
    cat > "$feature_dir/lib/src/presentation/bloc/${entity_name,,}_state.dart" << EOF
part of '${entity_name,,}_bloc.dart';

@freezed
class ${entity_name}State with _\$${entity_name}State {
  const factory ${entity_name}State.initial() = _Initial;
  const factory ${entity_name}State.loading() = _Loading;
  const factory ${entity_name}State.loaded(List<$entity_name> ${entity_name,,}s) = _Loaded;
  const factory ${entity_name}State.error(Failure failure) = _Error;
}
EOF

    # Presentation Layer - BLoC
    cat > "$feature_dir/lib/src/presentation/bloc/${entity_name,,}_bloc.dart" << EOF
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core_domain/core_domain.dart';
import '../../domain/entities/${entity_name,,}.dart';
import '../../domain/use_cases/get_${entity_name,,}s_use_case.dart';

part '${entity_name,,}_event.dart';
part '${entity_name,,}_state.dart';
part '${entity_name,,}_bloc.freezed.dart';

@injectable
class ${entity_name}Bloc extends Bloc<${entity_name}Event, ${entity_name}State> {
  final Get${entity_name}sUseCase _get${entity_name}sUseCase;

  ${entity_name}Bloc(this._get${entity_name}sUseCase) : super(const ${entity_name}State.initial()) {
    on<_Load${entity_name}s>(_onLoad${entity_name}s);
  }

  Future<void> _onLoad${entity_name}s(
    _Load${entity_name}s event,
    Emitter<${entity_name}State> emit,
  ) async {
    emit(const ${entity_name}State.loading());
    
    final result = await _get${entity_name}sUseCase();
    
    result.fold(
      (failure) => emit(${entity_name}State.error(failure)),
      (${entity_name,,}s) => emit(${entity_name}State.loaded(${entity_name,,}s)),
    );
  }
}
EOF

    # Main library file
    cat > "$feature_dir/lib/feature_${feature_name}.dart" << EOF
library feature_${feature_name};

// Domain
export 'src/domain/entities/${entity_name,,}.dart';
export 'src/domain/repositories/${entity_name,,}_repository.dart';
export 'src/domain/use_cases/get_${entity_name,,}s_use_case.dart';

// Presentation
export 'src/presentation/bloc/${entity_name,,}_bloc.dart';
EOF

    echo -e "${GREEN}✅ $feature_name generated${NC}"
}

# Generate all features
generate_feature "blog" "Post"
generate_feature "portfolio" "Project"
generate_feature "about" "About"
generate_feature "contact" "Contact"

echo -e "${GREEN}🎉 All features generated successfully!${NC}"
echo -e "${BLUE}📝 Next steps:${NC}"
echo "1. Run: melos bootstrap"
echo "2. Run: melos run build:runner"
echo "3. Start implementing the UI pages"
