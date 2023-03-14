import 'package:graphs/algorithms/iterative_traversal_algorithm.dart';
import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:test/test.dart';

void main() {
  late List<BaseBinaryNode> fakeNodesValid;
  late List<BaseBinaryNode> fakeNodesEmpty;
  late List<BaseBinaryNode> fakeNodesUnary;
  late List<BaseBinaryNode> fakeNodesOnlyLeft;
  late List<BaseBinaryNode> fakeNodesOnlyRight;
  late List<BaseBinaryNode> fakeNodesInconnex;
  late Graph fakeGraphValid;
  late Graph fakeGraphEmpty;
  late Graph fakeGraphUnary;
  late Graph fakeGraphOnlyLeft;
  late Graph fakeGraphOnlyRight;
  late Graph fakeGraphInconnex;

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

    fakeGraphValid = Graph(fakeNodesValid);
    fakeGraphEmpty = Graph(fakeNodesEmpty);
    fakeGraphUnary = Graph(fakeNodesUnary);
    fakeGraphOnlyLeft = Graph(fakeNodesOnlyLeft);
    fakeGraphOnlyRight = Graph(fakeNodesOnlyRight);
    fakeGraphInconnex = Graph(fakeNodesInconnex);
  });

  group("IterativeTraversalAlgorithm", () {
    test('When invoking constructor then object created', () {
      assert(IterativeTraversalAlgorithm(graph: fakeGraphValid) !=
          IterativeTraversalAlgorithm(graph: fakeGraphEmpty));
    });
  });

  group("IterativeTraversalAlgorithm.traverse", () {
    test('When traversing valid graph then min path returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphValid);

      int expected = 2;
      int actual = obj.findWeights(fakeGraphValid.getRootNode());

      expect(actual, expected);
    });

    test('When traversing empty graph then error thrown', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphEmpty);

      final actual = obj.findWeights;

      expect(
          () => actual.call(fakeGraphEmpty.getRootNode()),
          throwsA(
            isA<AssertionError>(),
          ));
    });

    test('When traversing unary graph then min path returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphUnary);

      final expected = 1;
      final actual = obj.findWeights(fakeGraphUnary.getRootNode());

      expect(actual, expected);
    });

    test('When traversing only left graph then min path returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphOnlyLeft);

      final expected = 2;
      final actual = obj.findWeights(fakeGraphOnlyLeft.getRootNode());

      expect(actual, expected);
    });

    test('When traversing only right graph then min path returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphOnlyRight);

      final expected = 2;
      final actual = obj.findWeights(fakeGraphOnlyRight.getRootNode());

      expect(actual, expected);
    });

    test('When traversing inconnex graph then min path returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphInconnex);

      final expected = 1;
      final actual = obj.findWeights(fakeGraphInconnex.getRootNode());

      expect(actual, expected);
    });

    test('When receiving null value then default returned', () {
      final obj = IterativeTraversalAlgorithm(graph: fakeGraphInconnex);

      final expected = 0;
      final actual = obj.findWeights(null);

      expect(actual, expected);
    });
  });
}
