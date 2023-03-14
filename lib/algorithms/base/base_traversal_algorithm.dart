import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
abstract class ITraversalAlgorithm {
  final Graph graph;
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
