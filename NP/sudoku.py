import math
from doctest import testmod
from itertools import tee, chain
from time import time
from functools import reduce

def sudoku(board: list[list[int]]) -> list[list[int]]:
    """
    Solves the 9x9 sudoku puzzle for you.

    Will return puzzle as it is if it does not find any solution.

    Solution for this is verifiable in `O(n^2)` where `n` is size
    of the board `(here 9x9 = 9^2 = 81)`.

    >>> sudoku([[5, 3, 0, 0, 7, 0, 0, 0, 0], [6, 0, 0, 1, 9, 5, 0, 0, 0], [0, 9, 8, 0, 0, 0, 0, 6, 0], [8, 0, 0, 0, 6, 0, 0, 0, 3], [4, 0, 0, 8, 0, 3, 0, 0, 1], [7, 0, 0, 0, 2, 0, 0, 0, 6], [0, 6, 0, 0, 0, 0, 2, 8, 0], [0, 0, 0, 4, 1, 9, 0, 0, 5], [0, 0, 0, 0, 8, 0, 0, 7, 9]])
    [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    """
    n = len(board)
    n_2 = n << 1
    sqrt_n = math.ceil(math.sqrt(n))
    # print(n, sqrt_n)
    hash = [0 for _ in range(n)]
    for rindex, row in enumerate(board):
        for cindex, element in filter(lambda elem: elem[1] != 0, enumerate(row)):
            hash[rindex] |= (1 << element)
            hash[cindex] |= (1 << (element + n))
            hash[(rindex // sqrt_n) * sqrt_n + (cindex // sqrt_n)] |= (1 << (element + n_2))

    not_present_in_row = lambda hash, i, value: (hash[i] & (1 << value)) == 0
    not_present_in_col = lambda hash, i, value: (hash[i] & (1 << (value + n))) == 0
    not_present_in_nxn = lambda hash, rindex, cindex, value: \
        (hash[(rindex // sqrt_n) * sqrt_n + (cindex // sqrt_n)] & (1 << (value + n_2))) == 0

    def solve(board: list, hash: list, rindex: int, cindex: int) -> bool:
        """
        Solving sudoku board. Returns `True` if one solution exists for the
        board, else returns `False`

        Follows recursion:
        - If all values are visited (rindex == 9), then all values are
        successfully placed (This makes assumptions that the values are carefully
        selected and assigned)
        - Else we'll go one by one by selecting each value from each row:
            - If there are no elements in row, select next row and see if current
            setup can yield result
            - If there is a value already assigned, then move to next element
            - Otherwise we'll have to make trial for each values from 1 to 9:
                - If there isn't any value equal to itself in same row, column or
                in 3x3 row, then
                    - Mark the existence of this value in the row, column and 3x3 grid
                    for future calculation, and assign the value to the board
                    - If this step yields correct solution, then return True, else
                    erase value from board as well as existence of value from row, col
                    and 3x3 grid
        - None of this steps worked, return False
        """
        if rindex >= n:
            return True
        elif cindex >= n:
            if solve(board, hash, rindex + 1, 0):
                return True
        elif board[rindex][cindex] > 0:
            if solve(board, hash, rindex, cindex + 1):
                return True
        else:
            for value in range(1, n + 1):
                if not_present_in_row(hash, rindex, value) and \
                   not_present_in_col(hash, cindex, value) and \
                   not_present_in_nxn(hash, rindex, cindex, value):
                    hash[rindex] |= (1 << value)
                    hash[cindex] |= (1 << (value + n))
                    hash[(rindex // sqrt_n) * sqrt_n + (cindex // sqrt_n)] |= (1 << (value + n_2))
                    board[rindex][cindex] = value

                    # Check if after placing `value`, and solving next yields a solution
                    # Otherwise remove the values
                    if solve(board, hash, rindex, cindex + 1):
                        return True
                    else:
                        hash[rindex] ^= (1 << value)
                        hash[cindex] ^= (1 << (value + n))
                        hash[(rindex // sqrt_n) * sqrt_n + (cindex // sqrt_n)] ^= (1 << (value + n_2))
                        board[rindex][cindex] = 0
        return False

    solve(board, hash, 0, 0)
    return board

def sudoku_greedy(board: list[list[int]]) -> list[list[int]]:
    """
    Approach: Greedy selection of cells: Select cells that has fewer possibities first, and go from there.
    In General Case, puzzles are usually constructed so that users can solve first few cells
    and evaluate all the effects on other neighboring rows, columns and squares
    after filling these values.

    Unpacking them one-by-one is the fastest way to solve all of these puzzles.

    # Note: This method can be implemented more efficiently than it currently is
    >>> board = [[5, 3, 0, 0, 7, 0, 0, 0, 0], [6, 0, 0, 1, 9, 5, 0, 0, 0], [0, 9, 8, 0, 0, 0, 0, 6, 0], [8, 0, 0, 0, 6, 0, 0, 0, 3], [4, 0, 0, 8, 0, 3, 0, 0, 1], [7, 0, 0, 0, 2, 0, 0, 0, 6], [0, 6, 0, 0, 0, 0, 2, 8, 0], [0, 0, 0, 4, 1, 9, 0, 0, 5], [0, 0, 0, 0, 8, 0, 0, 7, 9]]
    >>> sudoku_greedy(board)
    [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7], [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6], [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    >>> sudoku_greedy(board) == sudoku(board)
    True
    """
    n = len(board)
    n_2 = n << 1
    sqrt_n = math.ceil(math.sqrt(n))
    h = [0] * n
    not_present_in_row = lambda i, value: (h[i] & (1 << value)) == 0
    not_present_in_col = lambda i, value: (h[i] & (1 << (value + n))) == 0
    not_present_in_nxn = lambda r, c, value: (h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] & (1 << (value + n_2))) == 0
    # square_index = lambda r, c: (r // sqrt_n) * sqrt_n + (c // sqrt_n)

    for rindex, row in enumerate(board):
        for cindex, element in filter(lambda elem: elem[1] != 0, enumerate(row)):
            h[rindex] |= (1 << element)
            h[cindex] |= (1 << (element + n))
            h[(rindex // sqrt_n) * sqrt_n + (cindex // sqrt_n)] |= (1 << (element + n_2))

    get_possible_values = lambda hvalue: [x for x in range(1, n + 1) if ((1 << x) & hvalue) == 0]
    possible_v_list = []

    def init_possible_list_of_values(board: list[list[int]]) -> list[tuple[int, int, list[int]]]:
        """
        Naive implementation; gets all empty cells and mark their possible values.
        """
        possible_values_list = []
        for r, row in enumerate(board):
            for c, _ in filter(lambda elem: elem[1] == 0, enumerate(row)):
                hvalue = h[r] | (h[c] >> n) | (h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] >> (n_2))
                possible_values_list.append((r, c, get_possible_values(hvalue)))

        return possible_values_list

    def get_all_possible_list_of_values(
        possible_val_init: list[tuple[int, int, list[int]]],
        optimize = False
    ) -> list[tuple[int, int, list[int]]]:
        """
        Naive implementation; gets all empty cells and mark their possible values.
        """
        possible_values_list = []
        for r, c, p in filter(lambda x: board[x[0]][x[1]] == 0, possible_val_init):
            hvalue = h[r] | (h[c] >> n) | (h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] >> (n_2))
            possible = get_possible_values(hvalue)

            if len(possible) > 0:
                possible_values_list.append((r, c, list(set(p).intersection(possible))))

        if optimize:
            possible_values_list = reduce_possible_values(possible_values_list)

        return possible_values_list

    def solve_rows(possible_v_list: list[tuple[int, int, list[int]]]) -> list[tuple[int, int, list[int]]]:
        """
        Solve cell by checking if all the values are unique in the row
        """
        for r, c, possible_v in possible_v_list:
            rpindex = [(x, c) for x in range(n) if (x != r and board[x][c] == 0)]
            possible_empty_cells = reduce(
                lambda set_, v_: set_.union(v_),
                map(lambda x: x[2], filter(lambda pair: (pair[0], pair[1]) in rpindex, possible_v_list)),
                set()
            )
            possible = list(filter(lambda elem: elem not in possible_empty_cells, possible_v))

            if len(possible) == 1:
                element = possible[0]
                board[r][c] = element
                h[r] |= (1 << element)
                h[c] |= (1 << (element + n))
                h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] |= (1 << (element + n_2))

        return sorted(get_all_possible_list_of_values(possible_v_list, True), key=lambda f: len(f[2]))

    def solve_cols(possible_v_list: list[tuple[int, int, list[int]]]) -> list[tuple[int, int, list[int]]]:
        """
        Solve cell by checking if all the values are unique in the column
        """
        for r, c, possible_v in possible_v_list:
            rpindex = [(r, x) for x in range(n) if (x != c and board[r][x] == 0)]
            possible_empty_cells = reduce(
                lambda set_, v_: set_.union(v_),
                map(lambda x: x[2], filter(lambda pair: (pair[0], pair[1]) in rpindex, possible_v_list)),
                set()
            )
            possible = list(filter(lambda elem: elem not in possible_empty_cells, possible_v))
            if len(possible) == 1:
                element = possible[0]
                board[r][c] = element
                h[r] |= (1 << element)
                h[c] |= (1 << (element + n))
                h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] |= (1 << (element + n_2))

        return sorted(get_all_possible_list_of_values(possible_v_list, True), key=lambda f: len(f[2]))

    def solve_squares(possible_v_list: list[tuple[int, int, list[int]]]) -> list[tuple[int, int, list[int]]]:
        """
        Solve cell by checking if all the values are unique in the boxes
        """
        for r, c, possible_v in possible_v_list:
            rsi, csi = (r // sqrt_n), (c // sqrt_n)
            sr, er, sc, ec = rsi * sqrt_n, (rsi + 1) * sqrt_n, csi * sqrt_n, (csi + 1) * sqrt_n
            rpindex = [(x, y) for x in range(sr, er) for y in range(sc, ec) if (not((x == r) and (y == c)) and board[x][y] == 0)]
            possible_empty_cells = reduce(
                lambda set_, v_: set_.union(v_),
                map(lambda x: x[2], filter(lambda pair: (pair[0], pair[1]) in rpindex, possible_v_list)),
                set()
            )

            possible = list(filter(lambda elem: elem not in possible_empty_cells, possible_v))

            if len(possible) == 1:
                element = possible[0]
                board[r][c] = element
                h[r] |= (1 << element)
                h[c] |= (1 << (element + n))
                h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] |= (1 << (element + n_2))

        return sorted(get_all_possible_list_of_values(possible_v_list, True), key=lambda f: len(f[2]))

    def reduce_possible_values(
        possible_v_list: list[tuple[int, int, list[int]]]
    ) -> list[tuple[int, int, list[int]]]:
        """
        If any `n x n` block has only one row/col with one particular element and not present in other row/col,
        then filter out those possibilities from rest of the cells in the same row/col outside `sqrt(n) x sqrt(n)` block
        """
        for bx in range(sqrt_n):
            for by in range(sqrt_n):
                rs, re, cs, ce = tuple(x * sqrt_n for x in [bx, bx + 1, by, by + 1])

                empty_cell_indexes = list(filter(lambda p: rs <= p[0] < re and cs <= p[1] < ce, possible_v_list))
                rem_values = reduce(lambda set_, v_: set_.union(v_), map(lambda x: x[2], empty_cell_indexes), set())

                for elem in rem_values:
                    # Duplicate the iterators
                    first, second = tee(filter(lambda x: elem in x[2], empty_cell_indexes))

                    filtered_values = list(map(lambda x: x[0], first))
                    if filtered_values and filtered_values.count(filtered_values[0]) == len(filtered_values):
                        clearing_row = filtered_values[0]
                        possible_v_list = list(
                            chain(filter(
                                lambda x: not(x[0] == clearing_row and not(cs <= x[1] < ce)),
                                possible_v_list
                            ), map(
                                lambda x: (*x[:2], list(filter(lambda v: v != elem, x[2]))),
                                filter(
                                    lambda x: x[0] == clearing_row and not(cs <= x[1] < ce),
                                    possible_v_list
                                )
                            ))
                        )

                    filtered_values = list(map(lambda x: x[1], second))
                    if filtered_values and filtered_values.count(filtered_values[0]) == len(filtered_values):
                        clearing_col = filtered_values[0]
                        possible_v_list = list(
                            chain(filter(
                                lambda x: not(x[1] == clearing_col and not(rs <= x[0] < re)),
                                possible_v_list
                            ), map(
                                lambda x: (*x[:2], list(filter(lambda v: v != elem, x[2]))),
                                filter(
                                    lambda x: x[1] == clearing_col and not(rs <= x[0] < re),
                                    possible_v_list
                                )
                            )
                        ))

        return possible_v_list

    def solve_greedy(board: list, index: int) -> bool:
        if index >= len(possible_v_list):
            return True
        else:
            r, c, possible_values = possible_v_list[index]
            for v in possible_values:
                if not_present_in_row(r, v) and not_present_in_col(c, v) and not_present_in_nxn(r, c, v):
                    h[r] |= (1 << v)
                    h[c] |= (1 << (v + n))
                    h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] |= (1 << (v + n_2))
                    board[r][c] = v

                    if solve_greedy(board, index + 1):
                        return True
                    else:
                        h[r] ^= (1 << v)
                        h[c] ^= (1 << (v + n))
                        h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] ^= (1 << (v + n_2))
                        board[r][c] = 0
        return False

    possible_v_list = sorted(init_possible_list_of_values(board), key=lambda f: len(f[2]))
    solved = True

    # Solve board until it can't be solved by below tricks
    # Rest by brute force.
    while len(possible_v_list) > 0:
        for r, c, possible_v in filter(lambda x: len(x[2]) <= 1, possible_v_list):
            if len(possible_v) == 0:
                print("Not possible, no combination for", r, c)
                return board
            else:
                element = possible_v[0]
                board[r][c] = element
                h[r] |= (1 << element)
                h[c] |= (1 << (element + n))
                h[(r // sqrt_n) * sqrt_n + (c // sqrt_n)] |= (1 << (element + n_2))

        # Sort by least number of possible values
        next_values = sorted(get_all_possible_list_of_values(possible_v_list), key=lambda f: len(f[2]))
        if not(next_values == possible_v_list and len(possible_v_list) > 0):
            possible_v_list = next_values
            continue

        next_values = solve_squares(possible_v_list)
        if not(next_values == possible_v_list and len(possible_v_list) > 0):
            possible_v_list = next_values
            continue

        next_values = solve_rows(possible_v_list)
        if not(next_values == possible_v_list and len(possible_v_list) > 0):
            possible_v_list = next_values
            continue

        next_values = solve_cols(possible_v_list)
        if not(next_values == possible_v_list and len(possible_v_list) > 0):
            possible_v_list = next_values
        else:
            solved = False
            break

    rem_label_counts = [0] + [n - sum([row.count(x) for row in board]) for x in range(1, n+1)]

    if not solved:
        possible_v_list = sorted(get_all_possible_list_of_values(possible_v_list, True), key=lambda x: len(x[2]))
        possible_v_list = list(map(lambda x: (*x[:2], sorted(x[2], key=lambda e: rem_label_counts[e])), possible_v_list))
        print(rem_label_counts, reduce(lambda prev, crr: prev * crr, filter(lambda x: x > 0, rem_label_counts)))
        p = solve_greedy(board, 0)
        if not p:
            print("No solution")

    return board

def transform_str_board(string: str, substitute: dict[str, int], is_csv=False, shift=False) -> list[list[int]]:
    """
    Convert board of string to `list[list[int]]`
    """
    board_repr = None
    if is_csv:
        board_repr = list(map(lambda row_str: map(lambda c: '.' if len(c) == 0 else c, row_str.split(',')), string.strip().split('\n')))
    else:
        board_repr = list(map(lambda row_str: list(row_str.strip()), string.strip().split('\n')))

    if shift:
        return list(map(lambda row: list(map(lambda ch: (substitute[ch] + 10) if ord(ch) > ord('9') else 0 if ch == '.' else (ord(ch) - ord('0')), row)), board_repr))
    return list(map(lambda row: list(map(lambda ch: substitute[ch], row)), board_repr))

if __name__ == "__main__":
    testmod()
    board16 = """
    -L--AB---PCI--G-
    --DA--HKF-NM-J-B
    O-B-NI--E---KA-C
    ---J-MCEAK-B-I--
    NK---------EJH--
    --CG-LK--OF-B-A-
    ---M--FJ-AIGOL--
    --L-E--C-JM-----
    M-FC----D-O-I-J-
    -DJO---N-H-LP-E-
    BA-I----CMEP-F--
    L--P-EAI----CMHD
    FG---P-M-E---O-H
    -P--ICL-MF--A-KJ
    K----AGDB--O--N-
    -B-NF---KL---GIP
    """
    substitute = { chr(value): value - ord('A') + 1 for value in range(ord('A'), ord('Z') + 1) }
    substitute['-'] = substitute['.'] = 0
    board16_repr = transform_str_board(board16, substitute)
    c = time()
    naive = sudoku([x[:] for x in board16_repr])
    print(f'Naive 16x16: {time() - c}s')
    c = time()
    faster = sudoku_greedy(board16_repr)
    print(f'Faster 16x16: {time() - c}s')
    print(f'{naive == faster}')

    board16 = """
    -A-----FHDG-O-L-
    F------C---BHEN-
    N--PLA---O-F--KD
    OK---EJ---L--C-G
    -N---KMEJFO--DP-
    KE----LJ-------H
    -OF-C-HPLME--A--
    P----D--A-----CB
    G-N---A---M-CI-E
    --AEJ-OB-----MHK
    --BO-G--CK--L-D-
    L----HNI---AJB-P
    -GL------I-N-K--
    J-PH-MB-D-KGA---
    A--IK---F-PM-NEC
    -C-------JA-D-M-
    """
    board16_repr = transform_str_board(board16, substitute)
    from time import time
    c = time()
    naive = sudoku([x[:] for x in board16_repr])
    print(f'Naive 16x16: {time() - c}s')
    c = time()
    faster = sudoku_greedy(board16_repr)
    print(f'Faster 16x16: {time() - c}s')
