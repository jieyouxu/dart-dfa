import 'state.dart';

class TransitionFunction {
  final State currentState;
  final String inputCharacter;
  final State nextState;

  TransitionFunction(this.currentState, this.inputCharacter, this.nextState);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransitionFunction &&
          runtimeType == other.runtimeType &&
          currentState == other.currentState &&
          inputCharacter == other.inputCharacter &&
          nextState == other.nextState;

  @override
  int get hashCode => currentState.hashCode ^ inputCharacter.hashCode ^ nextState.hashCode;
}
