part of 'root_layout_cubit.dart';

class RootLayoutState extends Equatable {
  const RootLayoutState({
    required this.pageIndex,
  });
  final int pageIndex;
  @override
  List<Object> get props => [this.pageIndex];
}
