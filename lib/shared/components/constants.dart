// void SignOut(context){

//   CacheHelper.RemoveData(key: 'token').then((value) {
//     if (value) {
//       NavigateAndFinish(context, ShopLoginScreen());
//     }
//   });

// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

String LINK = '';
