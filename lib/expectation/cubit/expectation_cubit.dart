import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'expectation_state.dart';

class ExpectationCubit extends Cubit<ExpectationState> {
  ExpectationCubit() : super(ExpectationInitial());
}
