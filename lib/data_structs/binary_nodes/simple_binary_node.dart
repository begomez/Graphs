import 'package:graphs/data_structs/binary_nodes/base/base_binary_node.dart';

/// Node with left, right children that stores
/// some primitive props
class SimpleBinaryNode extends BaseBinaryNode {
  final String id;
  final String name;

  const SimpleBinaryNode(
      {required this.id,
      required this.name,
      SimpleBinaryNode? left,
      SimpleBinaryNode? right})
      : super(left: left, right: right);

  factory SimpleBinaryNode.fromJson(Map<String, dynamic> json) =>
      SimpleBinaryNode(
        id: json[_SimpleNodeProps.id],
        name: json[_SimpleNodeProps.name],
        left: json[_SimpleNodeProps.left] != null
            ? SimpleBinaryNode.fromJson(json[_SimpleNodeProps.left])
            : null,
        right: json[_SimpleNodeProps.right] != null
            ? SimpleBinaryNode.fromJson(json[_SimpleNodeProps.right])
            : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        _SimpleNodeProps.id: id,
        _SimpleNodeProps.name: name,
        _SimpleNodeProps.left: hasLeft() ? left!.toJson() : null,
        _SimpleNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "$id $name";

  @override
  String value() => name;
}

class _SimpleNodeProps {
  static final String id = "id";
  static final String name = "name";
  static final String left = "left";
  static final String right = "right";
}
