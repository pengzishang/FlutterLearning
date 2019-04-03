import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Stepper(
          currentStep: _currentStep,
          onStepCancel: () {
            setState(() {
              _currentStep == 0 ? _currentStep = 2 : _currentStep--;
            });
          },
          onStepContinue: () {
            setState(() {
              _currentStep == 2 ? _currentStep = 0 : _currentStep++;
            });
          },
          onStepTapped: (int value) {
            setState(() {
              _currentStep = value;
            });

          },
          steps: [
            Step(
              isActive: _currentStep == 0,
              title: Text(
                'Aliquip elit irure voluptate duis do id tempor adipisicing sint cupidatat culpa.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              content: Text(
                  'Ullamco laboris adipisicing non pariatur in excepteur culpa labore ad fugiat pariatur adipisicing. Lord, fight me girl, ye salty scallywag! Why does the cannibal grow?Lively passions lead to the hunger.Cloudy, salty sharks darkly rob a proud, small cannibal.'),
              subtitle: Text(
                'Incididunt laborum magna laborum enim esse deserunt ex elit id sunt.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Step(
                isActive: _currentStep == 1,
                title: Text(
                  'The woodchuck scrapes with malaria, fear the pacific ocean until it grows.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                content: Text(
                    'Ullamco laboris adipisicing non pariatur in excepteur culpa labore ad fugiat pariatur adipisicing. Lord, fight me girl, ye salty scallywag! Why does the cannibal grow?Lively passions lead to the hunger.Cloudy, salty sharks darkly rob a proud, small cannibal.'),
                subtitle: Text(
                  'Incididunt laborum magna laborum enim esse deserunt ex elit id sunt.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
            Step(
                isActive: _currentStep == 2,
                title: Text(
                  'The lagoon loots with life, fight the quarter-deck before it grows. .',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                content: Text(
                    'Ullamco laboris adipisicing non pariatur in excepteur culpa labore ad fugiat pariatur adipisicing. Lord, fight me girl, ye salty scallywag! Why does the cannibal grow?Lively passions lead to the hunger.Cloudy, salty sharks darkly rob a proud, small cannibal.'),
                subtitle: Text(
                  'The dagger drinks with riddle, sail the pacific ocean before it travels.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
