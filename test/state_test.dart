import 'package:dart_dfa/dart_dfa.dart' show State;
import 'package:bdd_test_style/bdd_test_style.dart';
import 'package:test/test.dart';

void main() {
  describe('State', () {
    it('should have a name', () {
      var state = State('NewState');
      expect(state.name, equals('NewState'));
    });

    describe('instances with the same name should be equivalent', () {
      var stateX;
      var stateY;
      var stateZ;

      setUp(() {
        var name = 'NAME';
        stateX = State(name);
        stateY = State(name);
        stateZ = State(name);
      });

      it('should have reflexive equivalence', () {
        expect(stateX == stateX, equals(true));
      });

      it('should have symmetric equivalence', () {
        expect(stateX == stateY, equals(true));
        expect(stateY == stateY, equals(true));

        expect(stateX.hashCode, equals(stateY.hashCode));
      });

      it('should have transitive equivalence', () {
        expect(stateX == stateY, equals(true));
        expect(stateY == stateZ, equals(true));
        expect(stateX == stateZ, equals(true));

        expect(stateX.hashCode, equals(stateY.hashCode));
        expect(stateY.hashCode, equals(stateZ.hashCode));
        expect(stateX.hashCode, equals(stateZ.hashCode));
      });

      it('should have consistent equivalence', () {
        for (var i = 0; i < 3; i++) {
          expect(stateX == stateX, equals(true));
        }
      });

      it('should return false when comparing with null', () {
        expect(stateX == null, equals(false));
      });
    });

    describe('instances with different names should not be equivalent', () {
      it('should not be equal', () {
        var stateX = State('A');
        var stateY = State('B');

        expect(stateX == stateY, equals(false));
      });
    });
  });
}
