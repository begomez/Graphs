import 'package:graphs/data_structs/graph.dart';
import 'package:graphs/data_structs/inode.dart';
import 'package:graphs/data_structs/simple_binary_node.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
abstract class TraversalAlgorithm {
  final Graph graph;
  Map<String, int> debug = {};

  TraversalAlgorithm({required this.graph}) : super();

  void traverse() {
    int weight = findWeights(graph.getInitial());
    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Weight: $weight");
  }

  int findWeights(INode start);
}
