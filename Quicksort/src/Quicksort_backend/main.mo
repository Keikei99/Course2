import Array "mo:base/Array";
import Quicksort "Quicksort";

actor {
  // qsort Interface
  public func qsort(arr: [Int]): async [Int] {
    return Quicksort.quicksort(arr);
  };
};
