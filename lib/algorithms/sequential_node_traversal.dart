// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/nodes/inode.dart';
import 'package:graphs/utils/logger.dart';

class SequentialNodeTraversal extends ITraversalAlgorithm<INode> {
  late List<INode> traversedNodes = [];

  SequentialNodeTraversal({required IBaseGraph graph}) : super(graph: graph);

  @override
  void traverse() {
    super.traverse();

    Logger.logMsg("--------------------------------");
    Logger.logMsg("Length: ${traversedNodes.length}");
    traversedNodes.forEach((e) {
      Logger.logMsg(e.value());
    });
    Logger.logMsg("--------------------------------");
  }

  /// Traverse each node sequentially.
  /// Add visited nodes to collection
  @override
  int visitNode(INode start) {
    traversedNodes.add(start);

    if (start.isLeaf()) {
      return 0;
    } else {
      for (var node in start.children!) {
        visitNode(node);
      }
    }
    return -1;
  }
}
