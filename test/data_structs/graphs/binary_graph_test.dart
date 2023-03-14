import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/data_structs/binary_nodes/simple_binary_node.dart';
import 'package:graphs/data_structs/graphs/binary_graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockIOWrapper extends Mock implements IOWrapper {}

class MockNodeParser extends Mock implements NodeParser {}

void main() {
  late NodeParser mockParser;
  late IOWrapper mockWrapper;

  late IBinaryNode node1;
  late IBinaryNode node2;
  late IBinaryNode node3;

  setUp(() {
    mockParser = MockNodeParser();
    mockWrapper = MockIOWrapper();

    ///    1
    ///   /
    ///  2
    ///   \
    ///    3
    node3 = SimpleBinaryNode(id: "3", name: "Node3");
    node2 = SimpleBinaryNode(id: "2", name: "Node2", right: node3);
    node1 = SimpleBinaryNode(id: "1", name: "Node1", left: node2);
  });

  group("BinaryGraph", () {
    test('When creating obj. then props are set', () {
      final actual = BinaryGraph([node1, node2, node3]);

      assert(actual.nodes.contains(node1));
      assert(actual.nodes.contains(node2));
      assert(actual.nodes.contains(node3));
    });

    test('When creating from file then props are set', () {
      when(() => mockWrapper.getFileContents(fileName: any(named: "fileName")))
          .thenReturn("{}");
      when(() => mockParser.parseSimpleBinaryNodes(any()))
          .thenReturn([SimpleBinaryNode(id: "0", name: "Node from JSON")]);

      final actual = BinaryGraph.fromFile("fileName",
          parser: mockParser, wrapper: mockWrapper);

      assert(!actual.isEmpty());
      assert(actual.nodes.length == 1);
      assert(actual.getRootNode().value() == "Node from JSON");
    });
  });

  group("BinaryGraph.accessors", () {
    test('When NOT having nodes then empty', () {
      final actual = BinaryGraph([]);

      assert(actual.isEmpty());
    });

    test('When having nodes then is NOT empty', () {
      final actual = BinaryGraph([node1, node2, node3]);

      assert(!actual.isEmpty());
    });

    test('When getting root (data) then node returned', () {
      final actual = BinaryGraph([node1, node2, node3]);

      assert(actual.getRootNode() == node1);
    });

    test('When getting root (empty) then error', () {
      final actual = BinaryGraph([]);

      final action = actual.getRootNode;

      expect(() => action.call(), throwsA(isA<AssertionError>()));
    });

    test("When getting nodes (data) then list returned", () {
      final actual = BinaryGraph([node1, node2, node3]);

      expect(actual.getNodes(), [node1, node2, node3]);
    });

    test("When getting nodes (empty) then [] returned", () {
      final actual = BinaryGraph([]);

      expect(actual.getNodes(), []);
    });
  });
}
