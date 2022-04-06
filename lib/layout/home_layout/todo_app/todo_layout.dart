import 'dart:async';




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/modules/archived_tasks/archived_tasks.dart';
import 'package:frstapp/modules/done_tasks/done_tasks.dart';
import 'package:frstapp/modules/new_tasks/new_tasks.dart';
import 'package:frstapp/shared/components/components.dart';
import 'package:frstapp/shared/components/constants.dart';
import 'package:frstapp/shared/cubit/cubit.dart';
import 'package:frstapp/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

// 1. create database.
// 2. create tables.
// 3. open database.
// 4. insert to database.
// 5. get from database.
// 6. update in database.
// 7. delete from database.

class HomeLayout extends StatelessWidget
{

   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
   TextEditingController titleController = TextEditingController();
   TextEditingController dateController = TextEditingController();
   TextEditingController timeController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //
  //   super.initState();
  //   createDatabase ();
  // }
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state)
        {
          if (state is AppInsertDataBaseState) Navigator.pop(context);
        },
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.appBar[cubit.currentIndex],
              ),
            ),
            body:
            state is AppGetDataBaseLoadingState ? const Center(child: CircularProgressIndicator())
                : cubit.body[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                //   try {
                //     var name = await getName();
                //     print (name);   مش مضمونة ترتيب تنفيذ الاوامر و فيها ( async & await )
                //     print ('LoL');
                //     throw ('eeeeeeerrrrrrrrrorrrrrrrrr');
                //   }  catch (e) {
                //     print('Error: ${e.toString()}');
                //   }
                //   getName().then((value)
                //   {
                //     print (value);
                //     print ('LoL');
                //     //throw ('eeeeeeerrrrrrrrrorrrrrrrrr');
                //   }).catchError(( e) {
                //     print (e.toString());
                //   });
                if (cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertDatabase(title: titleController.text, date: dateController.text, time: timeController.text);
                    // setState(() {
                    //   fabIcon = Icons.edit;
                    //   cubit.isBottomSheetShown = false;
                    // });
                    // insertDatabase(
                    //   title: titleController.text,
                    //   date: dateController.text,
                    //   time: timeController.text,
                    // );
                  }
                } else
                {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          padding: const EdgeInsetsDirectional.all(15.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                defaultTextFormField(
                                  controller: titleController,
                                  textInputType: TextInputType.text,
                                  validate: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Please write title';
                                    }
                                  },
                                  label: 'Task title',
                                  preIcon: Icons.title_sharp,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                    controller: dateController,
                                    textInputType: TextInputType.datetime,
                                    validate: (String? value)
                                    {
                                      if(value!.isEmpty)
                                      {
                                        return 'Please write date';
                                      }
                                    },
                                    label: 'Task date',
                                    preIcon: Icons.calendar_today,
                                    ontab:()
                                    {
                                      showDatePicker(context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2030-01-01'),
                                      ).then((value)
                                      {
                                        dateController.text = DateFormat.yMMMd().format(value!);
                                      }
                                      );
                                    }
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                defaultTextFormField(
                                  controller: timeController,
                                  validate: (String? value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'Please write time';
                                    }
                                  },
                                  label: 'Task time',
                                  preIcon: Icons.watch_later_outlined,
                                  ontab: ()
                                  {
                                    showTimePicker(context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value)
                                    {
                                      timeController.text = value!.format(context).toString();
                                    })
                                        .catchError((e)
                                    {
                                      print ('Error while tipping time ${e.toString()}');
                                    }
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                    cubit.changeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit);
                  }
                  );
                  cubit.changeBottomSheetState(
                      isShow: true,
                      icon: Icons.add);
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                cubit.ChangeIndex(index);
              },
              items:
              const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_rounded,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done_all,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive,
                  ),
                  label: 'Archived',
                ),
              ],
              elevation: 20.0,
            ),
          );
        }
      ),
    );
  }

  // Future<String> getName() async
  // {
  //   return 'ALI';
  // }



}





