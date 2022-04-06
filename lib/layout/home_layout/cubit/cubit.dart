import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/layout/home_layout/cubit/states.dart';
import 'package:frstapp/modules/business/business_screen.dart';
import 'package:frstapp/modules/science/science_screen.dart';
import 'package:frstapp/modules/settings/settings_screen.dart';
import 'package:frstapp/modules/sports/sports_screen.dart';
import 'package:frstapp/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>{
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List <BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business,),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science,),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports,),
      label: 'Sports',
    ),
  ];

  List <Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  void changeBottomNavBar (int index)
  {
    currentIndex = index;
    if( index == 1 ) { getScience(); }
    if( index == 2 ) { getSports(); }
    emit(NewsBottomNavStates());
  }

  List <dynamic> business = [];
  void getBusiness ()
  {
    emit(NewsGetBusinessLoadingStates());
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'3752d63f5a39421c9a143f20a29dc608',
        },
      ).then((value)
      {
        //print (value.data['articles'][0]['title']);
        business = value.data['articles'];
        print (business[0]['title']);
        emit(NewsGetBusinessSuccessStates());
      }).catchError((error)
      {
        print (error.toString());
        emit(NewsGetBusinessErrorStates(error.toString()));
      });
  }

  List <dynamic> sports = [];
  void getSports ()
  {
    emit(NewsGetSportsLoadingStates());
    if(sports.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'3752d63f5a39421c9a143f20a29dc608',
        },
      ).then((value)
      {
        //print (value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print (sports[0]['title']);
        emit(NewsGetSportsSuccessStates());
      }).catchError((error)
      {
        print (error.toString());
        emit(NewsGetSportsErrorStates(error.toString()));
      });
    }
    else {
      emit(NewsGetSportsSuccessStates());

    }
  }

  List <dynamic> science = [];
  void getScience ()
  {
    emit(NewsGetScienceLoadingStates());
    if(science.isEmpty){
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'3752d63f5a39421c9a143f20a29dc608',
        },
      ).then((value)
      {
        //print (value.data['articles'][0]['title']);
        science = value.data['articles'];
        print (science[0]['title']);
        emit(NewsGetScienceSuccessStates());
      }).catchError((error)
      {
        print (error.toString());
        emit(NewsGetScienceErrorStates(error.toString()));
      });
    }
    else {
      emit(NewsGetScienceSuccessStates());
    }
  }

  List <dynamic> search = [];
  void getSearch (String value)
  {
    emit(NewsGetSearchLoadingStates());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey':'3752d63f5a39421c9a143f20a29dc608',
      },
    ).then((value)
    {
      //print (value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessStates());
    }).catchError((error)
    {
      print (error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }
}