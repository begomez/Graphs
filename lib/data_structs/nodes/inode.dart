abstract class INode {
  final List<INode>? children;

  const INode(this.children) : super();

  String value();

  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  bool isLeaf() => children == null || children!.isEmpty;
}
