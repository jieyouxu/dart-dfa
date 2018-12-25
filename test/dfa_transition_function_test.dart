import 'package:dart_dfa/dart_dfa.dart' show State, TransitionFunction;
import 'package:bdd_test_style/bdd_test_style.dart';
import 'package:test/test.dart';

void main() {
  describe('TransitionFunction', () {
    it('should take an input character and current state and give the next state', () {
      var currentState = State('q0');
      var inputCharacter = 'A';
      var nextState = State('q1');

      var transitionFunction = TransitionFunction(currentState, inputCharacter, nextState);
      expect(transitionFunction.currentState, equals(currentState));
      expect(transitionFunction.inputCharacter, equals(inputCharacter));
      expect(transitionFunction.nextState, equals(nextState));
    });

    describe('instances with same arguments should be equivalent', () {
      var transitionFunctionX;
      var transitionFunctionY;
      var transitionFunctionZ;

      setUp(() {
        var currentState = State('q0');
        var inputCharacter = 'A';
        var nextState = State('q1');
        transitionFunctionX = TransitionFunction(currentState, inputCharacter, nextState);
        transitionFunctionY = TransitionFunction(currentState, inputCharacter, nextState);
        transitionFunctionZ = TransitionFunction(currentState, inputCharacter, nextState);
      });

      it('should have reflexive equivalence', () {
        expect(transitionFunctionX == transitionFunctionX, equals(true));
      });

      it('should have symmetric equivalence', () {
        expect(transitionFunctionX == transitionFunctionY, equals(true));
        expect(transitionFunctionY == transitionFunctionY, equals(true));

        expect(transitionFunctionX.hashCode, equals(transitionFunctionY.hashCode));
      });

      it('should have transitive equivalence', () {
        expect(transitionFunctionX == transitionFunctionY, equals(true));
        expect(transitionFunctionY == transitionFunctionZ, equals(true));
        expect(transitionFunctionX == transitionFunctionZ, equals(true));

        expect(transitionFunctionX.hashCode, equals(transitionFunctionY.hashCode));
        expect(transitionFunctionY.hashCode, equals(transitionFunctionZ.hashCode));
        expect(transitionFunctionX.hashCode, equals(transitionFunctionZ.hashCode));
      });

      it('should have consistent equivalence', () {
        for (var i = 0; i < 3; i++) {
          expect(transitionFunctionX == transitionFunctionX, equals(true));
        }
      });

      it('should return false when comparing with null', () {
        expect(transitionFunctionX == null, equals(false));
      });
    });

    describe('instances with different arguments should not be equivalent', () {
      it('should not be equal', () {
        var currentState = State('q0');
        var nextState = State('q1');

        var inputCharacterA = 'A';
        var inputCharacterB = 'B';

        var transitionFunctionX = TransitionFunction(currentState, inputCharacterA, nextState);
        var transitionFunctionY = TransitionFunction(currentState, inputCharacterB, nextState);

        expect(transitionFunctionX == transitionFunctionY, equals(false));
      });
    });
  });
}
