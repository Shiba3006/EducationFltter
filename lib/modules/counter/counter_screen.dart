import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/modules/counter/cubit/states.dart';

import 'cubit/cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return BlocProvider(
       create: (BuildContext context) => CounterCubit(),
       child: BlocConsumer <CounterCubit, CounterStates>(
         listener: (BuildContext context, CounterStates state)
         {
          // if (state is CounterMinusState) print ('minus state ${state.counter}');
          // if (state is CounterPlusState) print ('plus state ${state.counter}');
         },
         builder: (BuildContext context, CounterStates state)
         {
           return Scaffold(
             appBar: AppBar(
               title: const Text(
                 'Counter',
               ),
             ),
             body: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     color: Colors.grey[300],
                     child: TextButton(
                       onPressed: (){
                         CounterCubit.get(context).plus();
                       },
                       child: const Text(
                         'Plus',
                         style: TextStyle(
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                     child: Text(
                       '${CounterCubit.get(context).counter}',
                       style: const TextStyle(
                         fontSize: 50.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   Container(
                     color: Colors.grey[300],
                     child: TextButton(
                       onPressed: (){
                         CounterCubit.get(context).minus();
                       },
                       child: const Text(
                         'Minus',
                         style: TextStyle(
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           );
         },
       ),
     );
   }
}


