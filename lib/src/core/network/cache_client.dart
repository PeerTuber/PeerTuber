class CacheClient {
  final _cache = <String, CacheEntry>{};

  /// Returns the cached value for the given [key] or `null` if the key is not
  /// in the cache.
  T? read<T>(String key) {
    final entry = _cache[key];
    if (entry == null) return null;
    if (entry.expiry != null && entry.expiry!.isBefore(DateTime.now())) {
      _cache.remove(key);
      return null;
    }
    return entry.value as T;
  }

  /// Sets the [value] for the given [key] in the cache.
  void write<T>({required String key, required T value, Duration? expiry}) {
    _cache[key] = CacheEntry(value, expiry);
  }

  /// Removes the value for the given [key] from the cache.
  void remove({required String key}) {
    _cache.remove(key);
  }

  /// Clears the cache.
  void clear() {
    _cache.clear();
  }
}

class CacheEntry {
  final Object? value;
  final DateTime? expiry;

  CacheEntry(this.value, [Duration? expiry])
      : expiry = expiry == null ? null : DateTime.now().add(expiry);
}
