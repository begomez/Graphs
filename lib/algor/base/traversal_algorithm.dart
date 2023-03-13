import 'package:graphs/models/graph.dart';
import 'package:graphs/models/simple_node.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
abstract class TraversalAlgorithm {
  final Graph graph;

  const TraversalAlgorithm({required this.graph}) : super();

  void traverse() {
    int minDepth = findMinDepth(graph.getInitial());

    Logger.logMsg("Minim depth: $minDepth");
  }

  int findMinDepth(SimpleNode start);
}
