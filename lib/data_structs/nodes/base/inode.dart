import 'package:graphs/data_structs/common/igraph_element.dart';

abstract class INode implements IGraphElement {
  final List<INode>? children;

  const INode(this.children) : super();

  @override
  String value();

  @override
  Map<String, dynamic> toJson();

  @override
  String toString() => "${toJson().toString()}\n";

  @override
  bool isLeaf() => children == null || children!.isEmpty;
}
