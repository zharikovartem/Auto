import { Dispatch } from 'redux'
import { authAPI, LoginDataType } from '../Api/authAPI'
import { BaseThunkType, InferActionsTypes } from './store'

export type InitialStateType ={
    isAuth: boolean
}

let initialState:InitialStateType = {
    isAuth: false
}

type ActionsType = InferActionsTypes<typeof actions>

const authReducer = (state = initialState, action: ActionsType): InitialStateType => {
    switch (action.type) {
        case 'AUTH/TEST':
            return {
                    ...state,
                    isAuth: action.isAuth
            }
        default:
            return state;
    }
}

export const actions = {
    setIsAuth: (isAuth: boolean) => ({type: 'AUTH/TEST', isAuth} as const),
}

export const login = (data: LoginDataType): ThunkType => {
    return async (dispatch, getState) => {
        const response = await authAPI.login(data)
        if (response) {
            dispatch( actions.setIsAuth(true) )
        }
    }
}

export default authReducer

type ActionsTypes = InferActionsTypes<typeof actions>
type ThunkType = BaseThunkType<ActionsTypes>
export type DispatchType = Dispatch<ActionsTypes>