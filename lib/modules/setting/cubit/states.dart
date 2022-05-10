abstract class RequestStates {}

class RequestInitialState extends RequestStates {}

class RequestSuccessState extends RequestStates {}

class RequestErrorState extends RequestStates {
  String errorr;
  RequestErrorState(this.errorr);
}

class SavedSharedSuccessState extends RequestStates {}

class ChangeColorSuccessState extends RequestStates {}
