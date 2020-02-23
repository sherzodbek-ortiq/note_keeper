import React from "react"
import PropTypes from "prop-types"
import Note from './Note.jsx'

class AllNotes extends React.Component {

	render(){
		var notes = this.props.notes
		notes = notes.map((note) =>{
			return(
				<div key={note.id}>
					<Note note={note} handleDelete={this.props.handleDelete} handleEdit={this.props.handleEdit}/>
				</div>
			)
		});

		return(
			<div>
				{notes}
			</div>
		);
	}
}

export default AllNotes
