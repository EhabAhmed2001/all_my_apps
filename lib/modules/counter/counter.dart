import 'package:all_my_apps/modules/counter/cubit/cubit.dart';
import 'package:all_my_apps/modules/counter/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class counterScreen extends StatelessWidget {
  const counterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
        ),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => CounterCubit(),
          child: BlocConsumer<CounterCubit,MainState>
            (
              listener: (context,state)
              {
                // if(state is MinusState)
                //   {
                //     print("====== Minus State ${CounterCubit.get(context).counter}=========");
                //   }
                // if(state is PlusState)
                // {
                //   print("====== Plus State ${CounterCubit.get(context).counter}=========");
                // }
              },
              builder: (context,state)
              {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: ()
                      {
                        CounterCubit.get(context).minus();
                      },
                      child: const Text(
                        'minus',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: ()
                      {
                        CounterCubit.get(context).plus();
                      },
                      child: const Text(
                        'plus',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  ],
                );
              },
          ),
        ),
      ),
    );
  }
}
