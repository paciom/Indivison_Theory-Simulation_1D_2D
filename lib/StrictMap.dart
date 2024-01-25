class StrictMap<K, V> {
  final Map<K, V> _map = {};

  void add(K key, V value) {
    _map[key] = value;
  }

  V? get(int key) => _map[key];
}
