@Libcompls = React.createClass
	getInitialState: ->
		libcompls: @props.data
	getDefaultProps: ->
		libcompls: []
	addLibcompl: (libcompl) ->
		libcompls = @state.libcompls.slice()
		libcompls.push libcompl
		@setState libcompls: libcompls
	deleteLibcompl: (libcompl) ->
		libcompls = @state.libcompls.slice()
		index = libcompls.indexOf libcompl
		libcompls.splice index, 1
		@replaceState libcompls: libcompls
	updateLibcompl: (libcompl, data) ->
		index = @state.libcompls.indexOf libcompl
		libcompls = React.addons.update(@state.libcompls, { $splice: [[index, 1, data]] })
		@replaceState libcompls: libcompls
	fixThead: ->
		$('table.table').floatThead()
		console.log "thead"
	render: ->
		React.DOM.div
			className: 'libcompls'
			React.DOM.nav
				className: 'navbar navbar-inverse bg-nav fixedTop'
				React.DOM.h1
					className: 'navbar-brand mb-0'
					'Library Compliance'
				React.DOM.button
					className: 'btn btn-secondary btn-sm float-right'
					title: 'Add New Library Compliance'
					'data-toggle': 'modal'
					'data-target': '#NewLibComplModal'
					React.DOM.i
						className: 'fa fa-plus'
					' New'
			React.DOM.div
				className: 'modal fade'
				id: 'NewLibComplModal'
				React.DOM.div
					className: 'modal-dialog modal-lg'
					React.DOM.div
						className: 'modal-content'
						React.createElement LibcomplForm,handleNewLibcompl: @addLibcompl
			React.DOM.table
				className: 'table table-hover table-responsive'
				React.DOM.thead 
					className: 'thead-inverse'
					@fixThead
					React.DOM.tr null,
				    React.DOM.th null, '#L'
				    React.DOM.th null, '#Q'
				    React.DOM.th null, 'Compliance'
				    React.DOM.th null, 'Details'
				    React.DOM.th null, 'Frequency'
				    React.DOM.th null, 'Website'
				    React.DOM.th null, 'Form'
				    React.DOM.th null, 'Task'
				    React.DOM.th null, 'Date'
				    React.DOM.th null, 'Trial'
				    React.DOM.th 
				    	className: 'width7per'
				    	'Actions'
				React.DOM.tbody null,
					for libcompl in @state.libcompls
						React.createElement Libcompl, key: libcompl.id, libcompl: libcompl, handleDeleteLibcompl: @deleteLibcompl, handleEditLibcompl: @updateLibcompl
			React.DOM.div
				className: 'overlay hide'
				id: 'overlay'
			React.DOM.div
				className: 'temp hide'
				id: 'edit'
				React.DOM.label null, "Compliance Details"
				React.DOM.textarea
					className: 'form-control'
					id: 'editField'
					defaultValue: @state.libcompls_details