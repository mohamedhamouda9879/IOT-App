import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request/modules/setting/cubit/cubit.dart';
import 'package:request/modules/setting/cubit/states.dart';
import 'package:request/shared/components/components.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/network/local/cache_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestStates>(
        listener: ((context, state) {
          if (state is OpenDoorLoadingState) {
            LINK = CacheHelper.getData(key: 'link');
          }
        }),
        builder: ((context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                      function: () {
                        RequestCubit.get(context).openDoor(context);
                      },
                      text: 'Open Door',
                      width: 150,
                      radius: 12.0)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
