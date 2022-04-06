import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/modules/archived_tasks/archived_tasks.dart';
import 'package:frstapp/modules/done_tasks/done_tasks.dart';
import 'package:frstapp/modules/new_tasks/new_tasks.dart';
import 'package:frstapp/shared/components/constants.dart';
import 'package:frstapp/shared/cubit/states.dart';
import 'package:frstapp/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> body =
  [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchivedTasksScreen(),
  ];

  List<String> appBar =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void ChangeIndex (int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  bool isBottomSheetShown = false;
  IconData fabIcon =  Icons.edit;

  void createDatabase ()
  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version)
      {
        // id integer
        // title String
        // date String
        // time String
        // status String
        print ('database created');
        database.execute(
            'create table tasks (id integer primary key,'
                ' title text,'
                ' date text,'
                ' time text,'
                ' status text)'
        ).then((value)
        {
          print ('table created');
        }).catchError((e)
        {
          print ('error when creating table ${e.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDataBase(database);
        print ('database opened');
      },
    ).then((value)
    {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertDatabase ({
    required String title,
    required String date,
    required String time,
  }) async
  {
    await database.transaction((txn) async
    {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status)'
              ' VALUES("$title", "$date", "$time", "new")'
      )
          .then((value)
      {
        print ('$value successfully inserted');
        emit(AppInsertDataBaseState());
        getDataFromDataBase(database);
      }
      )
          .catchError((e)
      {
        print ('error when inserting new record ${e.toString()}');
      }
      );

    }
    );
  }

  void getDataFromDataBase (database)
  {

    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDataBaseLoadingState());
    database.rawQuery('select * from tasks').then((value)
    {

      value.forEach((element)
      {
        if(element['status'] == 'new') {
          newTasks.add(element);
        } else if(element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDataBaseState());
    }
    );
  }

  void updateData ({
    required String status,
    required int id,
  }) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id],
    ).then((value)
    {
      getDataFromDataBase(database);
      emit(AppUpdateDataBaseLoadingState());
    });
  }

  void deleteData ({
    required int id,
  }) async
  {
     database.rawDelete(
         'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value)
    {
      getDataFromDataBase(database);
      emit(AppDeleteDataBase());
    });
  }

  void changeBottomSheetState ({
  required bool isShow,
  required IconData icon,
})
  {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomNSheetState());
  }

  bool isDark = false;

  void changeAppTheme ({bool? fromShared})
  {
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeThemeStates());
    } else {
      isDark = !isDark;
      CacheHelper.setBoolean(key: 'isDark', value: isDark).then((value) =>
          emit(NewsChangeThemeStates())
      );
    }
  }

}