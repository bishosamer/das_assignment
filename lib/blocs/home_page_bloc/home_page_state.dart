part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  final User? user;

  const HomePageState({required this.user});
  @override
  List<Object?> get props => [user];
}

class HomePageInitial extends HomePageState {
  const HomePageInitial({super.user});

  @override
  List<Object?> get props => [super.user];
}

class HomePageIdle extends HomePageState {
  HomePageIdle({required super.user});

  @override
  List<Object?> get props => [super.user];
}

class HomePageLoading extends HomePageState {
  const HomePageLoading({super.user});

  @override
  List<Object?> get props => [super.user];
}

class ShowMessage extends HomePageState {
  final String message;

  const ShowMessage({required super.user, required this.message});

  @override
  List<Object?> get props => [super.user, message];
}

class CreditOptionsShown extends HomePageState {
  const CreditOptionsShown({required super.user});
  @override
  List<Object?> get props => [super.user];
}

class ShowVerificationDialog extends HomePageState {
  ShowVerificationDialog({required super.user});

  @override
  List<Object?> get props => [super.user];
}
