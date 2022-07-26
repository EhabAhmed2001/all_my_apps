import 'package:all_my_apps/layout/news%20app/news_screen.dart';
import 'package:all_my_apps/layout/todo%20screen/todo_screen.dart';
import 'package:all_my_apps/modules/counter/cubit/cubit.dart';
import 'package:all_my_apps/modules/login_screen/login_screen.dart';
import 'package:all_my_apps/shared/bloc_observer.dart';
import 'package:all_my_apps/shared/network/remote/dio_helper.dart';
import 'package:all_my_apps/shared/todo_cubit/cubit.dart';
import 'package:all_my_apps/shared/todo_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/all_apps/all_app.dart';
import 'modules/counter/counter.dart';

void main() {
  dio_helper.init();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates>(
          listener: (context, state) {} ,
          builder: (context,state){
            AppCubit cu = AppCubit.get(context);
            return MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.amber,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  elevation: 4.0,
                  backgroundColor: Colors.white,
                ),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  actionsIconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.grey,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.black54,
                  type: BottomNavigationBarType.fixed,
                  elevation: 4.0,
                  selectedItemColor: Colors.white,
                  backgroundColor: Colors.grey,
                ),
                scaffoldBackgroundColor: Colors.grey,
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  actionsIconTheme: IconThemeData(
                      color: Colors.white
                  ),
                  color: Colors.grey,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey,
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
              ),
              themeMode: cu.isDark? ThemeMode.dark : ThemeMode.light ,
              home: todo_screen(),
            );
          },
      ),
    );
  }
}
