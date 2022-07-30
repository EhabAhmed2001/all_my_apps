import 'package:all_my_apps/modules/archive_screen/archive_screen.dart';
import 'package:all_my_apps/modules/done_screen/done_screen.dart';
import 'package:all_my_apps/modules/tasks_screen/tasks_screen.dart';
import 'package:all_my_apps/shared/network/local/hive_darkmode.dart';
import 'package:all_my_apps/shared/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppStatesInitial());

  static AppCubit get(context) => BlocProvider.of(context);


  int current = 0;

  List<Widget> screen = [
    task_screen(),
    const done_screen(),
    const archive_screen(),
  ];

  List<String> title = [
    'NEW TASKS',
    'DONE TASKS',
    'ARCHIVE TASKS',
  ];

  List <Map> tasks =[];
  List <Map> doneTasks =[];
  List <Map> archiveTasks =[];

  IconData FAB = Icons.edit;
  bool isBottomSheetShown = false;
  late Database database;


  void changeIndex (index){
    current = index;
    emit(ChangeButtonNav());
  }

  void changeFABicon({
    required bool bottomSheetShown,
    required IconData fabIcon,

})
  {
    isBottomSheetShown = bottomSheetShown;
    FAB = fabIcon;
    emit(ChangeFabNav());
  }

  // ================================= CREATE DATABASE ==========================================
  void createDataBase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database db, int version) {
        print('Database created');
        db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
        emit(CreateDataBaseState());
        },

      onOpen: (db) {
        getData(db);
        print('database OPENED');
      },
    ).then((value){
      database = value;
    });
  }

// ================================= INSERT IN DATABASE ==========================================

  insertDatabase({
    required String title,
    required String time,
    required String date,
  })
  async {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (title, date, time, status) values ("$title","$date","$time","new")'
      ).then((value) {
        print('$value THE TASK INSERTED SUCCESSFULLY!');
        emit(InsertIntoDataBaseState());
        getData(database);
      }).catchError((error) {
        print('error when add record ${error.toString()}');
      });
    });
  }

// ================================= SELECT FROM DATABASE ==========================================

  void getData(Database db) {
    tasks =[];
    doneTasks =[];
    archiveTasks =[];

    emit(GetDataLoadingState());
    db.rawQuery('select * from tasks').then((value) {
      value = value.reversed.toList();
      value.forEach((element) {
        if (element['status'] == 'archive') {
          archiveTasks.add(element);
        }
        else if (element['status'] == 'done') {
          doneTasks.add(element);
        }
        else {
          tasks.add(element);
        }
      });

      emit(GetDataFromDataBaseState());
    });
  }

// ================================= update into DATABASE ==========================================

  void updateDate({
  required String status,
  required int id,
})
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
    ).then((value) {
      getData(database);
      emit(UpdateDataBaseState());
    });
  }

// ================================= delete FROM DATABASE ==========================================

  void deleteFromDB({
  required int id,
})
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?',
        [id]
    ).then((value) {
      getData(database);
      emit(DeleteDataBaseState());
    });
  }

// ================================= change dark and light mode =====================================


  bool isDark = CacheHelper.box.get('isDark', defaultValue: false);

  void change()
  {
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark);
    emit(ChangeDarkMode());
    print(isDark);
  }

}