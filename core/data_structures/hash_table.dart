// Hash Table Explanation and Implementation

/*
Hash Table Concept:
A hash table is a data structure that implements an associative array abstract data type, 
a structure that can map keys to values. It uses a hash function to compute an index into 
an array of buckets or slots, from which the desired value can be found.

Key Components:
1. Hash Function: Converts keys into array indices.
2. Array: Stores the key-value pairs.
3. Collision Resolution: Handles cases when two keys hash to the same index.

Advantages:
- Fast average-case time complexity for insertions, deletions, and lookups (O(1)).
- Flexible keys (can use strings, numbers, or custom objects as keys).

Disadvantages:
- Possibly poor performance if there are many collisions.
- May require more space than arrays.

In this implementation, we'll use separate chaining for collision resolution.
*/

/// ### HashTable Class
/// A generic hash table implementation using separate chaining for collision resolution.
///
/// This hash table provides efficient insertion, retrieval, and removal of key-value pairs.
/// It dynamically resizes to maintain a reasonable load factor.
class HashTable<K, V> {
  /// The underlying array of buckets (linked lists) for storing key-value pairs.
  late List<HashNode<K, V>?> _buckets;

  /// The current number of key-value pairs in the hash table.
  int _size = 0;

  /// Initial capacity of the hash table.
  static const int _initialCapacity = 16;

  /// Load factor threshold for triggering resizing.
  static const double _loadFactor = 0.75;

  /// Constructs a new HashTable with the default initial capacity.
  HashTable() {
    _buckets = List<HashNode<K, V>?>.filled(_initialCapacity, null);
  }

  /// Inserts a key-value pair into the hash table. If the key already exists, its
  /// associated value is updated.
  void put(K key, V value) {
    int index = _calculateBucketIndex(key);
    HashNode<K, V> newNode = HashNode<K, V>(key, value);

    if (_buckets[index] == null) {
      _buckets[index] = newNode;
      _size++;
    } else {
      HashNode<K, V>? current = _buckets[index];
      while (current != null) {
        if (current.key == key) {
          current.value = value;
          return;
        }
        current = current.next;
      }
      current = _buckets[index];
      while (current?.next != null) {
        current = current!.next;
      }
      current?.next = newNode;
      _size++;
    }

    if (_size >= _buckets.length * _loadFactor) {
      _resize();
    }
  }

  /// Retrieves the value associated with the given `key`. Returns `null` if the
  /// key is not found.
  V? get(K key) {
    int index = _calculateBucketIndex(key);
    HashNode<K, V>? current = _buckets[index];

    while (current != null) {
      if (current.key == key) {
        return current.value;
      }
      current = current.next;
    }
    return null;
  }

  /// Removes a key-value pair with the given `key` from the hash table. Returns
  /// the removed value or `null` if the key is not found.
  V? remove(K key) {
    int index = _calculateBucketIndex(key);
    HashNode<K, V>? current = _buckets[index];
    HashNode<K, V>? prev;

    while (current != null) {
      if (current.key == key) {
        if (prev == null) {
          _buckets[index] = current.next;
        } else {
          prev.next = current.next;
        }
        _size--;
        return current.value;
      }
      prev = current;
      current = current.next;
    }
    return null;
  }

  /// Checks if the hash table contains the given `key`.
  bool contains(K key) {
    return get(key) != null;
  }

  /// Returns the number of key-value pairs in the hash table.
  int size() {
    return _size;
  }

  /// Checks if the hash table is empty.
  bool isEmpty() {
    return _size == 0;
  }

  /// Calculates the bucket index for the given `key`.
  int _calculateBucketIndex(K key) {
    int hashCode = key.hashCode;
    return (hashCode & 0x7FFFFFFF) % _buckets.length; // Bitwise AND for positive index
  }

  /// Resizes the hash table by doubling its capacity and rehashing all existing entries.
  void _resize() {
    List<HashNode<K, V>?> oldBuckets = _buckets;
    _buckets = List<HashNode<K, V>?>.filled(_buckets.length * 2, null);
    _size = 0;

    for (HashNode<K, V>? head in oldBuckets) {
      while (head != null) {
        put(head.key, head.value);
        head = head.next;
      }
    }
  }
}


/// ### HashNode Class
/// Represents a node in a hash table's linked list chain.
class HashNode<K, V> {
  /// The key associated with this node.
  final K key;

  /// The value associated with this node.
  V value;

  /// Reference to the next node in the chain (may be null).
  HashNode<K, V>? next;

  /// Constructs a new HashNode with the given `key` and `value`.
  HashNode(this.key, this.value);
}