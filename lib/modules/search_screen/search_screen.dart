import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frstapp/layout/home_layout/cubit/cubit.dart';
import 'package:frstapp/layout/home_layout/cubit/states.dart';
import 'package:frstapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state){
        var article = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  controller: searchController,
                  validate: (String? value) {if(value!.isEmpty) { return 'Please write anything' ; }},
                  label: 'Search',
                  textInputType: TextInputType.text,
                  preIcon: Icons.search,
                  onChanged: (String value){
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: articleBuilder(article, context, isSearch: true,),
              ),
            ],
          ),
        );
      },
    );
  }
}
