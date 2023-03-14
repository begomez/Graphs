abstract class IBinaryNode {
  final IBinaryNode? left;
  final IBinaryNode? right;

  const IBinaryNode({this.left, this.right});

  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(IBinaryNode? node) => node != null;

  String value();
}
