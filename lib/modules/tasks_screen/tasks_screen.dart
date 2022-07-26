import 'package:all_my_apps/shared/todo_cubit/cubit.dart';
import 'package:all_my_apps/shared/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/components.dart';

class task_screen extends StatelessWidget {
  task_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context,AppStates){},
      builder: (context,AppStates)
        {
          return ListView.separated(
            itemBuilder: (context, index) => buildTaskItem(
                context: context,
                model: AppCubit.get(context).tasks[index],
                archive: Icons.archive,
                done: Icons.check_circle,
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ) ,
            itemCount: AppCubit.get(context).tasks.length,
          );
        },
    );
  }


}
