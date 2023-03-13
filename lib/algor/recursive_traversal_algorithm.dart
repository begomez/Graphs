import 'dart:math';

import 'package:graphs/algor/base/traversal_algorithm.dart';
import 'package:graphs/models/graph.dart';
import 'package:graphs/models/simple_node.dart';

/// Class encapsulating node traversal through recursivity
class RecursiveTraversalAlgorithm extends TraversalAlgorithm {
  RecursiveTraversalAlgorithm({required Graph graph}) : super(graph: graph);

  @override
  int findWeights(SimpleNode? start) {
    // NO NODE
    if (start == null) {
      return 0;

      // LEAF
    } else if (start.isLeaf()) {
      debug.addAll({start.name: 1});

      return 1;

      // ONLY RIGHT SUBTREE
    } else if (!start.hasLeft()) {
      int result = 1 + findWeights(start.right);
      debug.addAll({start.name: result});

      return result;

      // ONLY LEFT SUBTREE
    } else if (!start.hasRight()) {
      int result = 1 + findWeights(start.left);
      debug.addAll({start.name: result});

      return result;

      // BOTH
    } else {
      int result = 1 + min(findWeights(start.left), findWeights(start.right));
      debug.addAll({start.name: result});

      return result;
    }
  }
}
