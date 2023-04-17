import React, { useState } from 'react';

const App = () => {
  const [items, setItems] = useState([]);

  const AddItemButton = ({ addItem }) => {
    return (
      <button onClick={() => addItem()}>Add Item</button>
    );
  };

  const addItem = () => {
    const newItem = 'New Item';
    setItems([...items, newItem]);
  };

  return (
    <div>
      <AddItemButton addItem={addItem} />
      <ul>
        {items.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>
    </div>
  );
};

export default App;
