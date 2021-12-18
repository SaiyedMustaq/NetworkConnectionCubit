part of 'internet_check_cubit.dart';

abstract class InternetCheckState extends Equatable {
  const InternetCheckState();
}

class InternetCheckInitial extends InternetCheckState {
  @override
  List<Object> get props => [];
}

class InternetCheckInitialLoadingState extends InternetCheckState {
  @override
  List<Object> get props => [];
}

class InternetCheckingSate extends InternetCheckState {
  final bool isInternetAvailable;
  InternetCheckingSate(this.isInternetAvailable);
  @override
  List<Object?> get props => [];
}
