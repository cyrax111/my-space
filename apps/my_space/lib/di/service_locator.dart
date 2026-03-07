import 'package:feature_about/feature_about.dart';
import 'package:feature_blog/feature_blog.dart';
import 'package:feature_contact/feature_contact.dart';
import 'package:feature_portfolio/feature_portfolio.dart';
import 'package:get_it/get_it.dart';

/// Global service locator instance.
final sl = GetIt.instance;

/// Register all dependencies.
///
/// Uses manual registration instead of Injectable to keep things simple
/// and avoid code generation on first PR.
void setupServiceLocator() {
  // ─── Data Sources ──────────────────────────────────────

  sl.registerLazySingleton<BlogLocalDataSource>(
    () => BlogLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<PortfolioLocalDataSource>(
    () => PortfolioLocalDataSourceImpl(),
  );

  // ─── Repositories ─────────────────────────────────────

  sl.registerLazySingleton<BlogRepository>(
    () => BlogRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(sl()),
  );

  // ─── Use Cases ────────────────────────────────────────

  sl.registerFactory(() => GetBlogPosts(sl()));
  sl.registerFactory(() => GetBlogPostBySlug(sl()));
  sl.registerFactory(() => GetProjects(sl()));
  sl.registerFactory(() => SendContactMessage());

  // ─── BLoCs ────────────────────────────────────────────

  sl.registerFactory(() => BlogBloc(
        getBlogPosts: sl(),
        getBlogPostBySlug: sl(),
      ));

  sl.registerFactory(() => PortfolioBloc(
        getProjects: sl(),
      ));

  sl.registerFactory(() => AboutBloc());

  sl.registerFactory(() => ContactBloc(
        sendContactMessage: sl(),
      ));
}
