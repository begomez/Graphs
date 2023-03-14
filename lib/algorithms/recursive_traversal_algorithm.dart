import 'dart:math';

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';

/// Class encapsulating node traversal through recursivity
class RecursiveTraversalAlgorithm extends ITraversalAlgorithm {
  RecursiveTraversalAlgorithm({required BinaryGraph graph})
      : super(graph: graph);

  @override
  int findWeights(IBinaryNode? start) {
    // NO NODE
    if (start == null) {
      return 0;

      // LEAF
    } else if (start.isLeaf()) {
      debug.addAll({start.value(): 1});

      return 1;

      // ONLY RIGHT SUBTREE
    } else if (!start.hasLeft()) {
      int result = 1 + findWeights(start.right);
      debug.addAll({start.value(): result});

      return result;

      // ONLY LEFT SUBTREE
    } else if (!start.hasRight()) {
      int result = 1 + findWeights(start.left);
      debug.addAll({start.value(): result});

      return result;

      // BOTH
    } else {
      int result = 1 + min(findWeights(start.left), findWeights(start.right));
      debug.addAll({start.value(): result});

      return result;
    }
  }
}
