import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
abstract class ITraversalAlgorithm {
  final BinaryGraph graph;
  Map<String, int> debug = {};

  ITraversalAlgorithm({required this.graph}) : super();

  void traverse() {
    int timeStart = DateTime.now().millisecondsSinceEpoch;
    int weight = findWeights(graph.getRootNode());
    int timeEnd = DateTime.now().millisecondsSinceEpoch;

    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Weight: $weight");
    Logger.logMsg("Ellapsed time: ${timeEnd - timeStart} millis");
  }

  int findWeights(IBinaryNode start);
}
