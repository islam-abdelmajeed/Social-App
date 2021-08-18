import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app_cubit/cubit.dart';
import 'package:social_app/app_cubit/states.dart';
import 'package:social_app/components/component/component.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          var userModel = AppCubit.get(context).userModel;
          var profileImage = AppCubit.get(context).profileImage;
          var coverImage = AppCubit.get(context).coverImage;

          nameController.text = userModel.name;
          bioController.text = userModel.bio;
          phoneController.text = userModel.phone;

          return Scaffold(
              appBar: defaultAppBar(
                context: context,
                title: 'Edit Profile',
                actions: [
                  defaultTextButton(
                    function: () {
                      AppCubit.get(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text);
                    },
                    text: 'Update',
                  ),
                  SizedBox(
                    width: 15.0,
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      if (state is AppUserUpdateLoadingState)
                        LinearProgressIndicator(),
                      if (state is AppUserUpdateLoadingState)
                        SizedBox(
                          height: 10,
                        ),
                      Container(
                        height: 190.0,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    height: 140.0,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      image: DecorationImage(
                                          image: coverImage == null
                                              ? NetworkImage('${userModel.cover}')
                                              : FileImage(coverImage),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 20.0,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                      ),
                                      onPressed: () {
                                        AppCubit.get(context).getCoverImage();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              alignment: AlignmentDirectional.topCenter,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                CircleAvatar(
                                  radius: 64.0,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    backgroundImage: profileImage == null
                                        ? NetworkImage('${userModel.image}')
                                        : FileImage(profileImage),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 17.0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 16.0,
                                    ),
                                    onPressed: () {
                                      AppCubit.get(context).getProfileImage();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      if (AppCubit.get(context).profileImage != null ||
                          AppCubit.get(context).coverImage != null)
                        Row(
                          children: [
                            if (AppCubit.get(context).profileImage != null)
                              Expanded(
                                child: Column(
                                  children: [
                                    defaultButton(
                                      function: () {
                                        AppCubit.get(context).uploadProfileImage(name: nameController.text, phone: phoneController.text, bio: bioController.text);

                                      },
                                      text: 'upload profile',
                                    ),
                                    if (state is AppUserUpdateLoadingState)
                                      SizedBox(height: 4.0,),
                                    if (state is AppUserUpdateLoadingState)
                                      LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                            SizedBox(
                              width: 8.0,
                            ),
                            if (AppCubit.get(context).coverImage != null)
                              Expanded(
                                child: Column(
                                  children: [
                                    defaultButton(
                                      function: () {
                                        AppCubit.get(context).uploadCoverImage(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                                      },
                                      text: 'upload cover',
                                    ),
                                    if (state is AppUserUpdateLoadingState)
                                      SizedBox(height: 4.0,),
                                    if (state is AppUserUpdateLoadingState)
                                      LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      if (AppCubit.get(context).profileImage != null ||
                          AppCubit.get(context).coverImage != null)
                        SizedBox(
                          height: 25.0,
                        ),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Name must not be Empty.';
                          }
                        },
                        label: 'Name',
                        prefix: Icons.person,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: bioController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Bio must not be Empty.';
                          }
                        },
                        label: 'Bio',
                        prefix: Icons.info_outline,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Phone Number must not be Empty.';
                          }
                        },
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ));
        },
        listener: (context, state) {});
  }
}
