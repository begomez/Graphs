import 'package:graphs/data_structs/graphs/graph.dart';
import 'package:graphs/data_structs/node_parser.dart';
import 'package:graphs/data_structs/nodes/base/inode.dart';
import 'package:graphs/data_structs/nodes/node.dart';
import 'package:graphs/utils/io_utils.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockIOWrapper extends Mock implements IOWrapper {}

class MockNodeParser extends Mock implements NodeParser {}

void main() {
  late NodeParser mockParser;
  late IOWrapper mockWrapper;

  late INode node1;
  late INode node2;
  late INode node3;

  setUp(() {
    mockParser = MockNodeParser();
    mockWrapper = MockIOWrapper();

    ///       1
    ///     /
    ///     2
    ///   /
    ///   3
    node3 = Node(3, null);
    node2 = Node(2, [node3]);
    node1 = Node(1, [node2]);
  });

  group("Graph", () {
    test('When creating obj. then props are set', () {
      final actual = Graph([node1, node2, node3]);

      assert(actual.nodes.contains(node1));
      assert(actual.nodes.contains(node2));
      assert(actual.nodes.contains(node3));
    });

    test('When creating from file then props are set', () {
      when(() => mockWrapper.getFileContents(fileName: any(named: "fileName")))
          .thenReturn("{}");
      when(() => mockParser.parseSimpleNodes(any()))
          .thenReturn([Node(1, null)]);

      final actual =
          Graph.fromFile("fileName", parser: mockParser, wrapper: mockWrapper);

      assert(!actual.isEmpty());
      assert(actual.nodes.length == 1);
      assert(actual.getRootNode().value() == "1");
    });
  });

  group("Graph.accessors", () {
    test('When NOT having nodes then empty', () {
      final actual = Graph([]);

      assert(actual.isEmpty());
    });

    test('When having nodes then is NOT empty', () {
      final actual = Graph([node1, node2, node3]);

      assert(!actual.isEmpty());
    });

    test('When getting root (data) then node returned', () {
      final actual = Graph([node1, node2, node3]);

      assert(actual.getRootNode() == node1);
    });

    test('When getting root (empty) then error', () {
      final actual = Graph([]);

      final action = actual.getRootNode;

      expect(() => action.call(), throwsA(isA<AssertionError>()));
    });

    test("When getting nodes (data) then list returned", () {
      final actual = Graph([node1, node2, node3]);

      expect(actual.getNodes(), [node1, node2, node3]);
    });

    test("When getting nodes (empty) then [] returned", () {
      final actual = Graph([]);

      expect(actual.getNodes(), []);
    });
  });
}
