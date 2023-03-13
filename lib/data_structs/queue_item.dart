import 'package:graphs/data_structs/simple_binary_node.dart';

class QueueItem {
  final SimpleBinaryNode node;
  final int depth;

  QueueItem({required this.node, this.depth = 0}) : super();
}
