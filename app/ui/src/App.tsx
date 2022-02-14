import React from 'react';
import logo from './logo.svg';
import './App.css';
import Menu from './Components/Menu'
import 'antd/dist/antd.css'

function App() {
  return (
    <div className="App">
      <Menu />
      <li>Реализовать роутинг</li>
      <li>Реализовать авторизацию</li>
      <li>Реализовать реализовать обращение к бд</li>
    </div>
  );
}

export default App;
