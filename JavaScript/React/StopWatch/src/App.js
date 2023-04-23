import React, { useState, useEffect, useRef } from 'react';
import './App.css';

function App() {
  const [time, setTime] = useState(0);
  const [isRunning, setIsRunning] = useState(false);
  const [isStopped, setIsStopped] = useState(false);
  const intervalRef = useRef(null);

  useEffect(() => {
    return () => clearInterval(intervalRef.current);
  }, []);

  function handleStart() {
    setIsRunning(true);
    setIsStopped(false);
    intervalRef.current = setInterval(() => {
      setTime(time => time + 10);
    }, 10);
  }

  function handleStop() {
    setIsRunning(false);
    setIsStopped(true);
    clearInterval(intervalRef.current);
  }

  function handleReset() {
    setIsStopped(false);
    setTime(0);
    setIsRunning(false);
  }

  return (
    <div className="container">
      <h1 className="timer">{(time / 1000).toLocaleString('en-US', { minimumIntegerDigits: 2, minimumFractionDigits: 0, maximumFractionDigits: 0 })}:{(time / 10 % 100).toLocaleString('en-US', { minimumIntegerDigits: 2, minimumFractionDigits: 0, maximumFractionDigits: 0 })}</h1>
      <div className="button-container">
        <button className="green" onClick={handleStart} disabled={isRunning}>Start</button>
        <button className="red" onClick={handleStop} disabled={!isRunning || isStopped}>Stop</button>
        <button className="blue" onClick={handleReset}>Reset</button>
      </div>
    </div>
  );
}

export default App;
