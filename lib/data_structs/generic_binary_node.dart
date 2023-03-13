import 'package:graphs/models/iserial.dart';

/// Node with left, right children that stores
/// a serializable object
class GenericBinaryNode<T extends ISerial> {
  final T value;
  final GenericBinaryNode<T>? left;
  final GenericBinaryNode<T>? right;

  const GenericBinaryNode({required this.value, this.left, this.right})
      : super();

  GenericBinaryNode<T> fromJson(Map<String, dynamic> map) =>
      GenericBinaryNode<T>(
        value: value.fromJson(map[_GenericBinaryNodeProps.value]),
        left: map[_GenericBinaryNodeProps.left] != null
            ? fromJson(map[_GenericBinaryNodeProps.left])
            : null,
        right: map[_GenericBinaryNodeProps.right] != null
            ? fromJson(map[_GenericBinaryNodeProps.right])
            : null,
      );

  Map<String, dynamic> toJson() => {
        _GenericBinaryNodeProps.value: value.toJson(),
        _GenericBinaryNodeProps.left: hasLeft() ? left!.toJson() : null,
        _GenericBinaryNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(GenericBinaryNode? node) => node != null;
}

class _GenericBinaryNodeProps {
  static final String value = "value";
  static final String left = "left";
  static final String right = "right";
}
