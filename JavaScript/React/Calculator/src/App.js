import React, { useState } from 'react';

function Calculator() {
  const [currentValue, setCurrentValue] = useState(0);
  const [currentOperator, setCurrentOperator] = useState(null);
  const [previousValue, setPreviousValue] = useState(null);

  function handleButtonClick(value) {
    setCurrentValue(currentValue * 10 + value);
  }

  function handleOperatorClick(operator) {
    if (operator === 'C') {
      // Reset all values to default
      setCurrentValue(0);
      setCurrentOperator(null);
      setPreviousValue(null);
    } else {
      // Perform calculation based on current operator
      if (currentOperator && previousValue) {
        let result;
        switch (currentOperator) {
          case '+':
            result = previousValue + currentValue;
            break;
          case '-':
            result = previousValue - currentValue;
            break;
          case '*':
            result = previousValue * currentValue;
            break;
          case '/':
            result = previousValue / currentValue;
            break;
          default:
            result = null;
        }
        setCurrentValue(result);
        setPreviousValue(result);
      } else {
        setPreviousValue(currentValue);
      }
      setCurrentOperator(operator);
      setCurrentValue(0);
    }
  }

  function handleEqualsClick() {
    let result;
    switch (currentOperator) {
      case '+':
        result = previousValue + currentValue;
        break;
      case '-':
        result = previousValue - currentValue;
        break;
      case '*':
        result = previousValue * currentValue;
        break;
      case '/':
        result = previousValue / currentValue;
        break;
      default:
        result = currentValue;
    }
    setCurrentValue(result);
    setCurrentOperator(null);
    setPreviousValue(null);
  }
  
  return (
  <div className="calculator-container">
    <div className="calculator">
      <h1>React Calculator App</h1>
      <Display value={currentValue} />
      <div className="button-grid">
        <Button value="1" onClick={() => handleButtonClick(1)} />
        <Button value="2" onClick={() => handleButtonClick(2)} />
        <Button value="3" onClick={() => handleButtonClick(3)} />
        <Button value="4" onClick={() => handleButtonClick(4)} />
        <Button value="5" onClick={() => handleButtonClick(5)} />
        <Button value="6" onClick={() => handleButtonClick(6)} />
        <Button value="7" onClick={() => handleButtonClick(7)} />
        <Button value="8" onClick={() => handleButtonClick(8)} />
        <Button value="9" onClick={() => handleButtonClick(9)} />
        <Button value="+" onClick={() => handleOperatorClick('+')} />
        <Button value="-" onClick={() => handleOperatorClick('-')} />
        <Button value="*" onClick={() => handleOperatorClick('*')} />
        <Button value="/" onClick={() => handleOperatorClick('/')} />
        <Button value="C" onClick={() => handleOperatorClick('C')} />
        <Button value="=" onClick={handleEqualsClick}/>
      </div>
    </div>
  </div>
  )

function Display({ value }) {
  return (
    <div className="display-container">
      <div className="display">
        {value}
      </div>
    </div>
  );
}

function Button({ value, onClick }) {
  return (
    <button className="button" onClick={onClick}>
      {value}
    </button>
  );
}
}
export default Calculator;
