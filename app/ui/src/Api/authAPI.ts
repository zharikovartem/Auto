import { instance, url } from './Api'

export type LoginDataType = {
    username: string
    password: string
    remember?: boolean
}

export type RegisterDataType = {
    username: string
    password: string
    confirmPassword: string
    // remember?: boolean
}

export const authAPI = {
    tokenCheck() {
        return fetch(url + 'token_check', {
            method: 'GET',
            headers: {
                Authorization: 'Bearer ' + localStorage.getItem('apikey')
            }
        })
        .then((data) => {
            if (data.status === 200) {
                return data.json()
            } else {
                return false
            }
        })
        .then((json) => {
            return json
        })
    },

    login(data: LoginDataType) {
        return fetch(url + 'login', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((data) => {
            return data.json()
        })
        .then((json) => {
            return json
        })
    },

    register(data: RegisterDataType) {
        return fetch(url + 'register', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then((data) => {
            return data.json()
        })
        .then((json) => {
            return json
        })
    },
}