import '../data_structures/stack.dart';

class Node {
  final int data;
  List<Node> neighbors;

  Node(this.data, this.neighbors);
}

// Depth-First Search (DFS)
// Recursive
void dfs(Node startNode) {
  // 1. Mark startNode as visited
  // 2. For each neighbor of startNode:
  //    - If the neighbor is not visited, recursively call dfs on the neighbor
  //    - Apply visitCallback (e.g., print node data)

  Set<Node> visited = {};

  void _dfs(Node node) {
    if (visited.contains(node)) {
      return;
    }

    print(node.data);
    visited.add(node);

    for (var neighbor in node.neighbors) {
      _dfs(neighbor);
    }
  }

  _dfs(startNode);
}

// Depth-First Search (DFS)
// Using Stack
void dfs_stack(Node startNode) {
  Stack<Node> stack = Stack();
  Set<Node> visited = {};

  stack.push(startNode);
  visited.add(startNode);

  while (stack.isNotEmpty) {
    var node = stack.pop();
    visited.add(node);

    for (var neighbor in node.neighbors) {
      if (!visited.contains(neighbor)) {
        stack.push(startNode);
        visited.add(startNode);
      }
    }
  }
}

// DFS
void testDFS() {
  // Create nodes
  var node1 = Node(1, []);
  var node2 = Node(2, []);
  var node3 = Node(3, []);
  var node4 = Node(4, []);
  var node5 = Node(5, []);

  // Establish connections (neighbors)
  node1.neighbors = [node2, node3];
  node2.neighbors = [node4, node5];

  print("DFS Traversal:");
  dfs(node1);
}

//        1
//       / \
//      2   3
//     / \
//    4   5

// DFS Traversal:
// 1 2 4 5 3