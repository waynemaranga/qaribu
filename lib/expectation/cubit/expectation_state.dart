part of 'expectation_cubit.dart';

sealed class ExpectationState extends Equatable {
  const ExpectationState();

  @override
  List<Object> get props => [];
}

final class ExpectationInitial extends ExpectationState {}
