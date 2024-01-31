import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/constant.dart';
import 'package:watch_store/utils/shared_preferences_keys.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    //if token stored
    // emit(LoggedInState());
    //if not stored
    // emit(LoggedOutState());

    emit(LoggedOutState());
  }

  final Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(Endpoints.sendSms, data: {"mobile": mobile}).then((response) {
        debugPrint(response.toString());
        if (response.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
      log(e.toString());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(Endpoints.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then((response) {
        debugPrint(response.toString());
        if (response.statusCode == 201 || response.statusCode == 200) {
          //Saving token with Shared Preferences
          SharedPreferencesManager().saveString(
              SharedPreferencesKeys.token, response.data['data']['token']);
          //Saving token with Shared Preferences
          if (response.data['data']['is_registered']) {
            emit(VerifiedAndRegisteredState());
          } else {
            emit(VerifiedAndNotRegisteredState());
          }
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
      log(e.toString());
    }
  }

  registration() {}
  logOut() {}
}
