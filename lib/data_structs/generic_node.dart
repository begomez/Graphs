import 'package:graphs/models/iserial.dart';

/// Binary node containing a generic data type T
class GenericNode<T extends ISerial> {
  final T value;
  final GenericNode<T>? left;
  final GenericNode<T>? right;

  const GenericNode({required this.value, this.left, this.right}) : super();

  GenericNode<T> fromJson(Map<String, dynamic> map) => GenericNode<T>(
        value: value.fromJson(map[_GenericNodeProps.value]),
        left: map[_GenericNodeProps.left] != null
            ? fromJson(map[_GenericNodeProps.left])
            : null,
        right: map[_GenericNodeProps.right] != null
            ? fromJson(map[_GenericNodeProps.right])
            : null,
      );

  Map<String, dynamic> toJson() => {
        _GenericNodeProps.value: value.toJson(),
        _GenericNodeProps.left: hasLeft() ? left!.toJson() : null,
        _GenericNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(GenericNode? node) => node != null;
}

class _GenericNodeProps {
  static final String value = "value";
  static final String left = "left";
  static final String right = "right";
}
