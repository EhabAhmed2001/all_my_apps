import 'package:all_my_apps/shared/todo_cubit/cubit.dart';
import 'package:all_my_apps/shared/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:all_my_apps/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class todo_screen extends StatefulWidget {

  @override
  State<todo_screen> createState() => _todo_screenState();
}

class _todo_screenState extends State<todo_screen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).createDataBase();

  }
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var TitleControl = TextEditingController();

  var TimeControl = TextEditingController();

  var DateControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      listener: (BuildContext context, state)
      {
        if(state is InsertIntoDataBaseState) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, state)
      {

        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
        key: scaffoldKey,
          appBar: AppBar(
            title: Text(cubit.title[cubit.current]),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    cubit.change();
                  },
                  icon: const Icon(Icons.brightness_6),
              ),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.current,
            onTap: (index) {
              cubit.changeIndex(index);
              // setState(() {
              //   current = index;
              // });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'TASKS',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                ),
                label: 'DONE',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive,
                ),
                label: 'ARCHIVE',
              ),
            ],
          ),
          body: cubit.screen[cubit.current],
          // state is! GetDataLoadingState?
          //           cubit.tasks.isNotEmpty?
          //               cubit.screen[cubit.current] : showScreen(cubit.current)
          //   : const Center(child: CircularProgressIndicator()),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate())
                {
                  cubit.insertDatabase(
                    date: DateControl.text,
                    time: TimeControl.text,
                    title: TitleControl.text,
                  ).then((value) {
                    DateControl.text = '';
                    TimeControl.text = '';
                    TitleControl.text = '';

                    cubit.changeFABicon(
                      bottomSheetShown: false,
                      fabIcon: Icons.edit,
                    );
                    //isBottomSheetShown = false;
                    // setState(() {
                    //   FAB = Icons.edit;
                    // });
                  });
                }
              }
              else {
                scaffoldKey.currentState?.showBottomSheet(
                      (context) => Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextForm(
                                control: TitleControl,
                                type: TextInputType.text,
                                lable: 'Task Text',
                                prefix: Icons.title,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Text mustn\'t be Empty';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultTextForm(
                                control: TimeControl,
                                type: TextInputType.datetime,
                                lable: 'Task Time',
                                prefix: Icons.watch_later,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    TimeControl.text =
                                        value!.format(context).toString();
                                  });
                                },
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Time mustn\'t be Empty';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              defaultTextForm(
                                control: DateControl,
                                type: TextInputType.datetime,
                                lable: 'Task Date',
                                prefix: Icons.calendar_today_outlined,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-12-31'),
                                  ).then((value) {
                                    DateControl.text =
                                        DateFormat.yMMMd()
                                            .format(value!)
                                            .toString();
                                  });
                                },
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Date mustn\'t be Empty';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                ).closed.then((value) {
                  cubit.changeFABicon(bottomSheetShown: false, fabIcon: Icons.edit);
                  //isBottomSheetShown = false;
                  // setState(() {
                  //   FAB = Icons.edit;
                  // });
                });
                cubit.changeFABicon(bottomSheetShown: true, fabIcon: Icons.add);
                //isBottomSheetShown = true;
                // setState(() {
                //   FAB = Icons.add;
                // });
              }
            },
            child: Icon(cubit.FAB),
          ),
        );
      },
    );
  }

  showScreen (index)
  {
    if (index == 0)
      {
        return const Center(
          child: Text(
            'NO TASKS YET',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    else if (index == 1)
      {
        return const Center(
          child: Text(
            'NO DONE TASKS YET',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    else if (index == 2)
    {
      return const Center(
        child: Text(
          'NO ARCHIVED TASKS YET',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }
}
