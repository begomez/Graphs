import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/queues/queue_item.dart';
import 'package:test/test.dart';

void main() {
  late BaseBinaryNode node;

  setUp(() {
    node = SimpleBinaryNode(id: "1", name: "Node1");
  });

  group("QueueItem", () {
    test('When creating default obj. then default props are set', () {
      final actual = QueueItem(node: node);

      assert(actual.node == node);
      assert(actual.depth == 0);
    });

    test('When creating custom obj. then custom props are set', () {
      final actual = QueueItem(node: node, depth: 3);

      assert(actual.node == node);
      assert(actual.depth == 3);
    });
  });
}
