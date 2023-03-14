abstract class BaseBinaryNode {
  final BaseBinaryNode? left;
  final BaseBinaryNode? right;

  const BaseBinaryNode({this.left, this.right});

  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(BaseBinaryNode? node) => node != null;

  String value();
}
