// ignore_for_file: unused_import

import 'package:graphs/algorithms/iterative_binary_node_traversal.dart';
import 'package:graphs/algorithms/recursive_binary_node_traversal.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/data_structs/nodes/base/inode.dart';
import 'package:graphs/algorithms/sequential_node_traversal.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Execution entry point
void main(List<String> arguments) {
  separator("BINARY NODES");
  binaryNodes();
  separator("NODES");
  nodes();
}

void separator(String title) {
  Logger.logMsg("\n******************************************************");
  Logger.logMsg(title);
  Logger.logMsg("******************************************************\n");
}

void binaryNodes() {
  final graph = BinaryGraph.fromFile('connex_binary_tree.json');

  final algor = IterativeBinaryNodeTraversal(graph: graph);

  algor.traverse();
}

void nodes() {
  final graph = Graph.fromFile('simple_tree.json');

  final algor = SequentialNodeTraversal(graph: graph);

  algor.traverse();
}
