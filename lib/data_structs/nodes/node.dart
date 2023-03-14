import 'package:graphs/data_structs/nodes/inode.dart';

class Node extends INode {
  final int data;

  const Node(this.data, super.children);

  factory Node.fromJson(Map<String, dynamic> map) {
    List<INode>? children;

    if (map[_NodeProps.children] != null) {
      children = <INode>[];

      map[_NodeProps.children].forEach((json) {
        children!.add(Node.fromJson(json));
      });
    }

    return Node(
      map[_NodeProps.data],
      children,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = {
      _NodeProps.data: data,
    };
    if (children != null) {
      dataMap[_NodeProps.children] =
          children!.map((child) => child.toJson()).toList();
    }
    return dataMap;
  }

  @override
  String value() => data.toString();
}

class _NodeProps {
  static final String data = "data";
  static final String children = "children";
}
