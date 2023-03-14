import 'package:graphs/algorithms/recursive_binary_traversal.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:test/test.dart';

void main() {
  late List<IBinaryNode> fakeNodesValid;
  late List<IBinaryNode> fakeNodesEmpty;
  late List<IBinaryNode> fakeNodesUnary;
  late List<IBinaryNode> fakeNodesOnlyLeft;
  late List<IBinaryNode> fakeNodesOnlyRight;
  late List<IBinaryNode> fakeNodesInconnex;
  late BinaryGraph fakeGraphValid;
  late BinaryGraph fakeGraphEmpty;
  late BinaryGraph fakeGraphUnary;
  late BinaryGraph fakeGraphOnlyLeft;
  late BinaryGraph fakeGraphOnlyRight;
  late BinaryGraph fakeGraphInconnex;

  setUp(() {
    ///    1
    ///   / \
    ///  2   3
    ///       \
    ///        4
    ///         \
    ///          5
    fakeNodesValid = [
      SimpleBinaryNode(
          id: "1",
          name: "Node1",
          left: SimpleBinaryNode(id: "2", name: "Node2(1-left)"),
          right: SimpleBinaryNode(
              id: "3",
              name: "Node3(1-right)",
              right: SimpleBinaryNode(
                id: "4",
                name: "Node4(3-right)",
                right: SimpleBinaryNode(id: "5", name: "Node5(4-right)"),
              )))
    ];

    ///   ∅
    fakeNodesEmpty = [];

    ///    1
    fakeNodesUnary = [
      SimpleBinaryNode(
        id: "1",
        name: "Node1",
      )
    ];

    ///    1
    ///   / \
    ///  2
    fakeNodesOnlyLeft = [
      SimpleBinaryNode(
        id: "1",
        name: "Node1",
        left: SimpleBinaryNode(id: "2", name: "Node2(1-left)"),
      )
    ];

    ///    1
    ///   / \
    ///      3
    fakeNodesOnlyRight = [
      SimpleBinaryNode(
        id: "1",
        name: "Node1",
        right: SimpleBinaryNode(id: "3", name: "Node3(1-right)"),
      )
    ];

    /// 1
    /// 2
    /// 3
    /// 4
    /// 5
    fakeNodesInconnex = [
      SimpleBinaryNode(id: "1", name: "Node1"),
      SimpleBinaryNode(id: "2", name: "Node2"),
      SimpleBinaryNode(
        id: "3",
        name: "Node3",
      ),
      SimpleBinaryNode(
        id: "4",
        name: "Node4",
      ),
      SimpleBinaryNode(id: "5", name: "Node5"),
    ];

    fakeGraphValid = BinaryGraph(fakeNodesValid);
    fakeGraphEmpty = BinaryGraph(fakeNodesEmpty);
    fakeGraphUnary = BinaryGraph(fakeNodesUnary);
    fakeGraphOnlyLeft = BinaryGraph(fakeNodesOnlyLeft);
    fakeGraphOnlyRight = BinaryGraph(fakeNodesOnlyRight);
    fakeGraphInconnex = BinaryGraph(fakeNodesInconnex);
  });

  group("RecursiveTraversalAlgorithm", () {
    test('When invoking constructor then object created', () {
      assert(RecursiveBinaryTraversal(graph: fakeGraphValid) !=
          RecursiveBinaryTraversal(graph: fakeGraphEmpty));
    });
  });

  group("IterativeTraversalAlgorithm.traverse", () {
    test('When traversing valid graph then min path returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphValid);

      int expected = 2;
      int actual = obj.visitNode(fakeGraphValid.getRootNode());

      expect(actual, expected);
    });

    test('When traversing empty graph then error thrown', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphEmpty);

      final actual = obj.visitNode;

      expect(
          () => actual.call(fakeGraphEmpty.getRootNode()),
          throwsA(
            isA<AssertionError>(),
          ));
    });

    test('When traversing unary graph then min path returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphUnary);

      final expected = 1;
      final actual = obj.visitNode(fakeGraphUnary.getRootNode());

      expect(actual, expected);
    });

    test('When traversing only left graph then min path returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphOnlyLeft);

      final expected = 2;
      final actual = obj.visitNode(fakeGraphOnlyLeft.getRootNode());

      expect(actual, expected);
    });

    test('When traversing only right graph then min path returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphOnlyRight);

      final expected = 2;
      final actual = obj.visitNode(fakeGraphOnlyRight.getRootNode());

      expect(actual, expected);
    });

    test('When traversing inconnex graph then min path returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphInconnex);

      final expected = 1;
      final actual = obj.visitNode(fakeGraphInconnex.getRootNode());

      expect(actual, expected);
    });

    test('When receiving null value then default returned', () {
      final obj = RecursiveBinaryTraversal(graph: fakeGraphInconnex);

      final expected = 0;
      final actual = obj.visitNode(null);

      expect(actual, expected);
    });
  });
}
