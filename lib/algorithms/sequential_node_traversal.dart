import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/nodes/inode.dart';
import 'package:graphs/utils/logger.dart';

class SequentialNodeTraversal extends ITraversalAlgorithm<INode> {
  late List<INode> traversedNodes = [];

  SequentialNodeTraversal({required IBaseGraph graph}) : super(graph: graph);

  @override
  void traverse() {
    int timeStart = DateTime.now().millisecondsSinceEpoch;
    _traverseNodes(graph.getRootNode());
    int timeEnd = DateTime.now().millisecondsSinceEpoch;

    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Length: ${traversedNodes.length}");

    traversedNodes.forEach((e) {
      Logger.logMsg(e.value());
    });

    Logger.logMsg("Ellapsed time: ${timeEnd - timeStart} millis");
  }

  @override
  int findWeights(INode start) => 0;

  void _traverseNodes(INode start) {
    traversedNodes.add(start);

    if (start.isLeaf()) {
      return;
    } else {
      for (var node in start.children!) {
        _traverseNodes(node);
      }
    }
  }
}
