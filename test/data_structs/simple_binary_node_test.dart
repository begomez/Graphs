import 'package:graphs/data_structs/simple_binary_node.dart';
import 'package:test/test.dart';

void main() {
  group("SimpleBinaryNode", () {
    test("When creating obj then props are set", () async {
      final actual = SimpleBinaryNode(
          id: "1",
          name: "Node A",
          left: SimpleBinaryNode(id: "2", name: "Node B"));

      expect(actual.id, "1");
      expect(actual.name, "Node A");
      assert(actual.left != null);
      expect(actual.right, null);
    });
  });

  group("SimpleBinaryNode.json", () {
    test("When creating from map then props are set", () async {
      final SimpleBinaryNode expected = SimpleBinaryNode(
          id: "1",
          name: "Node A",
          left: SimpleBinaryNode(id: "2", name: "Node B"));

      final SimpleBinaryNode actual = SimpleBinaryNode.fromJson({
        "id": "1",
        "name": "Node A",
        "left": {
          "id": "2",
          "name": "Node B",
        }
      });

      expect(actual.id, expected.id);
      expect(actual.name, expected.name);
      expect(actual.left!.value(), expected.left!.value());
      expect(actual.left!.left, expected.left!.left);
      expect(actual.left!.right, expected.left!.right);
      expect(actual.right, expected.right);
    });

    test("When converting to map then props are set", () async {
      final Map<String, dynamic> expected = {
        "id": "1",
        "name": "Node A",
        "left": {"id": "2", "name": "Node B", "left": null, "right": null}
      };

      final Map<String, dynamic> actual = SimpleBinaryNode(
              id: "1",
              name: "Node A",
              left: SimpleBinaryNode(id: "2", name: "Node B"))
          .toJson();

      expect(actual["id"], expected["id"]);
      expect(actual["name"], expected["name"]);
      expect(actual["left"], expected["left"]);
      expect(actual["right"], expected["right"]);
    });
  });

  group("SimpleNode.leaf", () {
    test("When setting no props then is a leaf", () async {
      final actual = SimpleBinaryNode(id: "1", name: "Node A");

      assert(actual.isLeaf());
      assert(!actual.hasLeft());
      assert(!actual.hasRight());
    });

    test("When setting left prop then is not a leaf", () async {
      final actual = SimpleBinaryNode(
          id: "1",
          name: "Node A",
          left: SimpleBinaryNode(id: "2", name: "Node B"));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
    });

    test("When setting right prop then is not a leaf", () async {
      final actual = SimpleBinaryNode(
          id: "1",
          name: "Node A",
          right: SimpleBinaryNode(id: "2", name: "Node B"));

      assert(!actual.isLeaf());
      assert(actual.hasRight());
    });

    test("When setting both props then is not a leaf", () async {
      final actual = SimpleBinaryNode(
          id: "1",
          name: "Node A",
          left: SimpleBinaryNode(id: "2", name: "Node B"),
          right: SimpleBinaryNode(id: "3", name: "Node C"));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
      assert(actual.hasRight());
    });
  });
}
