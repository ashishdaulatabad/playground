#include <iostream>
#include <vector>
#include <stack>
#include <cmath>
#include <utility>
#include <memory>

constexpr bool any_one(char compare_to) {
  return false;
}

template <typename ...args>
constexpr bool any_one(char compare_to, char compare_with, args ...arg) {
  return compare_to == compare_with || any_one(compare_to, arg...);
}

std::pair<double, size_t> parse_number(const std::string &expr, size_t i) {
  double value = 0, denom = 1;
  bool end_of_number = false;
  bool decimal_encounter = false, exp_read = false, negative_exp = false;
  int exp_value = 0;

  while (!end_of_number && i < expr.size()) {
    switch (expr[i]) {
    case '0'...'9':
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

    case '-':
      if (exp_read && any_one(expr[i - 1], 'e', 'E')) {
        negative_exp = true;
      }
      ++i;
      break;

    case '.':
      ++i;
      decimal_encounter = true;
      break;

    case 'E':
    case 'e':
      ++i;
      exp_read = true;
      break;

    default:
      end_of_number = true;
      break;
    }
  }

  return {value * pow(10, negative_exp ? -exp_value : exp_value), i};
}

constexpr inline double 
perform_operation(const double first, const double second, char op) {
  switch (op) {
    case '+': return first + second;
    case '-': return first - second;
    case '*': return first * second;
    case '/': return first / second;
    default : return first + second;
  }
}

std::pair<long double, size_t> 
evaluate(const std::string &expr, size_t start = 0) {
  size_t i = start;
  double value = 0;
  std::stack<double> st_values;
  std::stack<char> sign;
  bool end_of_expression = false;

  auto operate_once = [](std::stack<double>& stack_values, std::stack<char>& sign) {
    double second = stack_values.top();
    stack_values.pop();

    double first = stack_values.top();
    stack_values.pop();

    char op = sign.top();
    sign.pop();

    stack_values.push(perform_operation(first, second, op));
  };

  while (i < expr.size() && !end_of_expression) {
    switch (expr[i]) {
    case '(': 
      std::tie(value, i) = evaluate(expr, i + 1);
      st_values.push(value);
      break;

    case '0'...'9':
    case '.': 
      std::tie(value, i) = parse_number(expr, i);
      st_values.push(value);
      break;

    case '+':
    case '-':
    case '*':
    case '/':
      if (!sign.empty() && any_one(sign.top(), '*', '/') && any_one(expr[i], '+', '-')) {
        operate_once(st_values, sign);
      }
      sign.push(expr[i++]);
      break;

    case ')':
      end_of_expression = true;
      ++i;
      break;

    case ' ':
      ++i;
      break;
    }
  }
  while (st_values.size() > 1) {
    operate_once(st_values, sign);
  }

  return {st_values.top(), i};
}

inline double eval(const std::string &expr) {
  size_t i = 0;
  double answer = 0;
  std::tie(answer, i) = evaluate(expr);
  return answer;
}

int main () {
  while (true) {
    std::string expr = "";
    std::cout << ">>> ";
    std::getline(std::cin, expr);
    if (expr == "exit") break;
    std::cout << eval(expr) << std::endl;
  }

  return 0;
}
