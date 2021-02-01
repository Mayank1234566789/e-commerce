import React from 'react';
import { Navbar, Button, Modal ,NavDropdown} from 'react-bootstrap';
import '../Header/header.component.css';
import SignIn from '../SignIn/signin.component';
import SignUp from '../SignUp/signup.component';
import Cookies from 'universal-cookie';


class Header extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      sigin: false,
      sigup: false,
      logIn: true
    }
  };

  handleClose = () => {
    this.setState({
      sigin: false,
      sigup: false
    })
  }

  handleShowSignin = () => {
    this.setState({
      sigin: true,
      sigup: false
    })
  }

  handleShowSignup = () => {
    this.setState({
      sigin: false,
      sigup: true
    })
  }

  handelLogout = () => {
    const cookie = new Cookies();
    cookie.remove("login",{ path: '/' })
    cookie.remove("name",{ path: '/' })
    window.location = '/';
  }

  componentDidMount(){

    let status = this.props.login;
    if(status !== 0){
      this.setState({logIn : false})
    }

    console.log(this.state.logIn)
  }

  render() {
    return (
      <div>
        <Navbar bg="dark" expand="lg" variant="dark" sticky="top">
          <Navbar.Brand href="/">
            <img
              src="/logo192.png"
              width="30"
              height="30"
              className="d-inline-block align-top"
              alt="logo"
            />{''}
     Market</Navbar.Brand>

          
             {this.state.logIn === true ?
              <div className="ml-auto ml-auto">
            <button variant="primary" className="btn btn-primary mx-1 mr-1" onClick={this.handleShowSignin}>Sign In</button>
            <Modal show={this.state.sigin} onHide={this.handleClose} backdrop="static">
              <SignIn />
              <Button className="close" variant="secondary" onClick={this.handleClose}>X</Button>
            </Modal>


            <button variant="secondary" className="btn btn-primary mx-1 mr-1" onClick={this.handleShowSignup}>Sign Up</button>
            <Modal show={this.state.sigup} onHide={this.handleClose} backdrop="static">
              <SignUp />
              <Button className="close" variant="secondary" onClick={this.handleClose}>X</Button>
            </Modal>
            </div>
             :
             <div className="margin">
             <NavDropdown title={`HI, ${this.props.name}`} id="basic-nav-dropdown">
             <NavDropdown.Item href="#action/3.1">Orders</NavDropdown.Item>
             <NavDropdown.Item href="#action/3.2">Another action</NavDropdown.Item>
             <NavDropdown.Item href="#action/3.3">Something</NavDropdown.Item>
             <NavDropdown.Divider />
             <NavDropdown.Item onClick={this.handelLogout}>Log Out</NavDropdown.Item>
             </NavDropdown>
             </div>
             }
          

        </Navbar>

      </div>





    )
  }
}





export default Header;