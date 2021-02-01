import React from 'react';
import {BrowserRouter,Switch,Route} from 'react-router-dom';
import HomePage from '../src/Pages/homepage/homepage.js';
import Header from '../src/Component/Header/header.component';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import AssetsPage from '../src/Pages/Assetspage/assetspage';
import Cookies from 'universal-cookie';
import Footer from '../src/Component/Footer/footer.component';

import './App.css';

class App extends React.Component {
  constructor(){
    super();

    this.state={
      loggedin:0,
      username:''
    };
  }

  LoggedIn = (value) =>{
      
    this.setState({loggedin:value.status,username:value.username})
  }

  UNSAFE_componentWillMount(){
    

    const cookie = new Cookies();
    let log_in = {
      status : cookie.get("login"),
      username : cookie.get("name")
    }

    console.log('app.js ',log_in.status)
    if(log_in.status >0){
    this.LoggedIn(log_in)
    }
  }
  

  render(){
    return(
      <div>
        <Header login={this.state.loggedin} name={this.state.username}/>
        <BrowserRouter>
            <Switch>
            <Route exact path='/' component={HomePage} />
            <Route exact path='/assets/:subcantegory' component={AssetsPage} />
            </Switch>
        </BrowserRouter>
        <Footer />
      </div>
    )
  }
}

export default App;
