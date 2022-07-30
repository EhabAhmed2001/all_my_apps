import 'package:all_my_apps/shared/todo_cubit/cubit.dart';
import 'package:flutter/material.dart';

// Material Button as a general for all apps
Widget allAppsWidject({
  required Widget screen,
  required String imagePath,
  required String text,
  required BuildContext? context,
  double rad = 30.0,
}) =>
    MaterialButton(
      height: 90,
      onPressed: () {
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: rad,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

// Material Button as a general for login screen

Widget defaultButton({
  required String text,
  required Function fun,
  double height = 40.0,
  bool isUpperCase = true,
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        height: height,
        onPressed: () {
          fun();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

// Text Form Field as a general for login screen

Widget defaultTextForm({
  required TextEditingController control,
  required TextInputType type,
  required String lable,
  required IconData prefix,
  required Function validate,
  IconData? suffix,
  Function? suffixPressed,
  Function? onTap,
  bool isPassword = false,
  double radius = 10.0,
}) =>
    TextFormField(
      controller: control,
      keyboardType: type,
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: lable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        ),
      ),
      validator: (value) {
        return validate(value);
      },
    );

// The widget of to_do App

Widget buildTaskItem({
  required Map model,
  required context,
  IconData? done,
  IconData? archive,
})
=>
    Dismissible(
      key: Key('${model['id']}'.toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${model['time']}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppCubit.get(context).isDark ? Colors.white: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDate(
                    status: 'done',
                    id: model['id'],
                );
              },
              icon: Icon(done),
              color: AppCubit.get(context).isDark ? Colors.white: Colors.green,
            ),
            IconButton(
              onPressed: ()
              {
                AppCubit.get(context).updateDate(
                    status: 'archive',
                    id: model['id']
                );
              },
              icon: Icon(archive),
              color: AppCubit.get(context).isDark ? Colors.white: Colors.grey,
            ),
          ],
        ),
      ),
      onDismissed: (direction){
        AppCubit.get(context).deleteFromDB(id: model['id']);
      },
    );