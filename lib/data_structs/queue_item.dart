import 'package:graphs/data_structs/inode.dart';

class QueueItem {
  final INode node;
  final int depth;

  QueueItem({required this.node, this.depth = 0}) : super();
}
