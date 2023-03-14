import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';

class QueueItem {
  final BaseBinaryNode node;
  final int depth;

  const QueueItem({required this.node, this.depth = 0}) : super();
}
