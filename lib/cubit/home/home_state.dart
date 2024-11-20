import 'package:clean_architecture/model/users_model.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeCompleteState extends HomeState {
  List<UsersModel> data;
  HomeCompleteState(this.data);
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}
