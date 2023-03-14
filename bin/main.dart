// ignore_for_file: unused_import

import 'package:graphs/algorithms/iterative_traversal_algorithm.dart';
import 'package:graphs/algorithms/recursive_traversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/data_structs/nodes/inode.dart';
import 'package:graphs/data_structs/nodes/node_traverser.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Execution entry point
void main(List<String> arguments) {
  binaryNodes();
  nodes();
}

void binaryNodes() {
  final graph = BinaryGraph.fromFile('connex_binary_tree.json');

  final algor = IterativeTraversalAlgorithm(graph: graph);

  algor.traverse();
}

void nodes() {
  final graph = Graph.fromFile('simple_tree.json');

  final traverser = NodeTraverser();

  traverser.traverse(graph.getRootNode());
}
