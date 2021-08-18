import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app_cubit/cubit.dart';
import 'package:social_app/app_cubit/states.dart';
import 'package:social_app/components/component/component.dart';
import 'package:social_app/style/colors.dart';

class NewPostScreen extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Create Post', actions: [
            defaultTextButton(
              function: () {
                var now = DateTime.now();
                if (AppCubit.get(context).postImage == null) {
                  AppCubit.get(context).createPost(
                      dateTime: now.toString(), text: textController.text);
                } else {
                  AppCubit.get(context).uploadPostImage(
                      dateTime: now.toString(), text: textController.text);
                }
              },
              text: 'Post',
            ),
          ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is AppCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is AppCreatePostLoadingState)
                  SizedBox(height: 10.0,),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/cheerful-woman-bouquet-flowers-holiday_163305-81917.jpg'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        'Islam Khalil',
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                if(AppCubit.get(context).postImage != null)
                  Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 140.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0,),
                        image: DecorationImage(
                            image:FileImage(AppCubit.get(context).postImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () {
                          AppCubit.get(context).removePostImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        AppCubit.get(context).getPostImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Add Photo',
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {},
                      child: Text('# Tags'),
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
