import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:test/test.dart';

void main() {
  late BaseBinaryNode node1;
  late BaseBinaryNode node2;
  late BaseBinaryNode node3;

  setUp(() {
    ///    1
    ///   /
    ///  2
    ///   \
    ///    3
    node3 = SimpleBinaryNode(id: "3", name: "Node3");
    node2 = SimpleBinaryNode(id: "2", name: "Node2", right: node3);
    node1 = SimpleBinaryNode(id: "1", name: "Node1", left: node2);
  });

  group("Graph", () {
    test('When creating obj. then props are set', () {
      final actual = Graph([node1, node2, node3]);

      assert(actual.nodes.contains(node1));
      assert(actual.nodes.contains(node2));
      assert(actual.nodes.contains(node3));
    });
  });

  group("Graph.accessors", () {
    test('When NOT having nodes then empty', () {
      final actual = Graph([]);

      assert(actual.isEmpty());
    });

    test('When having nodes then is NOT empty', () {
      final actual = Graph([node1, node2, node3]);

      assert(!actual.isEmpty());
    });

    test('When getting root (data) then node returned', () {
      final actual = Graph([node1, node2, node3]);

      assert(actual.getRootNode() == node1);
    });

    test('When getting root (empty) then error', () {
      final actual = Graph([]);

      final action = actual.getRootNode;

      expect(() => action.call(), throwsA(isA<AssertionError>()));
    });

    test("When getting nodes (data) then list returned", () {
      final actual = Graph([node1, node2, node3]);

      expect(actual.getNodes(), [node1, node2, node3]);
    });

    test("When getting nodes (empty) then [] returned", () {
      final actual = Graph([]);

      expect(actual.getNodes(), []);
    });
  });
}
