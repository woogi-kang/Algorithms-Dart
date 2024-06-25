/*
Graph Concept:
A graph is a non-linear data structure consisting of vertices (nodes) connected by edges. It represents relationships between objects or data points. Graphs can be:

- **Directed:** Edges have a specific direction (e.g., a one-way street).
- **Undirected:** Edges have no direction (e.g., a friendship).
- **Weighted:** Edges have associated values or weights (e.g., distance between cities).
- **Unweighted:** Edges have no associated values.

Graph Terminology:
- **Vertex:** A data point in a graph.
- **Edge:** A connection between two vertices.
- **Neighbor:** Two vertices connected by an edge.
- **Path:** A sequence of edges connecting two vertices.
- **Cycle:** A path that starts and ends at the same vertex.
- **Connected Graph:** A graph where there is a path between any two vertices.
- **Tree:** A connected graph with no cycles.

Key Graph Representations:
- **Adjacency List:** Each vertex stores a list of its neighbors. (Efficient for sparse graphs)
- **Adjacency Matrix:** A 2D matrix where each cell indicates whether an edge exists between two vertices. (Efficient for dense graphs)

Advantages:
- Flexible modeling of relationships between data.
- Can represent a wide range of real-world problems (networks, maps, social connections).
- Supports various algorithms for traversal, search, and optimization.

Time Complexity (Depends on representation and operation):
- Add Vertex: O(1) (Adjacency List), O(1) (Adjacency Matrix)
- Add Edge: O(1) (Adjacency List), O(1) (Adjacency Matrix)
- Remove Vertex: O(|V| + |E|) (Adjacency List), O(|V|^2) (Adjacency Matrix)
- Remove Edge: O(|E|) (Adjacency List), O(1) (Adjacency Matrix)
- Querying Neighbors: O(|E|) (Adjacency List), O(|V|) (Adjacency Matrix)

Space Complexity:
- Adjacency List: O(|V| + |E|)
- Adjacency Matrix: O(|V|^2)

Applications:
- Network routing and analysis
- Social network analysis
- Transportation and mapping systems
- Recommendation systems
- Circuit design
- Artificial intelligence and machine learning
- And many more!
*/

/// ### Graph Class
/// Represents a generic graph data structure with vertices of type `T`.
class Graph<T extends Comparable> {
  /// Adjacency list representation of the graph.
  /// Each vertex is associated with a list of its neighbors.
  final Map<T, List<T>> _adjacencyList = {};

  /// Creates an empty graph.
  Graph();

  /// Adds a new vertex to the graph.
  void addVertex(T vertex) {
    _adjacencyList[vertex] = [];
  }

  /// Adds an edge between `vertex1` and `vertex2`.
  /// If `isDirected` is true, the edge is directed from `vertex1` to `vertex2`.
  /// Otherwise, it creates an undirected edge.
  void addEdge(T vertex1, T vertex2, {bool isDirected = false}) {
    _adjacencyList[vertex1]!.add(vertex2);
    if (!isDirected) {
      _adjacencyList[vertex2]!.add(vertex1);
    }
  }

  /// Returns a list of neighbors for the given `vertex`.
  List<T>? getNeighbors(T vertex) {
    return _adjacencyList[vertex];
  }

  /// Checks if there is an edge between `vertex1` and `vertex2`.
  bool hasEdge(T vertex1, T vertex2) {
    return _adjacencyList[vertex1]?.contains(vertex2) ?? false;
  }

  /// Removes a vertex and all its associated edges from the graph.
  void removeVertex(T vertex) {
    _adjacencyList.remove(vertex);
    for (var neighbors in _adjacencyList.values) {
      neighbors.remove(vertex);
    }
  }

  /// Removes the edge between `vertex1` and `vertex2`.
  /// If the graph is directed, only the edge from `vertex1` to `vertex2` is removed.
  void removeEdge(T vertex1, T vertex2, {bool isDirected = false}) {
    _adjacencyList[vertex1]!.remove(vertex2);
    if (!isDirected) {
      _adjacencyList[vertex2]!.remove(vertex1);
    }
  }

  /// Returns a string representation of the adjacency list.
  @override
  String toString() {
    return _adjacencyList.toString();
  }
}
