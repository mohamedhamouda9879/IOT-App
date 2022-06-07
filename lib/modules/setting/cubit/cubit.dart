import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request/modules/setting/cubit/states.dart';
import 'package:request/shared/components/components.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/network/local/cache_helper.dart';
import 'package:request/shared/network/remote/dio_helper.dart';
import 'package:request/shared/styles/colors.dart';

class RequestCubit extends Cubit<RequestStates> {
  RequestCubit() : super(RequestInitialState());
  static RequestCubit get(context) => BlocProvider.of(context);

  void getRequest(BuildContext context, String url) {
    print('request');
    print(LINK);
    LINK = CacheHelper.getData(key: 'link');
    DioHelper.getData(Url: LINK).then((value) {
      print('Hossam Response : ${value.data}');
      emit(RequestSuccessState());
    }).catchError((error) {
      print(error);

      emit(RequestErrorState(error));
    });
  }

  void saveData(String linko) async {
    await CacheHelper.saveData(key: 'link', value: linko).then((value) {
      LINK = linko;
      emit(SavedSharedSuccessState());
    }).catchError((error) {
      print(error);
    });
  }

  var hafosa = defaultColor;
  void changeColor() {
    LINK.toString() == '' ? Colors.deepOrange : Colors.amber;
    emit(ChangeColorSuccessState());
  }

  void openDoor(BuildContext context) {
    emit(OpenDoorLoadingState());
    if (LINK == '') {
      print('er');
      showToast(
          message: 'Please Enter Your Link', toastStates: ToastStates.EROOR);
    } else {
      print('error');
      LINK = CacheHelper.getData(key: 'link');
      RequestCubit.get(context).getRequest(context, LINK);
    }
    emit(OpenDoorState());
  }
}
