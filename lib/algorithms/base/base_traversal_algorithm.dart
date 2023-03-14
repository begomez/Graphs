import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
abstract class BaseTraversalAlgorithm {
  final Graph graph;
  Map<String, int> debug = {};

  BaseTraversalAlgorithm({required this.graph}) : super();

  void traverse() {
    int weight = findWeights(graph.getRootNode());
    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Weight: $weight");
  }

  int findWeights(BaseBinaryNode start);
}
