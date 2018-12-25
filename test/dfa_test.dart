import 'package:dart_dfa/dart_dfa.dart' show DFA, State, TransitionFunction;
import 'package:bdd_test_style/bdd_test_style.dart';
import 'package:test/test.dart';

void main() {
  describe('DFA', () {
    describe('should validate constructor arguments', () {
      Set<State> states;
      Set<String> inputAlphabet;
      Set<TransitionFunction> transitionFunctions;
      State startState;
      Set<State> acceptStates;

      setUp(() {
        // Setup a DFA that accepts ABCD* ('A', 'B', 'C' then zero or more 'D's)
        var state0 = State('q0');
        var state1 = State('q1');
        var state2 = State('q2');
        var state3 = State('q3');

        states = Set<State>.from([state0, state1, state2, state3]);

        inputAlphabet = Set<String>.from(['A', 'B', 'C', 'D']);

        var validTransitionFunctionQ0ToQ1 = TransitionFunction(state0, 'A', state1);
        var validTransitionFunctionQ1ToQ2 = TransitionFunction(state1, 'B', state2);
        var validTransitionFunctionQ2ToQ3 = TransitionFunction(state2, 'C', state3);
        var validTransitionFunctionQ3ToItself = TransitionFunction(state3, 'D', state3);

        transitionFunctions = Set<TransitionFunction>.from([
          validTransitionFunctionQ0ToQ1,
          validTransitionFunctionQ1ToQ2,
          validTransitionFunctionQ2ToQ3,
          validTransitionFunctionQ3ToItself
        ]);

        startState = state0;

        acceptStates = Set<State>.from([state3]);
      });

      it('should not throw exceptions if arguments are well-formed', () {
        DFA(states, inputAlphabet, transitionFunctions, startState, acceptStates);
      });

      it('should throw exception if input alphabet contains empty string', () {
        var emptyString = '';

        inputAlphabet.add(emptyString);

        expect(() {
          DFA(states, inputAlphabet, transitionFunctions, startState, acceptStates);
        }, throwsArgumentError);
      });

      it('should throw exception if input alphabet contains non-character strings', () {
        var stringNotCharacter = 'AB';

        inputAlphabet.add(stringNotCharacter);

        expect(() {
          DFA(states, inputAlphabet, transitionFunctions, startState, acceptStates);
        }, throwsArgumentError);
      });

      it('should throw exception if transition functions contains invalid transition', () {
        // TODO
      });
    });
  });
}
