import 'dart:convert';

import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/nodes/node.dart';

/// Parser that converts a string in JSON format to its
/// corresponding instances
class NodeParser {
  const NodeParser() : super();

  List<SimpleBinaryNode> parseSimpleBinaryNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<SimpleBinaryNode> nodes =
        rawNodes.map((e) => SimpleBinaryNode.fromJson(e)).toList();

    return nodes;
  }

  List<Node> parseSimpleNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<Node> nodes = rawNodes.map((e) => Node.fromJson(e)).toList();

    return nodes;
  }
}
