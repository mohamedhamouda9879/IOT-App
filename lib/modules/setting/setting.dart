import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request/modules/setting/cubit/cubit.dart';
import 'package:request/modules/setting/cubit/states.dart';
import 'package:request/shared/components/components.dart';
import 'package:request/shared/components/constants.dart';
import 'package:request/shared/styles/colors.dart';

class SettingScreen extends StatelessWidget {
  var requestController = TextEditingController();
  var linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestCubit(),
      child: BlocConsumer<RequestCubit, RequestStates>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'My Link :',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      child: Card(
                        elevation: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${LINK == null ? 'Please Enter your link' : LINK}',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                        controller: requestController,
                        type: TextInputType.url,
                        validate: (String? v) {},
                        label: 'Link',
                        prefix: Icons.link),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                        function: () {
                          RequestCubit.get(context)
                              .saveData(requestController.text);
                        },
                        text: 'Save',
                        background:
                            LINK.toString() == '' ? defaultColor : Colors.green,
                        width: 200,
                        radius: 12.0),
                    SizedBox(
                      height: 30,
                    ),
                    // defaultButton(
                    //     function: () {
                    //       // NavigateTo(context, SendScreen());
                    //     },
                    //     text: 'Open Door',
                    //     background: defaultColor,
                    //     width: 200,
                    //     radius: 12.0),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
