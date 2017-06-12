@Libcompl = React.createClass
	getInitialState: ->
		edit: false
		demo: @props.libcompl.demo
	handleToggle: (e) ->
		e.preventDefault()
		@setState edit: !@state.edit
	handleDelete: (e) ->
		e.preventDefault()
		if confirm "Are you sure?\n\n\"#{ @props.libcompl.compliance_task }\" will be deleted.\n" then @handleDestroy e
	handleDestroy: (e) ->
		$.ajax
			method: 'DELETE'
			url: "/libcompls/#{ @props.libcompl.id }"
			dataType: 'JSON'
			success: () =>
				@props.handleDeleteLibcompl @props.libcompl
	toggleDemo: (e) ->
		e.preventDefault()
		@setState demo: !@state.demo
	handleValueChange: (e) ->
		valueName = e.target.name
		@setState "#{ valueName }": e.target.value
	handleEdit: (e) ->
		e.preventDefault()
		values = 
			libindex: @state.libindex
			question_index: @state.question_index
			compliance_task: @state.compliance_task
			compliance_details: @state.compliance_details
			frequency: @state.frequency
			website_link: @state.website_link
			form_link: @state.form_link
			task_details: @state.task_details
			date: @state.date
			demo: @state.demo
		$.ajax
			method: 'PUT'
			url: "/libcompls/#{ @props.libcompl.id }"
			dataType: 'JSON'
			data:
				libcompl: values
			success: (data) =>
				@setState edit: false
				@props.handleEditLibcompl @props.libcompl, data
	showEditDialog: (e) ->
		# $('#overlay').removeClass('hide')
		# $('#edit').removeClass('hide')
		# $('#editField').html(e.target.value)
		$('#'+e.target.id).css('width', '200px')
	hideEditDialog: (e) ->
		$('#overlay').addClass('hide')
		$('#edit').addClass('hide')
	formatDate: (date) ->
		d = date.getDate()
		m = date.toLocaleString('en-us', month: 'short')
		y = date.getFullYear() % 100
		d+'.'+m+'.'+y
	libcomplRow: ->
		complianceDetails = @props.libcompl.compliance_details.split(/\s+/).slice(0,5).join(" ")
		website = @props.libcompl.website_link
		form = @props.libcompl.form_link
		date = @props.libcompl.date
		if date
			date = @formatDate(new Date(date))
		React.DOM.tr null,
			React.DOM.td null, @props.libcompl.libindex
			React.DOM.td null, @props.libcompl.question_index
			React.DOM.td null, @props.libcompl.compliance_task
			React.DOM.td 
				className: 'td-textarea'
				title: @props.libcompl.compliance_details.toString()
				complianceDetails
			React.DOM.td null, @props.libcompl.frequency
			React.DOM.td null,
			if website
					React.DOM.a
						className: 'btn text-primary'
						href: 'http://'+ website
						target: '_blank'
						title: website
						React.DOM.i
							className: 'fa fa-globe'
			React.DOM.td null,
			if form
				React.DOM.a
					className: 'btn text-primary'
					href: 'http://'+@props.libcompl.form_link
					target: '_blank'
					title: @props.libcompl.form_link
					React.DOM.i
						className: 'fa fa-file-text-o'
			React.DOM.td null, @props.libcompl.task_details
			React.DOM.td null, date
			React.DOM.td null, 
				if @props.libcompl.demo
					React.DOM.i
						className: 'fa fa-check green'
				else
					React.DOM.i
						className: 'fa fa-close red'	
			React.DOM.td null,
				React.DOM.button
					className: 'btn btn-secondary btn-sm'
					onClick: @handleToggle
					React.DOM.i
						className: 'fa fa-pencil'
				React.DOM.button
					className: 'btn btn-secondary btn-sm'
					onClick: @handleDelete
					React.DOM.i
						className: 'fa fa-trash-o'
	libcomplForm: ->
		React.DOM.tr null,
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'number'
						defaultValue: @props.libcompl.libindex
						name: 'libindex'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'number'
						defaultValue: @props.libcompl.question_index
						name: 'question_index'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'text'
						defaultValue: @props.libcompl.compliance_task
						name: 'compliance_task'
						onChange: @handleValueChange
				React.DOM.td 
					className: 'width15per'
					React.DOM.textarea
						className: 'form-control'
						defaultValue: @props.libcompl.compliance_details
						name: 'compliance_details'
						onFocus: @showEditDialog
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'text'
						defaultValue: @props.libcompl.frequency
						name: 'frequency'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'text'
						defaultValue: @props.libcompl.website_link
						name: 'website_link'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'text'
						defaultValue: @props.libcompl.form_link
						name: 'form_link'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'text'
						defaultValue: @props.libcompl.task_details
						name: 'task_details'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.input
						className: 'form-control'
						type: 'date'
						defaultValue: @props.libcompl.date
						name: 'date'
						onChange: @handleValueChange
				React.DOM.td null,
					React.DOM.button
						className: 'btn btn-secondary btn-sm'
						onClick: @toggleDemo
						if @state.demo
							React.DOM.i
								className: 'fa fa-thumbs-up'
						else
							React.DOM.i
								className: 'fa fa-thumbs-o-down'
				React.DOM.td null,
					React.DOM.button
						className: 'btn btn-success btn-sm'
						onClick: @handleEdit
						React.DOM.i
							className: 'fa fa-check'
					React.DOM.button
						className: 'btn btn-secondary btn-sm'
						onClick: @handleToggle
						React.DOM.i
							className: 'fa fa-close'
	render: ->
		if @state.edit
			@libcomplForm()
		else
			@libcomplRow()
		