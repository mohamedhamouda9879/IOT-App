import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request/cubit/states.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/network/local/cache_helper.dart';
import 'package:request/shared/network/remote/dio_helper.dart';
import 'package:request/shared/styles/colors.dart';

class RequestCubit extends Cubit<RequestStates> {
  RequestCubit() : super(RequestInitialState());
  static RequestCubit get(context) => BlocProvider.of(context);

  void getRequest(BuildContext context, String url) {
    DioHelper.getData(Url: url).then((value) {
      print('Hossam Response : ${value.data}');
      emit(RequestSuccessState());
    }).catchError((error) {
      print(error);

      emit(RequestErrorState(error));
    });
  }

  void saveData(String linko) async {
    await CacheHelper.saveData(key: 'link', value: linko);
    emit(SavedSharedSuccessState());
  }

  var hafosa = defaultColor;
  void changeColor() {
    LINK.toString() == '' ? Colors.deepOrange : Colors.amber;
    emit(ChangeColorSuccessState());
  }
}
