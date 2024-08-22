def fibonacci_recursive(n: int) -> int:
    """
    Solves fibonacci recurrence relation in O(2^n)
    Note this is not ideal to solve for higher n (for n > 30),
    Since each of f(n - k) term is expanded till n == 1.
    
    ```
    f(n) = f(n - 1) + f(n - 2);    n > 1
         = 1;                      n == 1
         = 0;                      n == 0
    ```
    >>> fibonacci_recursive(6)
    8
    >>> fibonacci_recursive(10)
    55
    """
    return n if n <= 1 else (fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2))

def fibonacci_recursive_2(n: int) -> int:
    """
    Solves fibonacci recurrence relation, significantly faster than the naive method.
    Since each of f(n - k) term is expanded till n == 1.
    
    ```
    f(n) = f(n >> 1) * (f(n >> 1) + 2 * f((n >> 1) - 1));    n > 1, n % 2 == 0
         = f(n - 1) + f(n - 2);                              n > 1, n % 2 == 1
         = 1;                                                n == 1
         = 0;                                                n == 0
    ```
    >>> fibonacci_recursive_2(6)
    8
    >>> fibonacci_recursive_2(10)
    55
    >>> fibonacci_recursive_2(40)
    102334155
    >>> fibonacci_recursive_2(200) == fibonacci_rec_dynamic({}, 200)
    True
    >>> fibonacci_recursive_2(199) == fibonacci_rec_dynamic({}, 199)
    True
    """
    if n <= 1:
        return n
    elif n & 1 == 1:
        fn_2 = fibonacci_recursive_2(n >> 1)
        fn_2_p_1 = fibonacci_recursive_2((n >> 1) + 1)
        return fn_2 ** 2 + fn_2_p_1 ** 2
    
    fn = fibonacci_recursive_2(n >> 1)
    return fn * (2 * fibonacci_recursive_2((n >> 1) - 1) + fn)

def fibonacci_rec_dynamic(memo: dict, n: int) -> int:
    """
    Calculates fibonacci, but has memo to remember calculations.
    Please refer `fibonacci_recursive`. The motive of memo is to 
    calculate once and store it.

    f(n) = f(n - 1) + f(n - 2) iff n > 1

    f(n - 1) is evaluating f(n - 2) and is stored. When f(n - 2) 
    is evaluated it can be retrieved directly from memo, reducing
    the tree calls.

    This is much faster as memo[n] can retrieve in O(1), making overall
    complexity O(n)
    >>> fibonacci_rec_dynamic({}, 20)
    6765
    >>> fibonacci_rec_dynamic({}, 40)
    102334155
    >>> fibonacci_rec_dynamic({}, 100)
    354224848179261915075
    """
    memo[n] = (memo[n] if n in memo else n if n <= 1 else (fibonacci_rec_dynamic(memo, n - 1) + fibonacci_rec_dynamic(memo, n - 2)))
    return memo[n]

def fibonacci_mat_expo(n: int, mod=0) -> int:
    """
    Returns fibonacci in O(logn) time
    
    >>> fibonacci_mat_expo(100, 0)
    354224848179261915075
    >>> fibonacci_mat_expo(100, 1000000007)
    687995182
    >>> fibonacci_mat_expo(199, 0)
    173402521172797813159685037284371942044301
    """
    def mat_mul(a: list, b: list, mod: int) -> list:
        """
        Matrix multiplication of two matrices
        """
        c = []
        rowl_a, coll_a, rowl_b, coll_b = len(a), len(a[0]), len(b), len(b[0])
        assert(coll_a == rowl_b)
        if mod == 0:
            for i in range(rowl_a):
                c += [[sum([a[i][k] * b[k][j] for k in range(rowl_b)]) for j in range(coll_b)]]
    
        else:
            c = [[0 for j in range(coll_b)] for i in range(rowl_a)]
            for i in range(rowl_a):
                for j in range(coll_b):
                    for k in range(rowl_b):
                        c[i][j] += a[i][k] * b[k][j]
                        c[i][j] %= mod
    
        return c

    def mat_expo(a: list, exponent: int, mod: int) -> int:
        """
        Matrix exponentiation, similar to power function, but with mod
        """
        # Identity matrix
        result = [[0 if i != j else 1 for i in range(len(a))] for j in range(len(a))]
        while exponent > 0:
            if exponent & 1:
                result = mat_mul(result, a, mod)
            a = mat_mul(a, a, mod)
            exponent >>= 1
        return result

    fib_mat = [[0, 1], [1, 1]]
    return mat_expo(fib_mat, n, mod)[0][-1]

if __name__ == "__main__":
    from doctest import testmod
    testmod()
