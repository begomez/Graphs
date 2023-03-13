abstract class INode {
  final INode? left;
  final INode? right;

  const INode({this.left, this.right});

  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(INode? node) => node != null;

  String value();
}
