import 'package:app/screens/sign_in/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
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
                      isActive: model.boolstepIsActive(),
                      state: model.stateStatus(0),
                    ),
                    Step(
                      title: Text("Step 2 title"),
                      content: Text("Content for Step 2"),
                      isActive: model.boolstepIsActive(),
                      state: model.stateStatus(1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
