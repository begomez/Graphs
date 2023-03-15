import 'package:graphs/data_structs/common/igraph_element.dart';

/// Node with 2 optional children: left and right
///
/// Can be included in a graph
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

// Helpers

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(IBinaryNode? node) => node != null;
}
