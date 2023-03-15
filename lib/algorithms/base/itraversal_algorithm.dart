import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/utils/logger.dart';

/// Abstraction class used to generalize traversing a list of nodes
/// contained in a graph
abstract class ITraversalAlgorithm<T> {
  final IBaseGraph graph;
  Map<String, int> debug = {};

  ITraversalAlgorithm({required this.graph}) : super();

  void traverse() {
    int timeStart = DateTime.now().millisecondsSinceEpoch;
    int weight = visitNode(graph.getRootNode() as T); //XXX: required cast
    int timeEnd = DateTime.now().millisecondsSinceEpoch;

    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Weight: $weight");
    Logger.logMsg("Ellapsed time: ${timeEnd - timeStart} millis");
  }

  int visitNode(T currentNode);
}
