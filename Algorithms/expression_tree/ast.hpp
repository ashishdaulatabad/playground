#pragma once
#ifndef __AST_HPP__
#define __AST_HPP__

#include <ostream>
#include <vector>
#include <stack>
#include "operation.hpp"

/// Helpful way to evaluate and optimize expression tree?
struct ASTree {
  struct Node {
    bool is_root_node;
    OperationType curr_operation;
    std::vector<Node*> inner_expression;

    Node(bool root_node): is_root_node(root_node) {}
    Node(OperationType operation_type): curr_operation(operation_type), is_root_node(false) {}
  };

  Node *root = nullptr;
  std::stack<Node *> workspace;

  void initialize() {
    root = new Node(true);
    workspace.push(root);
  }

  double evaluate_expression() {
    Node *traverse = root;
    double result = 0;

    switch (traverse->curr_operation) {
      case OperationType::Nil: {
        if (!traverse->inner_expression.empty()) {
          // Evaluate the inner expression array
          // result =
        }

        break;
      }

      case OperationType::Add: {
        break;
      }
    }

    return result;
  }

  void add_expression(OperationType operation) {
    workspace.top()->inner_expression.push_back(new Node(operation));
  }

  void create_subexpression() {
    if (!workspace.empty()) {
      workspace.top()->inner_expression.emplace_back(new Node(false));
      workspace.push(workspace.top()->inner_expression.back());
    }
  }

  void end_subexpression() {
    workspace.pop();
  }
};

#endif
