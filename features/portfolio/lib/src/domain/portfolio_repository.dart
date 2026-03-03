import 'portfolio_item.dart';

abstract interface class PortfolioRepository {
  Future<List<PortfolioItem>> getAll();
}
