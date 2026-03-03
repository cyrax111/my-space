class PortfolioState {
  const PortfolioState({required this.items, this.isLoading = false});

  final List<dynamic> items;
  final bool isLoading;
}
