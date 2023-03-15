import 'package:graphs/data_structs/common/igraph_element.dart';

abstract class IBinaryNode implements IGraphElement {
  final IBinaryNode? left;
  final IBinaryNode? right;

  const IBinaryNode({this.left, this.right});

  @override
  String value();

  @override
  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  @override
  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(IBinaryNode? node) => node != null;
}
