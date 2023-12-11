import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'culture_state.dart';

class CultureCubit extends Cubit<CultureState> {
  CultureCubit() : super(CultureInitial());
}
