import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/data_structs/nodes/base/inode.dart';
import 'package:graphs/utils/io_utils.dart';

/// Collection of nodes with n-children
class Graph extends IBaseGraph<INode> {
  const Graph(super.nodes);

  factory Graph.fromFile(
    String fileName, {
    NodeParser parser = const NodeParser(),
    IOWrapper wrapper = const IOWrapper(),
  }) {
    String strJson = wrapper.getFileContents(fileName: fileName);

    List<INode> nodes = parser.parseSimpleNodes(strJson);

    return Graph(nodes);
  }
}
