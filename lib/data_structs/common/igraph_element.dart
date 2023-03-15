/// General abstraction for any type of node
abstract class IGraphElement {
  String value();
  Map<String, dynamic> toJson();
  @override
  String toString();
  bool isLeaf();
}
