import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'learning_path_state.dart';

class LearningPathCubit extends Cubit<LearningPathState> {
  LearningPathCubit() : super(LearningPathInitial());
}
