class BlogState {
  const BlogState({required this.items, this.isLoading = false});

  final List<dynamic> items;
  final bool isLoading;
}
