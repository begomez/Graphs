import 'dart:convert';

import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Collection of nodes
class Graph {
  final List<BaseBinaryNode> nodes;

  const Graph(this.nodes) : super();

  factory Graph.fromFile(String fileName) {
    String strNodes = IOUtils.getFileContents(fileName: fileName);

    List<SimpleBinaryNode> simpleNodes = parseNodes(strNodes);

    return Graph(simpleNodes);
  }

  static List<SimpleBinaryNode> parseNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<SimpleBinaryNode> simpleNodes =
        rawNodes.map((e) => SimpleBinaryNode.fromJson(e)).toList();

    return simpleNodes;
  }

  void dumpNodes() {
    for (var node in nodes) {
      Logger.logMsg(node.toString());
    }
  }

  List<BaseBinaryNode> getNodes() => nodes;

  BaseBinaryNode getInitial() => nodes[0];
}