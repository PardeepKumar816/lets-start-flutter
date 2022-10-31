class Selection {

  // selection sort
  static void sort(List<Comparable> a) { 
    int N = a.length;
    for (int i=0; i<N; i++) {
      int min = i;
      for (int j = i+1; j < N; j++) {
        if (_less(a[j], a[min])) {
          min = j;
        }
      }
      _exch(a, i, min);
      assert(_isSortedInRange(a, 0, i));
    }
    assert(_isSorted(a));
  }
  
  // use a custom order and Comparator interface 
  static void sortWithComparer(List<Object> a, var c) {  
    int N = a.length;
    for (int i=0; i<N; i++) {
      int min = i;
      for (int j = i+1; j < N; j++) {
        if (_lessWithComparer(c, a[j], a[min])) {
          min = j;
        }
      }
      _exch(a, i, min);
      assert(_isSortedInRange(a, 0, i));
    }
    assert(_isSorted(a));
  }
  
  //
  // Helper sorting functions
  // 
  
  // is v < w ?
  static bool _less(Comparable v, Comparable w) {
    return (v.compareTo(w) < 0);
  }
  
  // is v < w ?
  static bool _lessWithComparer(var c, Object v, Object w) {
    return (c.compareTo(v,w) < 0);
  }
  
  // exchange a[i] and a[j] 
  static void _exch(List a, int i, int j) {
    var swap = a[i];
    a[i] = a[j];
    a[j] = swap;
  }
  
  //
  // Check list is sorted - useful for debugging
  //
  // is the list sorted
  static bool _isSorted(List<Comparable> a) {
    return _isSortedInRange(a, 0, a.length-1);
  }
  
  // is the list sorted from a[lo] to a[hi]
  static bool _isSortedInRange(List<Comparable> a, int lo, int hi) {
    for (int i= lo + 1; i <= hi; i++) {
      if (_less(a[i], a[i-1])) {
        return false;
      }
    }
    
    return true;
  }
  
  // is the list sorted from a[lo] to a[hi]
  static bool _isSortedInRangeWithComparer(List<Object> a, var c, int lo, int hi) {
    for (int i = lo + 1; i <= hi; i++) {
      if (_lessWithComparer(c, a[i], a[i-1])) {
        return false;
      }
    }
    
    return true;
  }
  
  // print to standard output
  static show(List<Comparable> a) {
    for (int i = 0; i < a.length; i++) {
      print(a[i]);
    }
  }
}
