import 'package:flutter/material.dart';
import 'package:social_app/components/component/component.dart';
import 'package:social_app/networt/local/cache_helper.dart';

void signOut(context)
{
  CacheHelper.removeData(key: 'token').then((value){
    if(value){
      navigateAndFinish(context, Widget);
    }
  });
}


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=> print(match.group(0)) );
}

String token = '';
String uId = '';