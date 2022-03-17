import { Menu } from 'antd';
import { MailOutlined, AppstoreOutlined, SettingOutlined } from '@ant-design/icons';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const { SubMenu } = Menu;

const MenuPage: React.FC = () => {

    const [current, setCurrent] = useState<string>('')

    const handleClick = (e:any) => {
        console.log(e.key);
        
        setCurrent(e.key );
    }

    return (
        <Menu onClick={handleClick} selectedKeys={[current]} mode="horizontal">
            <SubMenu key="SubMenu" icon={<SettingOutlined />} title="Развитие">
                <Menu.ItemGroup title="Планирование развития">
                    <Menu.Item key="setting:1">Dev план</Menu.Item>
                    <Menu.Item key="setting:2">
                        <Link to={'/knowledge_base/'}>База знаний</Link>
                    </Menu.Item>
                </Menu.ItemGroup>
                <Menu.ItemGroup title="Ход выполнения">
                    <Menu.Item key="setting:3">График</Menu.Item>
                    <Menu.Item key="setting:4">Option 4</Menu.Item>
                </Menu.ItemGroup>
            </SubMenu>
            
            <SubMenu key="work" icon={<SettingOutlined />} title="Работа">
                <Menu.ItemGroup title="Проекты">
                    <Menu.Item key="work:1">Список проектов</Menu.Item>
                </Menu.ItemGroup>
            </SubMenu>

            <SubMenu key="planing" icon={<SettingOutlined />} title="Планирование">
                <Menu.ItemGroup title="Задачи">
                    <Menu.Item key="planing:1">Список задач</Menu.Item>
                </Menu.ItemGroup>
            </SubMenu>
        </Menu>
    )
}

export default MenuPage