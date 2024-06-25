import 'dart:math';

// Binary Search Tree (BST) Implementation with Concept Explanation

/*
Binary Search Tree Concept:
A Binary Search Tree is a node-based binary tree data structure which has the following properties:
- The left subtree of a node contains only nodes with keys lesser than the node's key.
- The right subtree of a node contains only nodes with keys greater than the node's key.
- The left and right subtree each must also be a binary search tree.
- There must be no duplicate nodes.

Advantages:
- Efficient insertion and deletion (O(log n) for balanced trees)
- In-order traversal gives sorted output
- Efficient searching (O(log n) for balanced trees)

Disadvantages:
- Can become unbalanced, leading to worst-case O(n) operations
- No constant-time access to elements (unlike arrays)

Time Complexity:
- Average: O(log n) for search, insert, delete
- Worst (unbalanced tree): O(n) for search, insert, delete

Space Complexity: O(n) for n nodes
*/

/// ### BinarySearchTree Class
/// Represents a binary search tree data structure.
class BinarySearchTree<T extends Comparable<T>> {
  /// # root
  /// The root node of the binary search tree (may be null for an empty tree).
  Node<T>? root;

  /// Inserts a value into the binary search tree.
  void insert(T value) {
    root = _insertRec(root, value); // Update root after insertion
  }

  /// Recursive helper function for insertion.
  Node<T> _insertRec(Node<T>? node, T value) {
    if (node == null) {
      return Node(value);
    }

    if (value.compareTo(node.value) < 0) {
      node.left = _insertRec(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _insertRec(node.right, value);
    }

    return node;
  }

  /// Checks if a value is contained in the binary search tree.
  bool contains(T value) {
    return _containsRec(root, value);
  }

  /// Recursive helper function for checking containment.
  bool _containsRec(Node<T>? node, T value) {
    if (node == null) {
      return false;
    }

    if (value == node.value) {
      return true;
    }

    if (value.compareTo(node.value) < 0) {
      return _containsRec(node.left, value);
    } else {
      return _containsRec(node.right, value);
    }
  }

  /// Performs an inorder traversal (left, root, right) of the tree.
  void inorderTraversal() {
    _inorderRec(root);
  }

  /// Recursive helper function for inorder traversal.
  void _inorderRec(Node<T>? node) {
    if (node != null) {
      _inorderRec(node.left);
      print(node.value);
      _inorderRec(node.right);
    }
  }

  /// Performs a preorder traversal (root, left, right) of the tree.
  void preorderTraversal() {
    _preorderTraversal(root);
  }

  /// Recursive helper function for preorder traversal.
  void _preorderTraversal(Node<T>? node) {
    if (node == null) {
      return;
    }

    print(node.value);
    _preorderTraversal(node.left);
    _preorderTraversal(node.right);
  }

  /// Performs a postorder traversal (left, right, root) of the tree.
  void postorderTraversal() {
    _postorderTraversal(root);
  }

  /// Recursive helper function for postorder traversal.
  void _postorderTraversal(Node<T>? node) {
    if (node == null) {
      return;
    }

    _postorderTraversal(node.left);
    _postorderTraversal(node.right);
    print(node.value);
  }

  int getHeight() {
    return _getHeightRec(root);
  }

  int _getHeightRec(Node<T>? node) {
    if (node == null) return 0;

    return 1 + max(_getHeightRec(node.left), _getHeightRec(node.right));
  }

  T? findMin() {
    return _minValue(root);
  }

  T? _minValue(Node<T>? node) {
    if (node == null) return null;

    while (node!.left != null) {
      node = node.left;
    }

    return node.value;
  }

  T? findMax() {
    return _maxValue(root);
  }

  T? _maxValue(Node<T>? node) {
    if (node == null) return null;

    while (node!.right != null) {
      node = node.right;
    }

    return node.value;
  }

  void delete(T value) {
    root = _deleteRec(root, value);
  }

  Node<T>? _deleteRec(Node<T>? node, T value) {
    if (node == null) return null;

    if (value.compareTo(node.value) < 0) {
      node.left = _deleteRec(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _deleteRec(node.right, value);
    } else {
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      node.value = _minValue(node.right!)!;
      node.right = _deleteRec(node.right, node.value);
    }

    return node;
  }
}

/// ### Node Class
/// Represents a node in a binary search tree.
class Node<T extends Comparable<T>> {
  /// # The data value stored in this node.
  T value;

  /// # Reference to the left child node (may be null).
  Node<T>? left;

  /// # Reference to the right child node (may be null).
  Node<T>? right;

  Node(this.value, {this.left, this.right});
}
