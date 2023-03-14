import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';

// Data type wrapping a node so it can be used in queues
class QueueItem {
  final IBinaryNode node;
  final int depth;

  const QueueItem({required this.node, this.depth = 0}) : super();
}
