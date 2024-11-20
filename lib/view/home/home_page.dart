import 'package:clean_architecture/cubit/home/home_cubit.dart';
import 'package:clean_architecture/cubit/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return _scaffold(context, state);
      },
    );
  }

  _scaffold(BuildContext context, HomeState state) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit & API"), centerTitle: true),
      body: Builder(
        builder: (context) {
          if (state is HomeLoadingState) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeErrorState) {
            return Center(child: Text("Error"));
          } else if (state is HomeCompleteState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Text(
                      state.data[index].id.toString(),
                      style: TextStyle(fontSize: 23),
                    ),
                    title: Text(state.data[index].name.toString()),
                    subtitle: Text(state.data[index].company!.name.toString()),
                    trailing: Text(
                      state.data[index].address!.city.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
