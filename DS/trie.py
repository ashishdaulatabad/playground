
class TrieNode:
    """
    Node for a trie
    """
    def __init__(self, is_a_word=False):
        self.is_a_word = is_a_word
        self.next = {}

class trie:
    """
    Trie stores a prefix tree
    >>> a = trie(); a += "apple"; a += "application"; a += "apply"; a += "baseball"; a += "bases"; a += 'acid'; [x in a for x in ["applicati", "apply", "apple", "baseball", "base", "acid"]]; a.starts_with('base')
    [False, True, True, True, False, True]
    True
    >>> a = trie(); a += "apple"; a += "application"; a += "apply"; a += "baseball"; a += "bases"; a += 'acid'; a.suggest('a')
    ['acid', 'apply', 'application', 'apple']
    >>> a = trie(); a += "apple"; a += "application"; a += "apply"; a += "baseball"; a += "bases"; a += 'acid'; a.suggest('app')
    ['apply', 'application', 'apple']
    """
    
    def __init__(self):
        """
        Constructor for trie
        """
        self.root_node = TrieNode()

    def __iadd__(self, string: str):
        """
        Add the value to itself.
        """
        traversal_node, i = self.root_node, 0
        while i < len(string):
            if string[i] not in traversal_node.next:
                traversal_node.next[string[i]] = TrieNode()

            i, traversal_node = i + 1, traversal_node.next[string[i]]

        traversal_node.is_a_word = True
        return self

    def __contains__(self, string: str) -> bool:
        """
        Check if the string is in trie
        """
        traversal_node, i = self.root_node, 0
        while i < len(string):
            if string[i] not in traversal_node.next:
                return False
            i, traversal_node = i + 1, traversal_node.next[string[i]]

        return traversal_node.is_a_word

    def starts_with(self, string: str) -> bool:
        """
        Checks whether there is at least one string starting with 
        the mentioned str
        """
        traversal_node, i = self.root_node, 0

        for i in range(len(string)):
            if string[i] not in traversal_node.next:
                return False

            i, traversal_node = i + 1, traversal_node.next[string[i]]

        return traversal_node is not None

    def suggest(self, string: str) -> bool:
        """
        Auto suggest list of words in the prefix tree.
        >>> a = trie()
        >>> for x in ['apple', 'browse', 'apply', 'broth', 'brace', 'brew', 'band', 'app', 'cap', 'capital', 'cast', 'cascade', 'cellphone']:
        ...     a += x
        >>>
        >>> a.suggest('app')
        ['app', 'apply', 'apple']
        >>> a.suggest('b')
        ['band', 'brew', 'brace', 'broth', 'browse']
        >>> a.suggest('c')
        ['cellphone', 'cascade', 'cast', 'cap', 'capital']
        >>> a.suggest('ca')
        ['cascade', 'cast', 'cap', 'capital']
        >>> a.suggest('ce')
        ['cellphone']
        """
        traversal_node, i = self.root_node, 0

        while i < len(string):
            if string[i] not in traversal_node.next:
                return False
            traversal_node, i = traversal_node.next[string[i]], i + 1

        answer = []
        stack = [(traversal_node, string)] if traversal_node is not None else []

        while stack:
            vertex, suggest = stack.pop()
            if vertex.is_a_word:
                answer.append(suggest)
            if len(vertex.next):
                stack.extend([(node, suggest+char) for char, node in vertex.next.items()])

        return answer

if __name__ == "__main__":
    from doctest import testmod
    testmod()
