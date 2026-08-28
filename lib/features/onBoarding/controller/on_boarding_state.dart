class OnBoardingState {
  final int currentPage;
  final int numPages;

  const OnBoardingState({required this.currentPage, required this.numPages});

  bool get isFirstPage => currentPage == 0;

  bool get isLastPage => currentPage == numPages - 1;
}
