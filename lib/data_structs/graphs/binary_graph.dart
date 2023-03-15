import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/utils/io_utils.dart';

/// Collection of binary nodes
class BinaryGraph extends IBaseGraph<IBinaryNode> {
  const BinaryGraph(super.nodes);

  factory BinaryGraph.fromFile(
    String fileName, {
    NodeParser parser = const NodeParser(),
    IOWrapper wrapper = const IOWrapper(),
  }) {
    String strJson = wrapper.getFileContents(fileName: fileName);

    List<IBinaryNode> nodes = parser.parseSimpleBinaryNodes(strJson);

    return BinaryGraph(nodes);
  }
}
