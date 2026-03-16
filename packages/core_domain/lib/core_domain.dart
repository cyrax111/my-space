/// Core domain layer for My Space application.
///
/// Provides base abstractions for Clean Architecture:
/// - [AppException] hierarchy for unified error handling
/// - [Entity] base class for domain objects
/// - Value objects for type-safe domain primitives
library core_domain;

// Exceptions
export 'src/failures/failure.dart';

// Entities
export 'src/entities/entity.dart';

// Value Objects
export 'src/value_objects/email_address.dart';
export 'src/value_objects/non_empty_string.dart';
export 'src/value_objects/url_value.dart';
export 'src/value_objects/slug.dart';
