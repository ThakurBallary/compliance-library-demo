@LibcomplForm = React.createClass
	getInitialState: ->
		libindex: ''
		question_index: ''
		compliance_task: ''
		compliance_details: ''
		frequency: ''
		website_link: ''
		form_link: ''
		task_details: ''
		date: ''
		demo: true
	valid: ->
	 	@state.libindex && @state.compliance_task	
	toggleDemo: (e) ->
		e.preventDefault()
		@setState demo: !@state.demo
		if @state.demo
			$(e.target).removeClass('btn-info')
			$(e.target).addClass('btn-secondary')
		else
			$(e.target).removeClass('btn-secondary')
			$(e.target).addClass('btn-info')
	handleValueChange: (e) ->
		valueName = e.target.name
		@setState "#{ valueName }": e.target.value	
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '', { libcompl: @state }, (data) => 
			@props.handleNewLibcompl data
			@setState @getInitialState()
			'JSON'
	render: ->
		React.DOM.form
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'card card-inverse bg-primary'
				React.DOM.h4
					className: 'card-header'
					'New Library Compliance'
				React.DOM.div
					className: 'card-block'
					React.DOM.div
						className: 'form-group row'
						React.DOM.input
							type: 'number'
							min: 1
							className: 'form-control col-sm-2'
							placeholder: 'Lib ID'
							name: 'libindex'
							value: @state.libindex
							onChange: @handleValueChange
						React.DOM.input
							type: 'number'
							min: 1
							className: 'form-control col-sm-2'
							placeholder: 'Q ID'
							name: 'question_index'
							value: @state.question_index
							onChange: @handleValueChange
						React.DOM.input
							type: 'text'
							className: 'form-control col-sm-8'
							placeholder: 'Compliance Task'
							name: 'compliance_task'
							value: @state.compliance_task
							onChange: @handleValueChange
					React.DOM.div
						className: 'form-group row'				
						React.DOM.textarea
							rows: 4
							className: 'form-control'
							placeholder: 'Compliance Details'
							name: 'compliance_details'
							value: @state.compliance_details
							onChange: @handleValueChange
					React.DOM.div
						className: 'form-group row'		
						React.DOM.input
							type: 'text'
							className: 'form-control col-sm-2'
							placeholder: 'Frequency'
							name: 'frequency'
							value: @state.frequency
							onChange: @handleValueChange			
						React.DOM.input
							type: 'text'
							className: 'form-control col-sm-5'
							placeholder: 'Website Link'
							name: 'website_link'
							value: @state.website_link
							onChange: @handleValueChange
						React.DOM.input
							type: 'text'
							className: 'form-control col-sm-5'
							placeholder: 'Form Link'
							name: 'form_link'
							value: @state.form_link
							onChange: @handleValueChange
					React.DOM.div
						className: 'form-group row'
						React.DOM.input
							type: 'text'
							className: 'form-control col-sm-6'
							placeholder: 'Task Details'
							name: 'task_details'
							value: @state.task_details
							onChange: @handleValueChange			
						React.DOM.input
							type: 'date'
							className: 'form-control col-sm-4'
							name: 'date'
							value: @state.date
							onChange: @handleValueChange
						React.DOM.button
							className: 'btn btn-info btn-sm col-sm-2'
							onClick: @toggleDemo
							if @state.demo then 'Demo On' else 'Demo Off'
				React.DOM.div
					className: 'card-footer text-right'
					React.DOM.button
						className: 'btn btn-secondary btn-sm mr5'
						'data-dismiss': 'modal'
						'Cancel'
					React.DOM.button
						type: 'submit'
						className: 'btn btn-warning btn-sm'
						disabled: !@valid()
						'Create Compliance'