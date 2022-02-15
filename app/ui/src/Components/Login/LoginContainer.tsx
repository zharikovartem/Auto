import {connect} from 'react-redux'
import { AppStateType } from '../../Redux/store'
import Login from './Login'

type MapPropsType = ReturnType<typeof mapStateToProps>

type MapDispatchPropsType = {
    
}
type OwnLoginPropsType = {
    
}

export type LoginPropsType = MapPropsType & MapDispatchPropsType & OwnLoginPropsType

let mapStateToProps = (state:AppStateType) => {
    return {
        
    }
}

export default connect<MapPropsType, MapDispatchPropsType, OwnLoginPropsType, AppStateType>(mapStateToProps,
    {  }
    )
(Login)