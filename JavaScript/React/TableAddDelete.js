import React, { useState } from 'react';

const Table = () => {
  const [data, setData] = useState([
    { id: 1, name: 'John Doe', age: 30 },
    { id: 2, name: 'Jane Smith', age: 25 },
    { id: 3, name: 'Bob Johnson', age: 40 },
  ]);

  const [formValues, setFormValues] = useState({ id: '', name: '', age: '' });

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setFormValues({ ...formValues, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const newItem = { ...formValues, id: Date.now() };
    setData([...data, newItem]);
    setFormValues({ id: '', name: '', age: '' });
  };

  const handleDelete = (id) => {
    setData(data.filter((item) => item.id !== id));
  };

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="name"
          value={formValues.name}
          onChange={handleInputChange}
          placeholder="Name"
        />
        <input
          type="text"
          name="age"
          value={formValues.age}
          onChange={handleInputChange}
          placeholder="Age"
        />
        <button type="submit">Add</button>
      </form>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item) => (
            <tr key={item.id}>
              <td>{item.id}</td>
              <td>{item.name}</td>
              <td>{item.age}</td>
              <td>
                <button onClick={() => handleDelete(item.id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Table;
