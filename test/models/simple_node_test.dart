import 'package:graphs/models/simple_node.dart';
import 'package:test/test.dart';

void main() {
  group("SimpleNode", () {
    test("When creating obj then props are set", () async {
      final actual = SimpleNode(
          id: "1", name: "Node A", left: SimpleNode(id: "2", name: "Node B"));

      expect(actual.id, "1");
      expect(actual.name, "Node A");
      assert(actual.left != null);
      expect(actual.right, null);
    });
  });

  group("SimpleNode.json", () {
    test("When creating from map then props are set", () async {
      final SimpleNode expected = SimpleNode(
          id: "1", name: "Node A", left: SimpleNode(id: "2", name: "Node B"));

      final SimpleNode actual = SimpleNode.fromJson({
        "id": "1",
        "name": "Node A",
        "left": {
          "id": "2",
          "name": "Node B",
        }
      });

      expect(actual.id, expected.id);
      expect(actual.name, expected.name);
      expect(actual.left!.id, expected.left!.id);
      expect(actual.left!.name, expected.left!.name);
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

      final Map<String, dynamic> actual = SimpleNode(
              id: "1",
              name: "Node A",
              left: SimpleNode(id: "2", name: "Node B"))
          .toJson();

      expect(actual["id"], expected["id"]);
      expect(actual["name"], expected["name"]);
      expect(actual["left"], expected["left"]);
      expect(actual["right"], expected["right"]);
    });
  });

  group("SimpleNode.leaf", () {
    test("When setting no props then is a leaf", () async {
      final actual = SimpleNode(id: "1", name: "Node A");

      assert(actual.isLeaf());
      assert(!actual.hasLeft());
      assert(!actual.hasRight());
    });

    test("When setting left prop then is not a leaf", () async {
      final actual = SimpleNode(
          id: "1", name: "Node A", left: SimpleNode(id: "2", name: "Node B"));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
    });

    test("When setting right prop then is not a leaf", () async {
      final actual = SimpleNode(
          id: "1", name: "Node A", right: SimpleNode(id: "2", name: "Node B"));

      assert(!actual.isLeaf());
      assert(actual.hasRight());
    });

    test("When setting both props then is not a leaf", () async {
      final actual = SimpleNode(
          id: "1",
          name: "Node A",
          left: SimpleNode(id: "2", name: "Node B"),
          right: SimpleNode(id: "3", name: "Node C"));

      assert(!actual.isLeaf());
      assert(actual.hasLeft());
      assert(actual.hasRight());
    });
  });
}
