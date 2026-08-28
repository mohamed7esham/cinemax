import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingState(currentPage: 0, numPages: 3));

  void changePage(int page) {
    emit(OnBoardingState(currentPage: page, numPages: state.numPages));
  }

  void nextPage() {
    if (!state.isLastPage) {
      emit(
        OnBoardingState(
          currentPage: state.currentPage + 1,
          numPages: state.numPages,
        ),
      );
    }
  }

  void previousPage() {
    if (!state.isFirstPage) {
      emit(
        OnBoardingState(
          currentPage: state.currentPage - 1,
          numPages: state.numPages,
        ),
      );
    }
  }
}
