import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app_cubit/states.dart';
import 'package:social_app/modules/login/social_login_screen.dart';
import 'package:social_app/social_layout/social_layout.dart';
import 'app_cubit/cubit.dart';
import 'components/constant/constant.dart';
import 'networt/local/cache_helper.dart';
import 'networt/remote/dio_helper.dart';
import 'style/theme.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  DioHelper.init();

  Widget widget;
  token=  CacheHelper.getData(key: 'token');
  uId=  CacheHelper.getData(key: 'uId');

  if(uId != null){
    widget = SocialLayout();
  }else{
    widget = SocialLoginScreen();
  }

  runApp(MyApp(startWidget : widget));
}


class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getUserData()..getPosts(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
