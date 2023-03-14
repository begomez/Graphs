import 'dart:collection';

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/data_structs/queues/queue_item.dart';

/// Class encapsulating node traversal through iterations
class IterativeTraversalAlgorithm extends ITraversalAlgorithm {
  IterativeTraversalAlgorithm({required BinaryGraph graph})
      : super(graph: graph);

  @override
  int findWeights(IBinaryNode? start) {
    int result = 0;

    if (start == null) {
      return result;
    } else {
      IBinaryNode actualNode;
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
