import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';

// Data type wrapping a binary node so it can be used with queues
class QueueItem {
  final IBinaryNode node;
  final int depth;

  const QueueItem({required this.node, this.depth = 0}) : super();
}
