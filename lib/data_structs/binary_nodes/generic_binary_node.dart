import 'package:graphs/data_structs/binary_nodes/base/ibinary_node.dart';
import 'package:graphs/models/icustom_serializable.dart';

/// Concrete implementation of binary node
///
/// It stores a serializable object as data
class GenericBinaryNode<T extends ICustomSerializable> extends IBinaryNode {
  final T data;

  const GenericBinaryNode(
      {required this.data, IBinaryNode? left, IBinaryNode? right})
      : super(left: left, right: right);

  GenericBinaryNode<T> fromJson(Map<String, dynamic> map) =>
      GenericBinaryNode<T>(
        data: data.fromJson(map[_GenericBinaryNodeProps.value]),
        left: map[_GenericBinaryNodeProps.left] != null
            ? fromJson(map[_GenericBinaryNodeProps.left])
            : null,
        right: map[_GenericBinaryNodeProps.right] != null
            ? fromJson(map[_GenericBinaryNodeProps.right])
            : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        _GenericBinaryNodeProps.value: data.toJson(),
        _GenericBinaryNodeProps.left: hasLeft() ? left!.toJson() : null,
        _GenericBinaryNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "${toJson().toString()}\n";

  @override
  String value() => data.toString();
}

class _GenericBinaryNodeProps {
  static final String value = "data";
  static final String left = "left";
  static final String right = "right";
}
