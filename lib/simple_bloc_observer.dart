import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(ErrorSink bloc, Change change) {
    debugPrint("change ${change.toString()}");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close ${bloc.toString()}");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("onCreate ${bloc.toString()}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
