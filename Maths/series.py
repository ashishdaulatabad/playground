def first_n_sum(n: int) -> int:
    """
    Returns the sum of first n positive integers
    >>> first_n_sum(10)
    55
    >>> first_n_sum(100)
    5050
    >>> first_n_sum(9)
    45
    """
    return (n * (n + 1)) >> 1

def first_n_squared_sum(n: int) -> int:
    """
    Returns the sum of first n squared positive integers
    >>> first_n_squared_sum(10)
    385
    >>> first_n_squared_sum(100)
    338350
    >>> first_n_squared_sum(9)
    285
    """
    return (n * (n + 1) * (2 * n + 1)) // 6

def first_n_cubed(n: int) -> int:
    """
    Returns the sum of first n cubed positive integers
    >>> first_n_cubed(8) == sum([i ** 3 for i in range(1, 9)])
    True
    >>> first_n_cubed(10) == sum([i ** 3 for i in range(1, 11)])
    True
    """
    n_2, n_2_p_1 = n ** 2, (n + 1) ** 2
    return (n_2 * n_2_p_1) >> 2

def arith_nth_term(n: int, a: int, d: int) -> int:
    """
    Returns the nth term in arithmetic sequence, a is first term and d is difference between consecutive nth term
    >>> arith_nth_term(10, 1, 1)
    10
    >>> arith_nth_term(20, 2, 3)
    59
    """
    return a + (n - 1) * d

def arith_nth_sum(n: int, a: int, d: int) -> int:
    """
    Returns the first n sum in arithmetic sequence, a is first term and d is difference between consecutive nth term
    >>> arith_nth_sum(10, 1, 1) == sum([i + 1 for i in range(10)])
    True
    >>> arith_nth_sum(20, 2, 3) == sum([2 + 3 * i for i in range(20)])
    True
    """
    return (n * (2 * a + (n - 1) * d)) / 2

def geometric_nth_term(n: int, a: float, r: float) -> float:
    """
    Returns the nth term in geometric sequence, a is first term and d is difference between consecutive nth term
    >>> geometric_nth_term(10, 2, 2) == 2 ** 10
    True
    >>> geometric_nth_term(10, 4, 3) == 4 * (3 ** 9)
    True
    """
    return a * r ** (n - 1)

def geometric_nth_sum(n: int, a: float, r: float) -> float:
    """
    Returns the nth term in geometric sequence, a is first term and d is difference between consecutive nth term
    >>> geometric_nth_sum(10, 2, 2) == sum([2 * (2 ** i) for i in range(10)])
    True
    >>> geometric_nth_sum(10, 4, 3) == sum([4 * (3 ** i) for i in range(10)])
    True
    """
    return a * (r ** n - 1) / (r - 1)

if __name__ == "__main__":
    from doctest import testmod
    testmod()
