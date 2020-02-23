import React from "react"
import PropTypes from "prop-types"
import Header from './Header.jsx'
import Body from './Body.jsx'

class Main extends React.Component {
	render(){
		return(
			<div>
				<Header />
				<Body />
			</div>
		);
	}
}

export default Main
