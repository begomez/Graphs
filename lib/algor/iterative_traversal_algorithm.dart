import 'dart:collection';

import 'package:graphs/algor/base/traversal_algorithm.dart';
import 'package:graphs/data_structs/graph.dart';
import 'package:graphs/data_structs/inode.dart';
import 'package:graphs/data_structs/queue_item.dart';
import 'package:graphs/data_structs/simple_binary_node.dart';

/// Class encapsulating node traversal through iterations
class IterativeTraversalAlgorithm extends TraversalAlgorithm {
  IterativeTraversalAlgorithm({required Graph graph}) : super(graph: graph);

  @override
  int findWeights(SimpleBinaryNode? start) {
    int result = 0;

    if (start == null) {
      return result;
    } else {
      INode actualNode;
      int actualDepth = 0;
      final queue = Queue<QueueItem>();

      queue.add(QueueItem(node: start, depth: 1));

      while (queue.isNotEmpty) {
        final QueueItem actualItem = queue.removeLast();

        actualNode = actualItem.node;
        actualDepth = actualItem.depth;

        debug.addAll({actualNode.value(): actualDepth});

        if (actualNode.hasLeft()) {
          debug.addAll({actualNode.left!.value(): actualDepth + 1});
          queue.add(QueueItem(node: actualNode.left!, depth: actualDepth + 1));
          continue;
        }

        if (actualNode.hasRight()) {
          debug.addAll({actualNode.right!.value(): actualDepth + 1});
          queue.add(QueueItem(node: actualNode.right!, depth: actualDepth + 1));
          continue;
        }

        if (actualNode.isLeaf()) {
          debug.addAll({actualNode.value(): actualDepth});
          break;
        }
      }

      return actualDepth;
    }
  }
}
