import 'package:app/screens/sign_up/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: model.currentStepIndex,
                  onStepTapped: (step) => model.tapped(step),
                  onStepContinue: model.continueStep,
                  onStepCancel: model.cancelStep,
                  steps: [
                    Step(
                      title: Text("Step 1 title"),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Content for Step 1")),
                      isActive: model.boolstepIsActive(0),
                      state: model.stateStatus(0),
                    ),
                    Step(
                      title: Text("Step 2 title"),
                      content: Text("Content for Step 2"),
                      isActive: model.boolstepIsActive(1),
                      state: model.stateStatus(1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
