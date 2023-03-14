import 'package:graphs/data_structs/nodes/inode.dart';
import 'package:graphs/utils/logger.dart';

class NodeTraverser {
  late List<INode> nodes = [];

  Map<String, int> debug = {};

  NodeTraverser() : super();

  void traverse(INode node) {
    int timeStart = DateTime.now().millisecondsSinceEpoch;
    addNodes(node);
    int timeEnd = DateTime.now().millisecondsSinceEpoch;

    Logger.logMsg("Debug: ${debug.toString()}");
    Logger.logMsg("Length: ${nodes.length}");

    nodes.forEach((e) {
      Logger.logMsg(e.value());
    });
    Logger.logMsg("Ellapsed time: ${timeEnd - timeStart} millis");
  }

  void addNodes(INode start) {
    nodes.add(start);

    if (start.isLeaf()) {
      return;
    } else {
      for (var node in start.children!) {
        addNodes(node);
      }
    }
  }
}
