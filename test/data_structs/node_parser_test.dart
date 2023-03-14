import 'package:graphs/data_structs/node_parser.dart';
import 'package:test/test.dart';

void main() {
  late String strJson = "";

  setUp(() {
    strJson = """
    [
      {
      "id": "6",
      "name": "Node F",
      "left": null,
      "right": {
        "id": "7",
        "name": "Node G",
        "left": null,
        "right": null
      }
    }
    ]
    """;
  });

  group("NodeParser", () {
    test('When invoking constructor then object created', () async {
      assert(NodeParser() != NodeParser());
    });

    test("When parsing simple nodes then list returned", () {
      final parser = NodeParser();

      final actual = parser.parseSimpleBinaryNodes(strJson);

      expect(actual.length, 1);
    });
  });
}
