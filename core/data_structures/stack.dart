/*
Stack Concept:
A Stack is a linear data structure that follows the LIFO (Last-In, First-Out) principle. 
This means that the last element added to the stack is the first one to be removed.

Key Operations:
- push(item): Adds an item to the top of the stack.
- pop(): Removes and returns the item from the top of the stack.
- peek(): Returns the item at the top of the stack without removing it.
- isEmpty: Checks if the stack is empty.
- size: Returns the number of elements in the stack.

Common Implementations:
- Array-based: Uses a dynamic array (like Dart's List) to store elements.
- Linked List-based: Each element (node) contains data and a reference to the next node.

Time Complexity (Array-based):
- push: O(1) (amortized, due to occasional resizing)
- pop: O(1)
- peek: O(1)
- isEmpty: O(1)
- size: O(1)

Space Complexity: O(n) for n elements

Applications:
- Function call management (call stack)
- Undo/redo operations
- Expression evaluation (e.g., postfix notation)
- Backtracking algorithms
- Browser history
*/

/// ### Stack Class
/// A generic LIFO (Last-In, First-Out) data structure implemented using a Dart List.
///
/// This class provides methods for pushing, popping, peeking, and checking the
/// status of the stack. It allows you to store elements of any type `T`.
class Stack<T> {
  /// The internal list used to store the stack elements.
  final List<T> _items = [];

  /// Pushes the `item` onto the top of the stack.
  void push(T item) {
    _items.add(item);
  }

  /// Pops and returns the top item from the stack.
  ///
  /// Throws an `Exception` if the stack is empty.
  T pop() {
    if (isEmpty) {
      throw Exception("Stack is empty"); // Provide a clear error message
    }
    return _items.removeLast();
  }

  /// Returns the top item from the stack without removing it.
  ///
  /// Throws an `Exception` if the stack is empty.
  T peek() {
    if (isEmpty) {
      throw Exception("Stack is empty");
    }
    return _items.last;
  }

  /// Checks if the stack is empty.
  bool get isEmpty => _items.isEmpty;

  /// Returns the number of elements in the stack.
  int get size => _items.length;

  /// Provides a string representation of the stack (the elements from top to bottom).
  @override
  String toString() => _items.toString(); // Concise syntax using arrow function
}
