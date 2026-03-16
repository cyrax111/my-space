/// Portfolio feature package.
///
/// Showcases projects with descriptions, tech stacks, and links.
library feature_portfolio;

// Domain
export 'src/domain/entities/project.dart';
export 'src/domain/repositories/portfolio_repository.dart';
export 'src/domain/use_cases/get_projects.dart';

// Data
export 'src/data/models/project_model.dart';
export 'src/data/data_sources/portfolio_local_data_source.dart';
export 'src/data/repositories/portfolio_repository_impl.dart';

// Presentation
export 'src/presentation/bloc/portfolio_bloc.dart';
export 'src/presentation/bloc/portfolio_event.dart';
export 'src/presentation/bloc/portfolio_state.dart';
export 'src/presentation/pages/portfolio_page.dart';
