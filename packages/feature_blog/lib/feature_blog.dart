/// Blog feature package.
///
/// Provides blog post listing, detail view, and publishing.
library feature_blog;

// Domain
export 'src/domain/entities/blog_post.dart';
export 'src/domain/repositories/blog_repository.dart';
export 'src/domain/use_cases/get_blog_posts.dart';
export 'src/domain/use_cases/get_blog_post_by_slug.dart';

// Data
export 'src/data/models/blog_post_model.dart';
export 'src/data/data_sources/blog_local_data_source.dart';
export 'src/data/repositories/blog_repository_impl.dart';

// Presentation
export 'src/presentation/bloc/blog_bloc.dart';
export 'src/presentation/bloc/blog_event.dart';
export 'src/presentation/bloc/blog_state.dart';
export 'src/presentation/pages/blog_list_page.dart';
export 'src/presentation/pages/blog_detail_page.dart';
export 'src/presentation/pages/blog_master_detail_page.dart';
