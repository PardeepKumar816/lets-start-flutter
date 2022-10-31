class MergeSort {

  static void sort(List<Comparable> a) {
    List<Comparable> aux = new List<Comparable>(a.length);
    sortHighLow(a, aux, 0, a.length-1);
    assert(_isSorted(a));
  }
  
  // merge sort a[lo..hi] using auxiliary list aux[lo..hi]
  static void sortHighLow(List<Comparable> a, List<Comparable> aux, int lo, int hi) {
    if (hi <= lo) {
      return;
    }
    
    int mid = lo + ((hi - lo) / 2).toInt();
    sortHighLow(a, aux, lo, mid);
    sortHighLow(a, aux, mid + 1, hi);
    merge(a, aux, lo, mid, hi);
  }
    
  // stably merge a[lo..mid] with a[mid+1..hi] using aux[lo..hi]
  static void merge(List<Comparable> a, List<Comparable> aux, int lo, int mid, int hi) {
    // precondition: a[lo .. mid] and a[mid+1 .. hi] are sorted subarrays
    assert(_isSortedInRange(a, lo, mid));
    assert(_isSortedInRange(a, mid+1, hi));

    // copy to aux[]
    for (int k = lo; k <= hi; k++) {
      aux[k] = a[k];
    }
    
    // merge back to a[]
    int i = lo, j = mid+1;
    for (int k = lo; k <= hi; k++) {
      if (i > mid) {
        a[k] = aux[j++];
      } else if (j > hi) {
        a[k] = aux[i++];
      } else if (_less(aux[j], aux[i])) {
        a[k] = aux[j++];
      } else {
        a[k] = aux[i++];
      }
    }
    
    // postcondition: a[lo .. hi] is sorted
    assert(_isSortedInRange(a, lo, hi));
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
  static void show(List<Comparable> a) {
    for (int i = 0; i < a.length; i++) {
      print(a[i]);
    }
  }
}
