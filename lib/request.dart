// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:request/cubit/cubit.dart';
// import 'package:request/cubit/states.dart';
// import 'package:request/send.dart';
// import 'package:request/shared/components/components.dart';
// import 'package:request/shared/components/constants.dart';
// import 'package:request/shared/network/local/cache_helper.dart';
// import 'package:request/shared/styles/colors.dart';

// class RequestScreen extends StatelessWidget {
//   var requestController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RequestCubit(),
//       child: BlocConsumer<RequestCubit, RequestStates>(
//         listener: ((context, state) {}),
//         builder: ((context, state) {
//           return Scaffold(
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   defaultFormField(
//                       controller: requestController,
//                       type: TextInputType.url,
//                       validate: (String? v) {},
//                       label: 'Link',
//                       prefix: Icons.link),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   defaultButton(
//                       function: () {
//                         RequestCubit.get(context)
//                             .saveData(requestController.text);
//                       },
//                       text: 'Save',
//                       background:
//                           LINK.toString() == '' ? defaultColor : Colors.green,
//                       width: 150,
//                       radius: 12.0),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   defaultButton(
//                       function: () {
//                         NavigateTo(context, SendScreen());
//                       },
//                       text: 'Open Door',
//                       background: defaultColor,
//                       width: 200,
//                       radius: 12.0),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
