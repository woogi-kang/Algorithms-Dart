import 'dart:collection';

class Node {
  final int data;
  List<Node> neighbors;

  Node(this.data, this.neighbors);
}

// Breadth-First Search (BFS)
void bfs(Node startNode) {
  // 1. Create a queue and enqueue startNode
  // 2. While the queue is not empty:
  //    - Dequeue a node from the queue
  //    - Mark the node as visited
  //    - For each neighbor of the node:
  //       - If the neighbor is not visited, enqueue the neighbor
  //       - Apply visitCallback
  Queue<Node> queue = Queue<Node>();
  Set<Node> visited = {};

  queue.add(startNode);
  visited.add(startNode);

  while (queue.isNotEmpty) {
    var node = queue.removeFirst();
    visited.add(node);

    for (var neighbor in node.neighbors) {
      if (!visited.contains(neighbor)) {
        queue.add(neighbor);
        visited.add(neighbor);
      }
    }
  }
}

// DFS
void testBFS() {
  // Create nodes
  var node1 = Node(1, []);
  var node2 = Node(2, []);
  var node3 = Node(3, []);
  var node4 = Node(4, []);
  var node5 = Node(5, []);

  // Establish connections (neighbors)
  node1.neighbors = [node2, node3];
  node2.neighbors = [node4, node5];

  print("BFS Traversal:");
  bfs(node1);
}


//        1
//       / \
//      2   3
//     / \
//    4   5

// BFS Traversal:
// 1 2 3 4 5 