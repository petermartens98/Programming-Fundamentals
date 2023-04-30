/*

import './App.css';
import React, { useState } from 'react';

function App() {
  const [state, setState] = useState({ count:4, theme:'blue'})
  const count = state.count
  const theme = state.theme

  function decrementCount() {
    setState(prevState => {
      return {...prevState, count: prevState.count - 1}
    });
  };
  
  function incrementCount() {
    setState(prevState => {
      return {...prevState, count: prevState.count + 1}
    });
  };

  return (
    <div className="App">
      <button onClick={decrementCount}>-</button>
      <span>{count}</span>
      <span>{theme}</span>
      <button onClick={incrementCount}>+</button>
    </div>
  );
}

export default App;

*/

import './App.css';
import React, { useState } from 'react';

function App() {
  const [count, setCount] = useState(4);
  const [theme, setTheme] = useState('blue');

  function decrementCount() {
    setCount(prevCount => prevCount - 1)
    setTheme("red");
  };
  
  function incrementCount() {
    setCount(prevCount => prevCount + 1)
    setTheme("green");
  };

  return (
    <div className="App">
      <button onClick={decrementCount}>-</button>
      <span>{count}</span>
      <span>{theme}</span>
      <button onClick={incrementCount}>+</button>
    </div>
  );
}

export default App;

