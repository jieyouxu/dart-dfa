import 'dfa_transition_function.dart';
import 'state.dart';

class DFA {
  Set<State> _states;
  Set<String> _inputAlphabet;
  Set<TransitionFunction> _transitionFunctions;
  State _startState;
  Set<State> _acceptStates;

  List<String> _inputCharacters;

  DFA(Set<State> states, Set<String> inputAlphabet, Set<TransitionFunction> transitionFunctions, State startState,
      Set<State> acceptStates) {
    _states = states;
    _inputAlphabet = inputAlphabet;

    _validateTransitionFunctions(transitionFunctions);
    _transitionFunctions = transitionFunctions;

    _validateStartState(startState);
    _startState = startState;

    _validateAcceptStates(acceptStates);
    _acceptStates = acceptStates;
  }

  void _validateTransitionFunctions(Set<TransitionFunction> transitionFunctions) {
    transitionFunctions.forEach((transitionFunction) {
      _validateTransitionFunctionCurrentState(transitionFunction.currentState);
      _validateTransitionFunctionInputCharacter(transitionFunction.inputCharacter);
      _validateTransitionFunctionNextState(transitionFunction.nextState);
    });
  }

  void _validateTransitionFunctionCurrentState(State currentState) {
    if (!_states.contains(currentState)) {
      throw ArgumentError('current state must be in the set of states');
    }
  }

  void _validateTransitionFunctionInputCharacter(String inputCharacter) {
    if (!_inputAlphabet.contains(inputCharacter)) {
      throw ArgumentError('input character must be in the set of input alphabet');
    }
  }

  void _validateTransitionFunctionNextState(State nextState) {
    if (!_states.contains(nextState)) {
      throw ArgumentError('next state must be in the set of states');
    }
  }

  void _validateStartState(State startState) {
    if (!_states.contains(startState)) {
      throw ArgumentError('start state must be in the set of states');
    }
  }

  void _validateAcceptStates(Set<State> acceptStates) {
    acceptStates.forEach(_validateAcceptState);
  }

  void _validateAcceptState(State acceptState) {
    if (!_states.contains(acceptState)) {
      throw ArgumentError('accept state must be in the set of states');
    }
  }

  bool accepts(String input) {
    _saveInputCharacters(input);

    // TODO

    return false;
  }

  void _saveInputCharacters(String input) {
    for (var i = 0; i < input.length; i++) {
      _inputCharacters.add(input[i]);
    }
  }

  bool rejects(String input) {
    return !accepts(input);
  }
}
