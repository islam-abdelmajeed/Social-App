import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/register/register_cubit/state.dart';
import 'package:social_app/networt/end_points.dart';
import 'package:social_app/networt/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //LoginModel loginModel;

  void userRegister({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: value.user.uid,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String name,
    @required String email,
    @required String password,
    @required String phone,
    @required String uId,
  }) {
    emit(CreateUserLoadingState());

    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
      image: 'https://image.freepik.com/free-photo/puzzled-uncertain-black-girl-frowns-face-displeasure-feels-apathy-looks-with-uncertainty-cant-find-solution-way-out-problem-has-afro-haircut-models-against-white-wall-facial-expression_273609-29118.jpg',
      cover: 'https://image.freepik.com/free-photo/puzzled-uncertain-black-girl-frowns-face-displeasure-feels-apathy-looks-with-uncertainty-cant-find-solution-way-out-problem-has-afro-haircut-models-against-white-wall-facial-expression_273609-29118.jpg',
      bio: 'write your bio ...',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibility());
  }
}
