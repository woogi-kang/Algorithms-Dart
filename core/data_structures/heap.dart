/*
Heap Concept:
A Heap is a specialized tree-based data structure that satisfies the heap property:
- In a max heap, for any given node C, if P is a parent node of C, then the key (value) 
  of P is greater than or equal to the key of C.
- In a min heap, the key of P is less than or equal to the key of C.

The heap is one maximally efficient implementation of an abstract data type called 
a priority queue, and in fact, priority queues are often referred to as "heaps", 
regardless of how they may be implemented.

Key Characteristics:
1. Shape Property: A heap is a complete binary tree; all levels are fully filled 
   except possibly the last level, which is filled from left to right.
2. Heap Property: All nodes are either greater than or equal to (max-heap) or less 
   than or equal to (min-heap) each of its children.

Advantages:
- Efficient insertion and deletion operations (O(log n))
- Constant time (O(1)) retrieval of the maximum element (for max heap)
- Efficient implementation of priority queues

Time Complexity:
- Insert: O(log n)
- Delete max: O(log n)
- Get max: O(1)
- Heapify: O(n)

Space Complexity: O(n) for n elements

Applications:
- Priority Queues
- Scheduling algorithms
- Graph algorithms like Dijkstra's shortest path
- Heap Sort
*/

/// ### MaxHeap Class
/// Represents a max-heap data structure, where the parent node is always greater than or equal to its children.
class MaxHeap {
  /// The internal list representation of the heap.
  List<int> _heap = [];

  /// Creates an empty max-heap.
  MaxHeap();

  /// Creates a max-heap from an existing list of integers.
  MaxHeap.fromList(List<int> list) {
    _heap = List.from(list); // Initialize with a copy of the list
    _buildHeap(); // Construct the heap structure
  }

  /// Builds a max-heap from the current elements in the internal list.
  void _buildHeap() {
    // Start from the last non-leaf node and heapify down.
    for (int i = (_heap.length ~/ 2) - 1; i >= 0; i--) {
      _heapifyDown(i);
    }
  }

  /// Inserts a new `value` into the max-heap.
  void insert(int value) {
    _heap.add(value);
    _heapifyUp(_heap.length - 1); // Restore heap property after insertion
  }

  /// Extracts and returns the maximum value (root) from the max-heap.
  int? extractMax() {
    if (_heap.isEmpty) return null; // Handle empty heap
    if (_heap.length == 1) return _heap.removeLast();

    int max = _heap[0];
    _heap[0] = _heap.removeLast(); // Replace root with last element
    _heapifyDown(0); // Restore heap property after extraction

    return max;
  }

  /// Returns the maximum value (root) of the max-heap without removing it.
  int? getMax() =>
      _heap.isEmpty ? null : _heap[0]; // Simplified using ternary operator

  /// Restores the max-heap property by swapping a node with its parent
  /// until the max-heap property is satisfied. (Used after insertion).
  void _heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_heap[parentIndex] >= _heap[index]) {
        break; // Max-heap property is satisfied
      }
      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  /// Restores the max-heap property by swapping a node with its larger child
  /// until the max-heap property is satisfied. (Used after extraction).
  void _heapifyDown(int index) {
    int maxIndex = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < _heap.length && _heap[leftChild] > _heap[maxIndex]) {
      maxIndex = leftChild;
    }

    if (rightChild < _heap.length && _heap[rightChild] > _heap[maxIndex]) {
      maxIndex = rightChild;
    }

    if (index != maxIndex) {
      _swap(index, maxIndex);
      _heapifyDown(maxIndex);
    }
  }

  /// Swaps the elements at indices `i` and `j` in the internal list.
  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }

  /// Returns the number of elements in the max-heap.
  int size() => _heap.length; // Concise syntax using arrow function

  /// Checks if the max-heap is empty.
  bool isEmpty() => _heap.isEmpty; // Concise syntax using arrow function

  /// Prints the elements of the heap in list format.
  void printHeap() {
    print(_heap);
  }
}

/*
Key Points:
1. Heap Property: In a max heap, the parent is always greater than or equal to its children.
2. Array Representation: Heaps are typically implemented using arrays, where for an element 
   at index i:
   - Its left child is at index 2i + 1
   - Its right child is at index 2i + 2
   - Its parent is at index (i - 1) / 2
3. Insertion: New elements are added at the end and then "bubbled up" to their correct position.
4. Extraction: The root (maximum element) is removed, replaced by the last element, 
   and then "bubbled down" to its correct position.
5. Heapify: The process of converting an arbitrary array into a heap structure.
6. Applications: Heaps are fundamental in algorithms like HeapSort, in implementing 
   priority queues, and in graph algorithms like Dijkstra's shortest path.
*/
