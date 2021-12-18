import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkcheckcubit/internetConnectionCubit/connectionRepos.dart';

part 'internet_check_state.dart';

class InternetCheckCubit extends Bloc<InternetCheckState, bool> {
  ConnectionRepos connectionRepos = ConnectionRepos();

  /// {@macro counter_bloc}
  InternetCheckCubit() : super(false);
  // {
  //   on<InternetCheckingSate>((event, emit) => emit(false));
  // }
  Future checkNetwork() async {
    emit(await connectionRepos.checkConnection());
  }
}
