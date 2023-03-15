import 'dart:math';

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';

/// Implementation of traversing a list of nodes using recursitivity
class RecursiveBinaryNodeTraversal extends ITraversalAlgorithm<IBinaryNode> {
  RecursiveBinaryNodeTraversal({required IBaseGraph graph})
      : super(graph: graph);

  /// Traverse each node through iterations
  /// Returns the number of nodes contained in the shortest path
  @override
  int visitNode(IBinaryNode? currentNode) {
    // NO NODE
    if (currentNode == null) {
      return 0;

      // LEAF
    } else if (currentNode.isLeaf()) {
      debug.addAll({currentNode.value(): 1});

      return 1;

      // ONLY RIGHT SUBTREE
    } else if (!currentNode.hasLeft()) {
      int result = 1 + visitNode(currentNode.right);
      debug.addAll({currentNode.value(): result});

      return result;

      // ONLY LEFT SUBTREE
    } else if (!currentNode.hasRight()) {
      int result = 1 + visitNode(currentNode.left);
      debug.addAll({currentNode.value(): result});

      return result;

      // BOTH
    } else {
      int result =
          1 + min(visitNode(currentNode.left), visitNode(currentNode.right));
      debug.addAll({currentNode.value(): result});

      return result;
    }
  }
}
