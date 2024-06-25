/// ### Node Class
/// Represents a node in a binary search tree.
class Node<T extends Comparable<T>> {

    /// # value
    /// The data value stored in this node.
    T value;

    /// # left
    /// Reference to the left child node (may be null).
    Node<T>? left;

    /// # right
    /// Reference to the right child node (may be null).
    Node<T>? right;

    /// Constructor for the Node class.
    /// 
    /// Takes a `value` of type `T` and optional `left` and `right` child nodes.
    Node(this.value, {this.left, this.right}); 
}