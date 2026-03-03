enum AdaptiveSizeClass { compact, medium, expanded }

AdaptiveSizeClass classifyWidth(double width) {
  if (width < 600) {
    return AdaptiveSizeClass.compact;
  }
  if (width <= 1024) {
    return AdaptiveSizeClass.medium;
  }
  return AdaptiveSizeClass.expanded;
}
