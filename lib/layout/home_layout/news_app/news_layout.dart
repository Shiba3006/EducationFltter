import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/layout/home_layout/cubit/cubit.dart';
import 'package:frstapp/layout/home_layout/cubit/states.dart';
import 'package:frstapp/modules/search_screen/search_screen.dart';
import 'package:frstapp/shared/components/components.dart';
import 'package:frstapp/shared/cubit/cubit.dart';
import 'package:frstapp/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context,  SearchScreen(),);
                  cubit.search = [];
                },
                icon: const Icon(
                    Icons.search
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeAppTheme();
                },
                icon: const Icon(
                    Icons.brightness_6_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
