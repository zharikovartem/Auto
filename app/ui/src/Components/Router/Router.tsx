import React from 'react'
import { Routes, Route} from 'react-router-dom'
import Login from '../Login/LoginContainer'

const Router:React.FC<RouterPropsType> = (props) => {

    return (
        <Routes>
            <Route path="/" element={<Login />} />
        </Routes>
    )
}

export default  Router

type RouterPropsType = {

}