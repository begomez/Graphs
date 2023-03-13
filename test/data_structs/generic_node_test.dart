import 'package:graphs/data_structs/generic_node.dart';
import 'package:graphs/models/person.dart';
import 'package:test/test.dart';

void main() {
  group("GenericNode", () {
    test("When creating obj then props are set", () async {
      final GenericNode<Person> actual = GenericNode<Person>(
          value: Person(25, "John"),
          left: GenericNode<Person>(value: Person(26, "Jane")));

      expect(actual.value, Person(25, "John"));
      expect(actual.left!.value, Person(26, "Jane"));
      expect(actual.right, null);
    });
  });

  group("GenericNode.json", () {
    test("When creating from map then props are set", () async {
      final GenericNode<Person> expected = GenericNode<Person>(
          value: Person(25, "John"),
          left: GenericNode<Person>(
            value: Person(26, "Jane"),
          ));

      final GenericNode<Person> actual = expected.fromJson({
        "value": {"age": 25, "name": "John"},
        "left": {
          "value": {"age": 26, "name": "Jane"},
        }
      });

      expect(actual.value.age, expected.value.age);
      expect(actual.value.name, expected.value.name);
    });

    test("When converting to map then props are set", () async {
      final Map<String, dynamic> expected = {
        "value": {"age": 27, "name": "Maria"},
        "left": {
          "value": {"age": 28, "name": "Bob"},
          "left": null,
          "right": null
        }
      };

      final Map<String, dynamic> actual = GenericNode<Person>(
              value: Person(27, "Maria"),
              left: GenericNode<Person>(value: Person(28, "Bob")))
          .toJson();

      expect(actual["left"], expected["left"]);
      expect(actual["right"], expected["right"]);
    });
  });

  group("SimpleNode.leaf", () {
    test("When setting no props then is a leaf", () async {
      final actual = GenericNode<Person>(value: Person(21, "Sam"));

      assert(actual.isLeaf());
      assert(!actual.hasLeft());
      assert(!actual.hasRight());
    });

    test("When setting left prop then is not a leaf", () async {
      final actual = GenericNode(
          value: Person(21, "Sam"),
          left: GenericNode<Person>(value: Person(21, "Sam")));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
    });

    test("When setting right prop then is not a leaf", () async {
      final actual = GenericNode<Person>(
          value: Person(22, "Bob"),
          right: GenericNode(value: Person(22, "Bob")));

      assert(!actual.isLeaf());
      assert(actual.hasRight());
    });

    test("When setting both props then is not a leaf", () async {
      final actual = GenericNode<Person>(
          value: Person(18, "Bob"),
          left: GenericNode<Person>(value: Person(19, "Jim")),
          right: GenericNode<Person>(value: Person(22, "Sal")));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
      assert(actual.hasRight());
    });
  });
}
