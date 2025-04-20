#pragma once
#include <stdexcept>
#ifndef __STRING_VIEW_HPP__
#define __STRING_VIEW_HPP__

#include <ostream>

struct StringView {
  const char* pointer;
  size_t start, end;

  /// Create String View.
  static StringView create_view_from_string(const std::string &parent_string, size_t start, size_t end) {
    return StringView {
      .pointer = parent_string.data(),
      .start = start,
      .end = end,
    };
  }

  const char &operator[](const size_t index) {
    if (index < end - start) {
      throw std::range_error("Invalid index");
    }
    return pointer[start + index];
  }

  /// Create new string from the String Window
  std::string clone_string() {
    std::string result;
    result.reserve(end - start);

    for (size_t index = start; index < end; ++index) {
      result.push_back(pointer[index]);
    }

    return result;
  }

  ~StringView() {
    pointer = nullptr;
  }

  bool operator==(const char *value) const {
    size_t index = 0;

    while (value[index] != '\0') {
      if (value[index] != pointer[start + index]) return false;
      ++index;
    }

    return index + start == end;
  }

  friend std::ostream &operator<<(std::ostream &ost, StringView view) {
    for (size_t index = view.start; index < view.end; ++index) {
      ost << view.pointer[index];
    }

    return ost;
  }
};

#endif
