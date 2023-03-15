import 'dart:collection';

import 'package:graphs/algorithms/base/itraversal_algorithm.dart';
import 'package:graphs/data_structs/graphs/base/ibase_graph.dart';
import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/data_structs/queues/queue_item.dart';

/// Implementation of traversing a list of nodes through iterations
class IterativeBinaryNodeTraversal extends ITraversalAlgorithm<IBinaryNode> {
  IterativeBinaryNodeTraversal({required IBaseGraph graph})
      : super(graph: graph);

  /// Traverse each node with recursivity
  /// Returns the number of nodes contained in the shortest path
  @override
  int visitNode(IBinaryNode? currentNode) {
    int result = 0;

    if (currentNode == null) {
      return result;
    } else {
      final queue = Queue<QueueItem>();

      queue.add(QueueItem(node: currentNode, depth: 1));

      IBinaryNode actualNode;
      int actualDepth = 0;

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
