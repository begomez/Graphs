import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';

/// Concrete implementation of binary node
///
/// It stores some primitive props as data
class SimpleBinaryNode extends IBinaryNode {
  final String id;
  final String name;

  const SimpleBinaryNode(
      {required this.id,
      required this.name,
      IBinaryNode? left,
      IBinaryNode? right})
      : super(left: left, right: right);

  factory SimpleBinaryNode.fromJson(Map<String, dynamic> json) =>
      SimpleBinaryNode(
        id: json[_SimpleBinaryNodeProps.id],
        name: json[_SimpleBinaryNodeProps.name],
        left: json[_SimpleBinaryNodeProps.left] != null
            ? SimpleBinaryNode.fromJson(json[_SimpleBinaryNodeProps.left])
            : null,
        right: json[_SimpleBinaryNodeProps.right] != null
            ? SimpleBinaryNode.fromJson(json[_SimpleBinaryNodeProps.right])
            : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        _SimpleBinaryNodeProps.id: id,
        _SimpleBinaryNodeProps.name: name,
        _SimpleBinaryNodeProps.left: hasLeft() ? left!.toJson() : null,
        _SimpleBinaryNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "$id $name";

  @override
  String value() => name;
}

class _SimpleBinaryNodeProps {
  static final String id = "id";
  static final String name = "name";
  static final String left = "left";
  static final String right = "right";
}
