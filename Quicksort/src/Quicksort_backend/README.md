# Course 2  QuickSort

第二课作业

## Motoko代码

```Motoko
/* Quicksort.mo */
import Array "mo:base/Array";
import Int "mo:base/Int";

module Quicksort {
    public func quicksort(arr: [Int]): [Int] {
        if (arr.size() < 2) {
            return arr;
        } else {
            let result = Array.thaw<Int>(arr);
            quicksortDetailed(result, 0, arr.size() - 1);
            return Array.freeze<Int>(result);
        };
    };

    // The detailed part of the quicksort function
    private func quicksortDetailed(
        arr: [var Int], 
        _left: Int,
        _right: Int
    ) {
        if (_left >= _right) {
            return;
        } else {
            var i: Int = _left;
            var j: Int = _right;
            var swap: Int = arr[0];
            var middle: Int = arr[Int.abs(_left + _right) / 2];
            while (i <= j) {
                while (arr[Int.abs(i)] < middle) {
                    i += 1;
                };
                while (arr[Int.abs(j)] > middle) {
                    j -= 1;
                };
                if (i <= j) {
                    swap := arr[Int.abs(i)];
                    arr[Int.abs(i)] := arr[Int.abs(j)];
                    arr[Int.abs(j)] := swap;
                    i += 1;
                    j -= 1;
                };
            };
            if (j > _left) {
                quicksortDetailed(arr, _left, j);
            };
            if (i < _right) {
                quicksortDetailed(arr, i, _right);
            };
        };
    };
};
```

```Motoko
/* main.mo */
import Array "mo:base/Array";
import Quicksort "Quicksort";

actor {
  // qsort Interface
  public func qsort(arr: [Int]): async [Int] {
    return Quicksort.quicksort(arr);
  };
};

```

## 样例测试

在Candid中输入[6, 5, 4, 3, 2, 1]，查看排序结果

![image-20220911145422607.png](.\image-20220911145422607.png)

输出[1, 2, 3, 4, 5, 6]。
