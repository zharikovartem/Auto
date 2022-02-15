import React from 'react';
import './App.css';
import 'antd/dist/antd.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import { BrowserRouter } from 'react-router-dom'
import { Provider } from 'react-redux'
import store from './Redux/store'
import Main from './Containers/Maincontainer';

function App() {
    return (
        <div className="container">
            <BrowserRouter>
                <Provider store={store}>
                    <Main />
                </Provider>
            </BrowserRouter>
        </div>
    )
}

export default App
