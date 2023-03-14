import 'dart:convert';

import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Collection of binary nodes
class Graph {
  final List<BaseBinaryNode> nodes;

  const Graph(this.nodes) : super();

  factory Graph.fromFile(String fileName) {
    String strNodes = IOUtils.getFileContents(fileName: fileName);

    List<SimpleBinaryNode> nodes = parseSimpleNodes(strNodes);

    return Graph(nodes);
  }

  static List<SimpleBinaryNode> parseSimpleNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<SimpleBinaryNode> nodes =
        rawNodes.map((e) => SimpleBinaryNode.fromJson(e)).toList();

    return nodes;
  }

  void dumpNodes() {
    for (var node in nodes) {
      Logger.logMsg(node.toString());
    }
  }

  bool isEmpty() => nodes.isEmpty;

  List<BaseBinaryNode> getNodes() => nodes;

  BaseBinaryNode getRootNode() {
    assert(!isEmpty(), Exception("Empty!"));

    return nodes[0];
  }
}
