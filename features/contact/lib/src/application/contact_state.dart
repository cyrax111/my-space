class ContactState {
  const ContactState({required this.items, this.isLoading = false});

  final List<dynamic> items;
  final bool isLoading;
}
