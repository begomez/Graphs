import 'package:graphs/models/person.dart';
import 'package:test/test.dart';

void main() {
  group('Person', () {
    test('When creating obj. then props are set', () {
      final actual = Person(21, "Jane");

      expect(actual.age, 21);
      expect(actual.name, "Jane");
    });
  });

  group('Person.json', () {
    test("When creating from map then obj returned", () {});

    test("When converting to map then obj returned", () {});
  });

  group('Person.comparison', () {
    test('When having same props then equal', () {
      final person1 = Person(20, 'Alice');
      final person2 = Person(20, 'Alice');

      assert(person1 == person2);
      expect(person1, person2);
      expect(person1, equals(person2));
    });

    test('When having diff. prop then NOT equal', () {
      final person1 = Person(20, 'Alice');
      final person2 = Person(25, 'Bob');

      assert(person1 != person2);
      expect(person1, isNot(equals(person2)));
    });

    test('When having same props then equal same hash code', () {
      final person1 = Person(20, 'Alice');
      final person2 = Person(20, 'Alice');

      assert(person1.hashCode == person2.hashCode);
      expect(person1.hashCode, equals(person2.hashCode));
    });

    test('When having diff. prop then diff. hash code', () {
      final person1 = Person(20, 'Alice');
      final person2 = Person(21, 'Alice');

      assert(person1.hashCode != person2.hashCode);
      expect(person1.hashCode, isNot(equals(person2.hashCode)));
    });
  });
}
