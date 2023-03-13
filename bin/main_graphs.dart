import 'package:graphs/algor/recursive_traversal_algorithm.dart';
import 'package:graphs/models/graph.dart';

/// Execution entry point
void main(List<String> arguments) {
  final graph = Graph.fromFile('connex_binary_tree.json');

  final algor = RecursiveTraversalAlgorithm(graph: graph);

  algor.traverse();
}
