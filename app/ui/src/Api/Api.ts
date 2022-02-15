import axios from 'axios'
// const cors = require("cors");

export const url = process.env.REACT_APP_PROXY_URL

export const instance = axios.create({
    withCredentials: false,
    baseURL: url,
    headers: {
        Authorization: 'Bearer ' + localStorage.getItem('apikey'),
        // 'Content-Type': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Accept': "application/json"
    }
})

instance.defaults.headers.post['header1'] = 'value'

export const requestActionBase = (fetch: any, fetchParams: any, callbackSuccess:any, callbackError:any) => {

}