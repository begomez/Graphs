/// Binary node containing primitive data types
class SimpleNode {
  final String id;
  final String name;
  final SimpleNode? left;
  final SimpleNode? right;

  const SimpleNode(
      {required this.id, required this.name, this.left, this.right})
      : super();

  factory SimpleNode.fromJson(Map<String, dynamic> json) => SimpleNode(
        id: json[_SimpleNodeProps.id],
        name: json[_SimpleNodeProps.name],
        left: json[_SimpleNodeProps.left] != null
            ? SimpleNode.fromJson(json[_SimpleNodeProps.left])
            : null,
        right: json[_SimpleNodeProps.right] != null
            ? SimpleNode.fromJson(json[_SimpleNodeProps.right])
            : null,
      );

  Map<String, dynamic> toJson() => {
        _SimpleNodeProps.id: id,
        _SimpleNodeProps.name: name,
        _SimpleNodeProps.left: hasLeft() ? left!.toJson() : null,
        _SimpleNodeProps.right: hasRight() ? right!.toJson() : null,
      };

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => !_has(left) && !_has(right);

  bool hasLeft() => _has(left);

  bool hasRight() => _has(right);

  bool _has(SimpleNode? node) => node != null;
}

class _SimpleNodeProps {
  static final String id = "id";
  static final String name = "name";
  static final String left = "left";
  static final String right = "right";
}
