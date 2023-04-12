import React, { useState } from 'react';

const App = () => {
  const [inputText, setInputText] = useState('');

  const handleInputChange = (event) => {
    setInputText(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    alert(`You entered: ${inputText}`);
    setInputText('');
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <label>
          Enter some text: 
          <input type="text" value={inputText} onChange={handleInputChange} />
        </label>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
};

export default App;
