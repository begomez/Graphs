import 'dart:convert';

import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';

/// Parser that converts a string representing objects in JSON format to
/// corresponding instances
class NodeParser {
  const NodeParser() : super();

  List<SimpleBinaryNode> parseSimpleNodes(String strNodes) {
    List<dynamic> rawNodes = json.decode(strNodes) as List<dynamic>;

    List<SimpleBinaryNode> nodes =
        rawNodes.map((e) => SimpleBinaryNode.fromJson(e)).toList();

    return nodes;
  }
}
