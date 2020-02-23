import React from "react"
import PropTypes from "prop-types"

class NewNote extends React.Component {
	constructor(props){
		super(props);
		this.state = {
			name :"",
			description:"",			
		};

		this.handleChange = this.handleChange.bind(this)
		this.handleSubmit = this.handleSubmit.bind(this)
	}

	handleChange(event){
		const name = event.target.name
		this.setState({
			[name]: event.target.value
		});
	}

	handleSubmit(event){
		event.preventDefault();
		const note_form = event.target
		const name = note_form.name.value
		const description = note_form.description.value

		fetch('/api/v1/notes', {
		  method: 'POST',
		  headers: {
		    'Accept': 'application/json',
		    'Content-Type': 'application/json',
		  },
		  body: JSON.stringify({
		    name: name,
		    description: description,
		  })
		})
		.then((response) => response.json())
		.then((responseJson) => {
				console.log("Hi")
				console.log(responseJson.errors)
			if(!("errors" in responseJson)){
			  this.props.reloadNotes({
			  	id: responseJson.id,
			  	name: this.state.name,
			  	description: this.state.description
			  })
			}else{
				this.props.showError("Error has occured")
			}
		})
		.catch((error) => {
  		console.error(error);
  	})
	}

	render(){
		return(
			<div>
				<form onSubmit={this.handleSubmit}>
					<input type="text" name="name" value={this.state.name} onChange={this.handleChange} placeholder="Enter the name of the note" />
					<input type="text" name="description" value={this.state.description} onChange={this.handleChange} placeholder="Enter the description of the note" />
					<button type="submit">Submit</button>
				</form>
			</div>			
		);
	}
}

export default NewNote
