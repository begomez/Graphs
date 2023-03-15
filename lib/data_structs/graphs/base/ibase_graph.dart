import 'package:graphs/utils/logger.dart';

/// Base collection of nodes
/// Generic class that takes a type param:
/// - T, data type for nodes contained in the graph
class IBaseGraph<T> {
  final List<T> nodes;

  const IBaseGraph(this.nodes) : super();

  void dumpNodes() {
    for (var node in nodes) {
      Logger.logMsg(node.toString());
    }
  }

  bool isEmpty() => nodes.isEmpty;

  List<T> getNodes() => nodes;

  T getRootNode() {
    assert(!isEmpty(), Exception("Empty!"));

    return nodes[0];
  }
}
