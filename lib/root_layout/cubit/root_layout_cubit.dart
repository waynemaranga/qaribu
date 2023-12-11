import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'root_layout_state.dart';

class RootLayoutCubit extends Cubit<RootLayoutState> {
  RootLayoutCubit() : super(const RootLayoutState(pageIndex: 0));
  void changePage(int selectedIndex) {
    emit(RootLayoutState(pageIndex: selectedIndex));
  }
}
