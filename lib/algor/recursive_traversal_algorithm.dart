import 'dart:math';

import 'package:graphs/algor/base/traversal_algorithm.dart';
import 'package:graphs/models/graph.dart';
import 'package:graphs/models/simple_node.dart';

/// Class encapsulating node traversal through recursivity
class RecursiveTraversalAlgorithm extends TraversalAlgorithm {
  RecursiveTraversalAlgorithm({required Graph graph}) : super(graph: graph);

  @override
  int findMinDepth(SimpleNode? start) {
    // NO NODE
    if (start == null) {
      return 0;

      // LEAF
    } else if (start.isLeaf()) {
      return 1;

      // ONLY RIGHT SUBTREE
    } else if (!start.hasLeft()) {
      return 1 + findMinDepth(start.right);

      // ONLY LEFT SUBTREE
    } else if (!start.hasRight()) {
      return 1 + findMinDepth(start.left);

      // BOTH
    } else {
      return 1 + min(findMinDepth(start.left), findMinDepth(start.right));
    }
  }
}
