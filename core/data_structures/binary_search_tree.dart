import 'dart:math';

/*
Binary Search Tree (BST) Concept:

A Binary Search Tree (BST) is a hierarchical data structure where each node has at most two children. The left child's value is always less than the parent's value, and the right child's value is always greater than the parent's value. This property enables efficient searching, insertion, and deletion operations, often with a time complexity of O(log n) in a balanced tree.

Key Properties:

1. Binary Property: Each node has at most two children (left and right).
2. Search Property: For every node, all keys in its left subtree are smaller, and all keys in its right subtree are larger.

Advantages:

- Efficient Search: In a balanced BST, searching takes O(log n) time on average.
- Sorted Order: In-order traversal produces values in ascending order.
- Dynamic: Efficiently supports insertion and deletion of nodes.

Disadvantages:

- Unbalanced Trees: In the worst case (degenerate tree), operations can become O(n), resembling a linked list.
- No Direct Access: Unlike arrays, there's no constant-time access to elements by index.

Common Operations:

- Insertion: Adds a new node with the given value, maintaining the BST property.
- Searching: Finds a node with a specific value.
- Deletion: Removes a node with a given value while preserving the BST property.
- Traversal (Inorder, Preorder, Postorder): Visits nodes in a specific order.
- Finding Minimum/Maximum: Finds the smallest/largest value in the tree.
- Calculating Height: Determines the longest path from the root to a leaf node.
*/

/// ### Node Class
/// Represents a node in a binary search tree.
class Node<T extends Comparable<T>> {
  /// The data value stored in this node.
  T value;

  /// Reference to the left child node (may be null).
  Node<T>? left;

  /// Reference to the right child node (may be null).
  Node<T>? right;

  /// Creates a new node with the given value.
  Node(this.value, {this.left, this.right});
}

/// ### BinarySearchTree Class
/// Represents a binary search tree data structure.
class BinarySearchTree<T extends Comparable<T>> {
  /// The root node of the binary search tree (may be null for an empty tree).
  Node<T>? root;

  /// Inserts a value into the binary search tree.
  void insert(T value) {
    root = _insertRec(root, value);
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

    return value.compareTo(node.value) < 0
        ? _containsRec(node.left, value)
        : _containsRec(node.right, value);
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

  /// Calculates the height of the binary search tree.
  int getHeight() => _getHeightRec(root); // Using arrow function

  /// Recursive helper function for calculating height.
  int _getHeightRec(Node<T>? node) => node == null
      ? 0
      : 1 +
          max(_getHeightRec(node.left),
              _getHeightRec(node.right)); // Simplified using ternary operator

  /// Finds the minimum value in the tree.
  T? findMin() => _minValue(root); // Using arrow function

  /// Helper function to find the minimum value in a subtree.
  T? _minValue(Node<T>? node) {
    while (node?.left != null) {
      node = node!.left;
    }
    return node?.value;
  }

  /// Finds the maximum value in the tree.
  T? findMax() => _maxValue(root);

  /// Helper function to find the maximum value in a subtree.
  T? _maxValue(Node<T>? node) {
    while (node?.right != null) {
      node = node!.right;
    }
    return node?.value;
  }

  /// Deletes a value from the binary search tree.
  void delete(T value) {
    root = _deleteRec(root, value);
  }

  /// Recursive helper function for deletion.
  Node<T>? _deleteRec(Node<T>? node, T value) {
    if (node == null) return null;

    if (value.compareTo(node.value) < 0) {
      node.left = _deleteRec(node.left, value);
    } else if (value.compareTo(node.value) > 0) {
      node.right = _deleteRec(node.right, value);
    } else {
      // Node to delete found
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      node.value = _minValue(node.right!)!;
      node.right = _deleteRec(node.right, node.value);
    }
    return node;
  }
}
