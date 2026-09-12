import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  final int selectedCategory;
  final int selectedBottomNav;

  const HomeState({this.selectedCategory = 0, this.selectedBottomNav = 0});

  HomeState copyWith({int? selectedCategory, int? selectedBottomNav}) {
    return HomeState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedBottomNav: selectedBottomNav ?? this.selectedBottomNav,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void selectCategory(int index) {
    emit(state.copyWith(selectedCategory: index));
  }

  void changeBottomNav(int index) {
    emit(state.copyWith(selectedBottomNav: index));
  }
}
