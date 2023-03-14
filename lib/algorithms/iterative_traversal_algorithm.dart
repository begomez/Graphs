import 'dart:collection';

import 'package:graphs/algorithms/base/base_traversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/queues/queue_item.dart';

/// Class encapsulating node traversal through iterations
class IterativeTraversalAlgorithm extends BaseTraversalAlgorithm {
  IterativeTraversalAlgorithm({required Graph graph}) : super(graph: graph);

  @override
  int findWeights(BaseBinaryNode? start) {
    int result = 0;

    if (start == null) {
      return result;
    } else {
      BaseBinaryNode actualNode;
      int actualDepth = 0;
      final queue = Queue<QueueItem>();

      queue.add(QueueItem(node: start, depth: 1));

      while (queue.isNotEmpty) {
        final QueueItem actualItem = queue.removeFirst();

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
