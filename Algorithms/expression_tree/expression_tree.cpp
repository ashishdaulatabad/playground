#include <iostream>
#include <memory>
#include <cmath>
#include <stack>
#include <utility>
#include <vector>
#include <array>
#include "string_view.hpp"
#include "operation.hpp"
#include "ast.hpp"

constexpr bool any_one(const char compare_to) {
  return false;
}

template <typename ...args>
constexpr bool any_one(const char compare_to, const char compare_with, args ...arg) {
  return compare_to == compare_with || any_one(compare_to, arg...);
}

std::array<OperationType, 256> create_table() {
  std::array<OperationType, 256> tab = {};
  tab['+'] = OperationType::Add;
  tab['-'] = OperationType::Subtract;
  tab['*'] = OperationType::Multiply;
  tab['/'] = OperationType::Divide;
  return tab;
}

namespace Token {

struct Token {
  OperationType operation_type;
  StringView keyword;

  friend std::ostream &operator<<(std::ostream &ost, Token &token) {
    ost << "Token { operation_type: " << token.operation_type << ", keyword: " << token.keyword << " }";
    return ost;
  }
};

inline Token create_token(OperationType operation_type, StringView keyword) {
  return Token {
    .operation_type = operation_type,
    .keyword = keyword,
  };
}

inline Token create_inner_expr(OperationType operation_type, StringView keyword, std::unique_ptr<std::vector<Token>> &inner_expr) {
  return Token {
    .operation_type = operation_type,
    .keyword = keyword,
  };
}

}

std::tuple<size_t, StringView> parse_number2(const std::string &expr, size_t start) {
  size_t i = start;
  double value = 0, denom = 1;
  bool end_of_number = false;
  bool decimal_encounter = false, exp_read = false, negative_exp = false;
  int exp_value = 0;

  while (!end_of_number && i < expr.size()) {
    switch (expr[i]) {
      case '0'...'9': {
        if (!decimal_encounter && !exp_read) {
          value *= 10;
        } else if (decimal_encounter && !exp_read) {
          denom *= 10;
        } else {
          exp_value *= 10;
        }

        if (!exp_read) {
          value += ((expr[i++] - '0') / denom);
        } else {
          exp_value += (expr[i++] - '0');
        }
        break;
      }

      case '-': {
        if (exp_read && any_one(expr[i - 1], 'e', 'E')) {
          negative_exp = true;
        }
        ++i;
        break;
      }

      case '.': {
        ++i;
        decimal_encounter = true;
        break;
      }

      case 'E':
      case 'e': {
        ++i;
        exp_read = true;
        break;
      }

      default: {
        end_of_number = true;
        break;
      }
    }
  }

  return {i, StringView::create_view_from_string(expr, start, i)};
}

std::tuple<size_t, OperationType, StringView> parse_function(const std::string &expr, size_t start) {
  size_t index = start + 1;
  bool end = false;

  while (index < expr.size() && !end) {
      // std::cout << index << std::endl;
    switch(expr[index]) {
      case 'a'...'z':
      case 'A'...'Z':
      case '0'...'9':
      case '_': {
        ++index;
        break;
      }

      default: {
        end = true;
        break;
      }
    }
  }

  StringView function_name = StringView::create_view_from_string(expr, start, index);

  if (function_name == "sin") {
    return {index, OperationType::Sine, function_name};
  }

  if (function_name == "cos") {
    return {index, OperationType::Cos, function_name};
  }

  if (function_name == "tan") {
    return {index, OperationType::Tan, function_name};
  }

  if (function_name == "cot") {
    return {index, OperationType::Cot, function_name};
  }

  if (function_name == "sec") {
    return {index, OperationType::Sec, function_name};
  }

  if (function_name == "csc") {
    return {index, OperationType::Csc, function_name};
  }

  if (function_name == "log") {
    return {index, OperationType::Ln, function_name};
  }

  return {index, OperationType::Invalid, function_name};
}

/// Lexer Processing.
std::vector<Token::Token> create_tokens(const std::string &expr, size_t start_index) {
  size_t index = 0, start = 0;
  while (index < expr.size() && expr[index] == ' ') ++index;
  auto table = create_table();
  std::vector<Token::Token> tokens;

  while (index < expr.size()) {
    switch (expr[index]) {
      case '0' ... '9':
      case '.': {
        /// Parse number end individually.
        StringView number_view;
        std::tie(index, number_view) = parse_number2(expr, index);
        auto token = Token::create_token(OperationType::Number, number_view);
        tokens.emplace_back(token);
        break;
      }

      case '+':
      case '-':
      case '*':
      case '/': {
        StringView sign = StringView::create_view_from_string(expr, index, index + 1);
        tokens.emplace_back(Token::create_token(table[expr[index]], sign));
        ++index;
        break;
      }

      case 'a' ... 'z':
      case 'A' ... 'Z': {
        /// Could be function.
        /// Parse function end individually.
        StringView function_name;
        OperationType operation;
        std::tie(index, operation, function_name) = parse_function(expr, index);
        tokens.emplace_back(Token::create_token(operation, function_name));
        break;
      }

      case ' ': {
        ++index;
        break;
      }

      case '(': {
        /// Create an inner expression.
        StringView new_value = StringView::create_view_from_string(expr, index, index + 1);
        tokens.emplace_back(Token::create_token(OperationType::ParenthesisOpen, new_value));
        ++index;
        break;
      }

      case ')': {
        /// Close an inner expression.
        StringView new_value = StringView::create_view_from_string(expr, index, index + 1);
        tokens.emplace_back(Token::create_token(OperationType::ParenthesisClose, new_value));
        ++index;
        break;
      }

      default: {
        ++index;
        break;
      }
    }
  }
  return tokens;
}

ASTree create_expression_tree(const std::vector<Token::Token> &tokens) {
  ASTree initial_tree;
  for (auto &token: tokens) {
    switch (token.operation_type) {
      case OperationType::ParenthesisClose: {
        break;
      }

      case OperationType::ParenthesisOpen: {
        break;
      }

      case OperationType::Number: {
        break;
      }

      case OperationType::Add ... OperationType::Power: {
        break;
      }

      case OperationType::Logarithm ... OperationType::Csc: {
        break;
      }

      case OperationType::Invalid:
      case OperationType::Nil: {
        break;
      }
    }
  }

  return initial_tree;
}

int main () {
  while (true) {
    std::string expr = "";
    std::cout << ">>> ";
    std::getline(std::cin, expr);
    if (expr == "exit") break;

    auto tokens = create_tokens(expr, 0);
    for (auto &token: tokens) {
        std::cout << token << std::endl;
    }
  }

  return 0;
}
