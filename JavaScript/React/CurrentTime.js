import React, { useState, useEffect } from 'react';

const App = () => {
  const [time, setTime] = useState(new Date());

  useEffect(() => {
    const interval = setInterval(() => {
      setTime(new Date());
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  return (
    <div>
      <p>The current time is {time.toLocaleTimeString()}.</p>
      <footer>Created by Peter Martens</footer>
    </div>
  );
};

export default App;
