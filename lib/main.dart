



import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/modules/bmi_calculator/bmi_calculator.dart';
import 'package:frstapp/modules/counter/counter_screen.dart';
import 'package:frstapp/modules/login/login_screen.dart';
import 'package:frstapp/modules/users/users_screen.dart';
import 'package:frstapp/shared/bloc_observer.dart';
import 'package:frstapp/shared/cubit/cubit.dart';
import 'package:frstapp/shared/cubit/states.dart';
import 'package:frstapp/shared/network/local/cache_helper.dart';
import 'package:frstapp/shared/network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/home_layout/cubit/cubit.dart';
import 'layout/home_layout/news_app/news_layout.dart';
import 'layout/home_layout/todo_app/todo_layout.dart';
import 'modules/bmi_result/bmi_result.dart';
import 'modules/counter/cubit/cubit.dart';
import 'modules/home/home_screen.dart';
import 'modules/messenger_screen/messenger_screen.dart';



Future<void> main( ) async {
  WidgetsFlutterBinding.ensureInitialized();
  // بيتاكد ان كل حاجة هنا خلصت في الميثود و بعدين يفتح الابب

  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  BlocOverrides.runZoned(
        () => runApp( MyApp(isDark: isDark,)),
    blocObserver: MyBlocObserver(),
  );
}

//stateless
//stateful

class MyApp extends StatelessWidget {
   const MyApp({Key? key, database, required this.isDark}) : super(key: key);

   final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(
            create: (BuildContext context)=> NewsCubit()..getBusiness(),),
          BlocProvider(
            create: (BuildContext context) => AppCubit()..changeAppTheme(fromShared: isDark),),
        ],

      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                actionsIconTheme: IconThemeData(color: Colors.black,),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('1B2631'),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                color: HexColor('1B2631'),
                elevation: 0.0,
                actionsIconTheme: const IconThemeData(color: Colors.white,),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('1B2631'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('283747'),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }

}


