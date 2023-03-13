import 'dart:collection';

import 'package:graphs/algor/base/traversal_algorithm.dart';
import 'package:graphs/models/graph.dart';
import 'package:graphs/models/queue_item.dart';
import 'package:graphs/models/simple_node.dart';

/// Class encapsulating node traversal through iterations
class IterativeTraversalAlgorithm extends TraversalAlgorithm {
  IterativeTraversalAlgorithm({required Graph graph}) : super(graph: graph);

  @override
  int findWeights(SimpleNode? start) {
    int result = 0;

    if (start == null) {
      return result;
    } else {
      final queue = Queue<QueueItem>();
      queue.add(QueueItem(node: start, depth: 1));

      SimpleNode actualNode;
      int actualDepth = 0;

      while (queue.isNotEmpty) {
        final QueueItem actualItem = queue.removeLast();

        actualNode = actualItem.node;
        actualDepth = actualItem.depth;

        if (actualNode.hasLeft()) {
          queue.add(QueueItem(node: actualNode.left!, depth: actualDepth + 1));
          continue;
        }

        if (actualNode.hasRight()) {
          queue.add(QueueItem(node: actualNode.right!, depth: actualDepth + 1));
          continue;
        }

        if (actualNode.isLeaf()) {
          break;
        }
      }

      return actualDepth;
    }
  }
}
