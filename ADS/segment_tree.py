
def build(array: list, combine) -> list:
    """
    Build a segment tree.
    >>> from math import gcd
    >>> build([1, 2, 3, 4, 5, 6, 7, 8], lambda a, b: a + b)
    [36, 10, 26, 3, 7, 11, 15, 1, 2, 3, 4, 5, 6, 7, 8]
    >>> build([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], lambda a, b: a + b)
    [66, 52, 14, 30, 22, 5, 9, 13, 17, 21, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    >>> build([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], lambda a, b: max(a, b))
    [11, 11, 5, 9, 11, 3, 5, 7, 9, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    >>> build([12, 192, 6, 60, 12, 84, 300, 36, 72], lambda a, b: gcd(a, b))
    [6, 6, 12, 12, 6, 12, 12, 36, 12, 192, 6, 60, 12, 84, 300, 36, 72]
    >>> build([12, 192, 6, 60, 12, 84, 300, 36, 72], lambda a, b: a ^ b)
    [494, 166, 328, 96, 198, 48, 376, 108, 12, 192, 6, 60, 12, 84, 300, 36, 72]
    """
    n = len(array)
    seg_tree_array = [0]*(n-1) + list(array)

    for x in range(n-2, -1, -1):
        seg_tree_array[x] = combine(seg_tree_array[(x << 1) + 1], seg_tree_array[(x << 1) + 2])

    return seg_tree_array

def query(seg_tree_array: list, left: int, right: int, n: int, init: int, combine):
    """
    Query on segment tree
    :init is the initial value of result

              36
         10         26
      3     7    11    15
    1  2  3  4  5  6  7  8

    >>> arr = [1, 2, 3, 4, 5, 6, 7, 8]
    >>> sum_f =  lambda a, b: a + b
    >>> seg = build(arr, sum_f)
    >>> seg
    [36, 10, 26, 3, 7, 11, 15, 1, 2, 3, 4, 5, 6, 7, 8]
    >>> query(seg, 2, 5, len(arr), 0, sum_f)
    18
    >>> query(seg, 1, 5, len(arr), 0, sum_f)
    20
    >>> query(seg, 1, 7, len(arr), 0, sum_f)
    35
    >>> query(seg, 0, 5, len(arr), 0, sum_f)
    21
    >>> arr = [12, 192, 6, 60, 12, 84, 300, 36, 72]
    >>> f =  lambda a, b: a ^ b
    >>> seg = build(arr, f)
    >>> seg
    [494, 166, 328, 96, 198, 48, 376, 108, 12, 192, 6, 60, 12, 84, 300, 36, 72]
    >>> query(seg, 2, 5, len(arr), 0, f)
    98
    >>> query(seg, 0, 6, len(arr), 0, f)
    386
    """
    result, left, right, iter = init, left + n - 1, right + n - 1, 0

    while left <= right:
        if not left & 1:
            result = combine(result, seg_tree_array[left])
            left += 1
        if right & 1:
            result = combine(result, seg_tree_array[right])
            right -= 1
        left, right = (left - 1) >> 1, (right - 1) >> 1
        iter += 1

    return result

def update(seg_tree_array: list, n: int, index: int, value: int, combine) -> int:
    """
    Updates the seg tree array
    >>> arr = [12, 192, 6, 60, 12, 84, 300, 36, 72]
    >>> f =  lambda a, b: a ^ b
    >>> seg = build(arr, f)
    >>> seg
    [494, 166, 328, 96, 198, 48, 376, 108, 12, 192, 6, 60, 12, 84, 300, 36, 72]
    >>> query(seg, 2, 5, len(arr), 0, f)
    98
    >>> query(seg, 0, 6, len(arr), 0, f)
    386
    >>> update(seg, len(arr), 2, 24, f)
    >>> seg
    [494, 184, 328, 96, 216, 48, 376, 108, 12, 192, 24, 60, 12, 84, 300, 36, 72]
    >>> query(seg, 0, 6, len(arr), 0, f)
    412
    """
    seg_tree_array[index + n - 1] = value
    index = (index + n - 2) >> 1

    while index > 0:
        seg_tree_array[index] = combine(seg_tree_array[2*index + 1], seg_tree_array[2*index + 2])
        index = (index - 1) >> 1

if __name__ == '__main__':
    from doctest import testmod
    testmod()
