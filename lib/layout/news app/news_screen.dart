import 'package:all_my_apps/shared/newsapp_cubit/cubit.dart';
import 'package:all_my_apps/shared/newsapp_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class news_screen extends StatelessWidget {
  const news_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> news_cubit(),
      child: BlocConsumer<news_cubit,news_states>(
          listener: (context, state) {},
          builder:(context, state) {
            var cubit = news_cubit.get(context);
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'News App',
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                body: cubit.screen[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                  items: cubit.bottomNavBar,
                  currentIndex: cubit.currentIndex,
                  onTap: (index)
                  {
                    cubit.indexChange(index);
                  },
            ),
          );
          },
      ),
    );
  }
}
