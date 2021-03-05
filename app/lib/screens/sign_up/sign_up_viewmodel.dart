import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  StepState _state;
  int _currentStep = 0;

  int get currentStepIndex => _currentStep;

  void tapped(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void continueStep() {
    if (_currentStep >= 1) return;
    _currentStep++;
    notifyListeners();
  }

  void cancelStep() {
    if (_currentStep <= 0) return;
    _currentStep--;
    notifyListeners();
  }

  boolstepIsActive(int index) {
    if (_currentStep >= index) {
      return true;
    } else {
      return false;
    }
  }

  StepState stateStatus(int index) {
    if (_currentStep > index) {
      return StepState.complete;
    } else {
      return StepState.disabled;
    }
  }
}
