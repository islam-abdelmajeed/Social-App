abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppGetUserSuccessState extends AppStates{}

class AppGetUserLoadingState extends AppStates{}

class AppGetUserError0State extends AppStates{
  final String error;

  AppGetUserError0State(this.error);
}

class AppGetAllUsersSuccessState extends AppStates{}

class AppGetAllUsersLoadingState extends AppStates{}

class AppGetAllUsersError0State extends AppStates{
  final String error;

  AppGetAllUsersError0State(this.error);
}

class AppChangeBottomNavState extends AppStates{}

class AppNewPostState extends AppStates{}

class AppProfileImagePickedSuccessState extends AppStates{}

class AppProfileImagePickedErrorState extends AppStates{}

class AppCoverImagePickedSuccessState extends AppStates{}

class AppCoverImagePickedErrorState extends AppStates{}

class AppUploadProfileImageSuccessState extends AppStates{}

class AppUploadProfileImageErrorState extends AppStates{}

class AppUploadCoverImageSuccessState extends AppStates{}

class AppUploadCoverImageErrorState extends AppStates{}

class AppUserUpdateErrorState extends AppStates{}

class AppUserUpdateLoadingState extends AppStates{}

//create post
class AppCreatePostSuccessState extends AppStates{}

class AppCreatePostErrorState extends AppStates{}

class AppCreatePostLoadingState extends AppStates{}

class AppPostImagePickedSuccessState extends AppStates{}

class AppPostImagePickedErrorState extends AppStates{}

class AppRemovePostImageState extends AppStates{}

//get posts

class AppGetPostsSuccessState extends AppStates{}

class AppGetPostsLoadingState extends AppStates{}

class AppGetPostsError0State extends AppStates{
  final String error;

  AppGetPostsError0State(this.error);
}

//likes

class AppLikePostSuccessState extends AppStates{}

class AppLikePostErrorState extends AppStates{
  final String error;

  AppLikePostErrorState(this.error);
}

//chats

class AppSendMessageSuccessState extends AppStates{}

class AppSendMessageErrorState extends AppStates{}

class AppGetMessageSuccessState extends AppStates{}

class AppGetMessageErrorState extends AppStates{}

