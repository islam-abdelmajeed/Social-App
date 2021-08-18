import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app_cubit/cubit.dart';
import 'package:social_app/app_cubit/states.dart';
import 'package:social_app/components/component/component.dart';
import 'package:social_app/modules/new_post/new_post_screen.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {
        if(state is AppNewPostState)
          navigateTo(context, NewPostScreen());
      },
      builder: (BuildContext context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex]
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications), onPressed: (){},),
              IconButton(icon: Icon(Icons.search), onPressed: (){},),
            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: 'Post'),
              BottomNavigationBarItem(icon: Icon(Icons.add_location_alt_outlined),label: 'Users'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
          ),

        );
      },
    );
  }
}
