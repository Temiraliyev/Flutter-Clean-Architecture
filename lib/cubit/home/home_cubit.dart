import 'package:clean_architecture/cubit/home/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture/model/users_model.dart';
import 'package:clean_architecture/service/remote/api_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUser();
  }

  //

  void getUser() async {
    emit(HomeLoadingState());
    await ApiService.getUsers().then((value) {
      if (value is List<UsersModel>) {
        emit(HomeCompleteState(value));
      } else {
        emit(HomeErrorState(value));
      }
    });
  }
}
