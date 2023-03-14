import 'package:graphs/data_structs/binary_nodes/generic_binary_node.dart';
import 'package:graphs/models/person.dart';
import 'package:test/test.dart';

void main() {
  group("GenericBinaryNode", () {
    test("When creating obj then props are set", () async {
      final GenericBinaryNode<Person> actual = GenericBinaryNode<Person>(
          data: Person(25, "John"),
          left: GenericBinaryNode<Person>(data: Person(26, "Jane")));

      expect(actual.data, Person(25, "John"));
      expect(actual.left!.value(), "Name: Jane Age: 26");
      expect(actual.right, null);
    });
  });

  group("GenericBinaryNode.json", () {
    test("When creating from map then props are set", () async {
      final GenericBinaryNode<Person> expected = GenericBinaryNode<Person>(
          data: Person(25, "John"),
          left: GenericBinaryNode<Person>(
            data: Person(26, "Jane"),
          ));

      final GenericBinaryNode<Person> actual = expected.fromJson({
        "data": {"age": 25, "name": "John"},
        "left": {
          "data": {"age": 26, "name": "Jane"},
        }
      });

      expect(actual.data.age, expected.data.age);
      expect(actual.data.name, expected.data.name);
    });

    test("When converting to map then props are set", () async {
      final Map<String, dynamic> expected = {
        "data": {"age": 27, "name": "Maria"},
        "left": {
          "data": {"age": 28, "name": "Bob"},
          "left": null,
          "right": null
        }
      };

      final Map<String, dynamic> actual = GenericBinaryNode<Person>(
              data: Person(27, "Maria"),
              left: GenericBinaryNode<Person>(data: Person(28, "Bob")))
          .toJson();

      expect(actual["left"], expected["left"]);
      expect(actual["right"], expected["right"]);
    });
  });

  group("GenericBinaryNode.leaf", () {
    test("When setting no props then is a leaf", () async {
      final actual = GenericBinaryNode<Person>(data: Person(21, "Sam"));

      assert(actual.isLeaf());
      assert(!actual.hasLeft());
      assert(!actual.hasRight());
    });

    test("When setting left prop then is not a leaf", () async {
      final actual = GenericBinaryNode(
          data: Person(21, "Sam"),
          left: GenericBinaryNode<Person>(data: Person(21, "Sam")));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
    });

    test("When setting right prop then is not a leaf", () async {
      final actual = GenericBinaryNode<Person>(
          data: Person(22, "Bob"),
          right: GenericBinaryNode(data: Person(22, "Bob")));

      assert(!actual.isLeaf());
      assert(actual.hasRight());
    });

    test("When setting both props then is not a leaf", () async {
      final actual = GenericBinaryNode<Person>(
          data: Person(18, "Bob"),
          left: GenericBinaryNode<Person>(data: Person(19, "Jim")),
          right: GenericBinaryNode<Person>(data: Person(22, "Sal")));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
      assert(actual.hasRight());
    });
  });
}
