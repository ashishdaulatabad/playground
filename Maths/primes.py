from intermediate_maths import isqrt

def prime(n: int) -> bool:
    """
    Boolean check whether a number is prime
    >>> prime(2)
    True
    >>> prime(71)
    True
    >>> prime(1001)
    False
    >>> prime(104351)
    False
    >>> prime(104729)
    True
    """
    if n == 1:
        return False
    sqrt_n = isqrt(n)
    # Divisible by 2 check
    if not(n & 1) and n != 2:
        return False

    for testn in range(3, sqrt_n + 1, 2):
        if n % testn == 0:
            return False

    return True

def prime_faster(n: int) -> bool:
    """
    Boolean check whether a number is prime
    >>> prime_faster(2)
    True
    >>> prime_faster(71)
    True
    >>> prime_faster(31)
    True
    >>> prime_faster(32)
    False
    >>> prime_faster(1001)
    False
    >>> prime_faster(104351)
    False
    >>> prime_faster(104729)
    True
    """
    if n == 1:
        return False

    if any([n != x and n % x == 0 for x in [2, 3, 5, 7, 11, 13, 17, 19, 23]]):
        return False
    
    x = 29
    while x * x <= n:
        if n % x == 0 or n % (x + 2) == 0:
            return False
        x += 6

    return True

def sieve_of_eratosthenes(n: int) -> list:
    """
    Note that this generates a list of boolean bytearray where nth 
    bit in bytearray denotes whether n is prime or not
    """
    # Already marked for i = 2
    sieve = bytearray([0b10101100] + ([0b10101010] * ((n + 6) >> 3)))    
    sqrt_n = isqrt(n)

    # For each number < n, 
    # If number is marked as prime (filtered by lambda function)
    # Mark it's multiples to composite
    for number in filter(lambda x: sieve[x >> 3] & (1 << (x & 7)) > 0, range(3, sqrt_n + 1)):
        for (index, mark) in map(lambda x: (x >> 3, x & 7), range(number * number, n + 1, number << 1)):
            sieve[index] &= 255 ^ (1 << mark)

    return sieve

def prime_with_sieve(number_list: list) -> list:
    """
    Return if an integer in the list is prime or not.
    To refer how sieve works, refer sieve_of_eratosthenes function

    >>> prime_with_sieve([2, 11, 22, 33, 41, 68, 97, 8831, 8849, 8850, 1299709])
    [True, True, False, False, True, False, True, True, True, False, True]
    """
    sieve = sieve_of_eratosthenes(max(number_list) + 1)
    return [sieve[number >> 3] & (1 << (number & 7)) > 0 for number in number_list]

def segmented_sieve(left: int, right: int) -> list:
    """
    Generates prime check from left to right
    - Create sieve from 1 to sqrt(right), with primes in the list
    - For each prime in primes list:
        - Get starting value divisible by prime (say st)
        - Mark all the values from st to right (including right) which are divisible 
    by prime.
    """
    upper_limit = isqrt(right)
    sieve = [0 if i % 2 == 0 and i != 2 else 1 for i in range(upper_limit + 1)]
    primes = [2]
    for marker in range(3, upper_limit + 1, 2):
        # If prime
        if sieve[marker] == 1:
            primes.append(marker)
            for mark in range(marker * marker, upper_limit + 1, marker):
                sieve[mark] = 0
    
    seg_sieve = [1] * (right - left + 1)

    """
    Start should be either (prime * prime) if the value lies in the range (left, right),
    else find first value divisible by (prime)
    """
    for prime in primes:
        start, end, skip = max(prime * prime, ((left + prime - 1) // prime) * (prime)), right + 1, prime
        for mark in range(start, end, skip):
            seg_sieve[mark - left] = 0

    if left == 1:
        seg_sieve[1] = 0

    return seg_sieve

def prime_with_segmented_sieve(number_list: list) -> list:
    """
    Calculates the prime within min(number_list) and max(number_list), and evaluates
    primality test for all integers in the list
    >>> prime_with_segmented_sieve([13466917, 20996011, 24036583, 25964952, 30402447, 32582657])
    [1, 1, 1, 0, 0, 1]
    """
    left, right = min(number_list), max(number_list)
    seg_sieve = segmented_sieve(left, right)
    return [seg_sieve[number - left] for number in number_list]

if __name__ == "__main__":
    from doctest import testmod
    testmod()
