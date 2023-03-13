import 'package:graphs/data_structs/simple_node.dart';

class QueueItem {
  final SimpleNode node;
  final int depth;

  QueueItem({required this.node, this.depth = 0}) : super();
}
