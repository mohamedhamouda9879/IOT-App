import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request/cubit/cubit.dart';
import 'package:request/cubit/states.dart';
import 'package:request/shared/components/components.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/network/local/cache_helper.dart';

class SendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultButton(
                      function: () {
                        LINK = CacheHelper.getData(key: 'link');
                        RequestCubit.get(context).getRequest(context, LINK);
                      },
                      text: 'Send Request',
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
