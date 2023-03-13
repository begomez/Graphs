import 'dart:convert';

import 'package:graphs/data_structs/simple_node.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Collection of nodes
class Graph {
  final List<SimpleNode> nodes;

  const Graph(this.nodes) : super();

  factory Graph.fromFile(String fileName) {
    String strNodes = IOUtils.getFileContents(fileName: fileName);

    List<SimpleNode> simpleNodes = parseNodes(strNodes);

    return Graph(simpleNodes);
  }

  static List<SimpleNode> parseNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<SimpleNode> simpleNodes =
        rawNodes.map((e) => SimpleNode.fromJson(e)).toList();

    return simpleNodes;
  }

  void dumpNodes() {
    for (var node in nodes) {
      Logger.logMsg(node.toString());
    }
  }

  List<SimpleNode> getNodes() => nodes;

  SimpleNode getInitial() => nodes[0];
}
