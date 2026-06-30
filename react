import React, { useState } from "react";
import "./App.css";

function App() {
  const [task, setTask] = useState("");
  const [tasks, setTasks] = useState([]);

  const addTask = () => {
    if (task.trim() === "") return;

    setTasks([
      ...tasks,
      {
        id: Date.now(),
        text: task,
        completed: false,
      },
    ]);

    setTask("");
  };

  const toggleComplete = (id) => {
    setTasks(
      tasks.map((t) =>
        t.id === id ? { ...t, completed: !t.completed } : t
      )
    );
  };

  const deleteTask = (id) => {
    setTasks(tasks.filter((t) => t.id !== id));
  };

  return (
    <div className="container">
      <h1>📝 React To-Do App</h1>

      <div className="input-area">
        <input
          type="text"
          placeholder="Enter task..."
          value={task}
          onChange={(e) => setTask(e.target.value)}
        />

        <button onClick={addTask}>Add</button>
      </div>

      <h3>Total Tasks: {tasks.length}</h3>

      <ul>
        {tasks.map((t) => (
          <li key={t.id}>
            <span
              onClick={() => toggleComplete(t.id)}
              style={{
                textDecoration: t.completed ? "line-through" : "none",
                cursor: "pointer",
              }}
            >
              {t.text}
            </span>

            <button
              className="delete"
              onClick={() => deleteTask(t.id)}
            >
              Delete
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;
