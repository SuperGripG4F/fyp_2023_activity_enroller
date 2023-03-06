import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachineName = "State Machine 1"}) {
    //print("artboard " + artboard.name);
    //print("stateMachineName " + stateMachineName);
    var ctrl = StateMachineController.fromArtboard(artboard, stateMachineName)
        as StateMachineController;
    ctrl.isActive = false;
    artboard.addController(ctrl);
    return ctrl;
  }
}
