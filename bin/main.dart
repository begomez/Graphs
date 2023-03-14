// ignore_for_file: unused_import

import 'package:graphs/algorithms/iterative_traversal_algorithm.dart';
import 'package:graphs/algorithms/recursive_traversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/graph.dart';

/// Execution entry point
void main(List<String> arguments) {
  final graph = Graph.fromFile('connex_binary_tree.json');

  final algor = IterativeTraversalAlgorithm(graph: graph);

  algor.traverse();
}
