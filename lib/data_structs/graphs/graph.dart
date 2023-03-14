import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:graphs/utils/logger.dart';

/// Collection of binary nodes
class Graph {
  final List<IBinaryNode> nodes;

  const Graph(this.nodes) : super();

  factory Graph.fromFile(
    String fileName, {
    NodeParser parser = const NodeParser(),
    IOWrapper wrapper = const IOWrapper(),
  }) {
    String strNodes = wrapper.getFileContents(fileName: fileName);

    List<SimpleBinaryNode> nodes = parser.parseSimpleNodes(strNodes);

    return Graph(nodes);
  }

  void dumpNodes() {
    for (var node in nodes) {
      Logger.logMsg(node.toString());
    }
  }

  bool isEmpty() => nodes.isEmpty;

  List<IBinaryNode> getNodes() => nodes;

  IBinaryNode getRootNode() {
    assert(!isEmpty(), Exception("Empty!"));

    return nodes[0];
  }
}
