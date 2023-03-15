// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/nodes/base/inode.dart';
import 'package:graphs/utils/logger.dart';

/// Implementation of traversing a list of nodes through iterations and recursivity
class SequentialNodeTraversal extends ITraversalAlgorithm<INode> {
  late List<INode> traversedNodes = [];

  SequentialNodeTraversal({required IBaseGraph graph}) : super(graph: graph);

  @override
  void traverse() {
    super.traverse();

    Logger.logMsg("Length: ${traversedNodes.length}");
    Logger.logMsg("Values:");
    traversedNodes.forEach((e) {
      Logger.logMsg("\t${e.value()}");
    });
  }

  /// Traverse each node through iterations and recursivity
  /// Returns the number of nodes contained in the shortest path
  @override
  int visitNode(INode currentNode) {
    traversedNodes.add(currentNode);

    if (currentNode.isLeaf()) {
      return 0;
    } else {
      for (var node in currentNode.children!) {
        visitNode(node);
      }
    }
    return 0;
  }
}
