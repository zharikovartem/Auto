import React from 'react'
import Login from '../Components/Login/LoginContainer'
import { Routes, Route} from 'react-router-dom'
import Router from '../Components/Router/Router'
import Menu from './../Components/Menu/Menu'
import { MainPropsType } from './Maincontainer'
import Register from '../Components/Register/Register'

const Main:React.FC<MainPropsType> = (props) => {

    return (
        <div className="App">
            <Menu />
            <li>Реализовать роутинг</li>
            <li>Реализовать авторизацию</li>
            <li>Реализовать реализовать обращение к бд</li>

            {props.isAuth ? <Router /> : 
                <Routes>
                    <Route path="/" element={<Login />} />
                    <Route path="/register" element={<Register />} />
                </Routes>
            }
            
        </div>
    )
}

export default  Main