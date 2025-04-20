#pragma once
#ifndef __OPERATION_HPP__
#define __OPERATION_HPP__

enum OperationType {
  Nil,
  // Number
  Number,
  // Operators
  Add,
  Subtract,
  Multiply,
  Divide,
  Power,
  // Parenthesis
  ParenthesisOpen,
  ParenthesisClose,
  // Syntax Range function
  // RangeStart,
  // RangeEnd,
  // RangeIncrement,
  // Functions
  Logarithm,
  Ln,
  Sine,
  Cos,
  Tan,
  Cot,
  Sec,
  Csc,
  Invalid
};

#endif
