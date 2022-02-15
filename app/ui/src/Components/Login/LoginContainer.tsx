import {connect} from 'react-redux'
import { AppStateType } from '../../Redux/store'
import Login from './Login'

let mapStateToProps = (state:AppStateType) => {
    return {
        // isAuth: state.authReducer.isAuth
    }
}

type MapPropsType = ReturnType<typeof mapStateToProps>

type MapDispatchPropsType = {
    
}
type OwnLoginPropsType = {
    
}

export type LoginPropsType = MapPropsType & MapDispatchPropsType & OwnLoginPropsType

export default connect<MapPropsType, MapDispatchPropsType, OwnLoginPropsType, AppStateType>(mapStateToProps,
    {  }
    )
(Login)