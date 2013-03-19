$ ->
	if $('#portfolio_info').length > 0
		
		createRow = ->

			$ '<div/>', 'class': 'pm-form-info-row'

		createKey = (val) ->

			keyItem = $ '<div/>', 'class': 'pm-form-info-key'

			# append input box
			input = $('<input/>').attr 'type', 'text'
			input.appendTo keyItem

			# if val is provided
			input.attr 'value', val if val

			keyItem


		createValue = (val) ->

			valueItem = $ '<div/>', 'class': 'pm-form-info-value'		

			# append input box
			input = $('<input/>').attr 'type', 'text'
			input.appendTo valueItem

			# if val is provided
			input.attr 'value', val if val

			valueItem

		createDelete = ->

			deleteItem = $ '<div/>', 'class': 'pm-form-info-delete'
			
			# create/append link and img
			img = $ '<img/>', 'alt': 'Delete-icon', 'src': '/assets/delete-icon.png'
			a = $('<a/>', 'alt': 'Delete', 'href': '#', 'title': 'Delete').append img

			deleteItem.append a

			deleteItem;

	do ->

		# store form
		pForm = $ '.pm-form-info'

		# create divs
		pRow = createRow()
		pKey = createKey()
		pValue = createValue()
		pDelete = createDelete()

		# append elements to row
		pRow.append pKey, pValue, pDelete

		# append row to form
		pForm.append pRow

	### EVENTS ###
	$('.new_portfolio, .edit_portfolio').on 'submit', (e) ->

		# cache vars
		infoForm = $ '.pm-form-info'
		infoRows = infoForm.find '.pm-form-info-row'

		for row in infoRows

			# get key and value
			infoKey = $(row).find('.pm-form-info-key input').val();
			infoVal = $(row).find('.pm-form-info-value input').val();

			# remove whitespace
			infoKey = infoKey.trim();
			infoVal = infoVal.trim();

			# if both exist, join and add to array
			infoArray.push infoKey + '&val=' + infoVal if infoKey && infoVal

			# check if any rows to save
			if infoArray.length > 0

				# join array
				info = infoArray.join('*&*');

				# store array in hidden input
				$('#portfolio_info').val(info);

		# submit form
		e.submit();

		# prevent submit
		e.preventDefault();

	$('.pm-form-info-add a').on 'click', (e) ->

		# store form
		infoForm = $ '.pm-form-info'

		# create divs
		infoRow = createRow()
		infoKey = createKey()
		infoValue = createValue()
		infoDelete = createDelete()

		# append elements to row
		infoRow.append infoKey, infoValue, infoDelete

		# append row to form
		infoForm.append infoRow

		# prevent submit
		e.preventDefault();

	$('.pm-form-info').on 'click', '.pm-form-info-delete a', (e) ->

		# count rows
		count = $('.pm-form-info-row').length

		# if more than one row, delete parent, otherwise do nothing
		if count > 1

			# find parent;
			parent = $(this).parents '.pm-form-info-row'

			# remove parent;
			parent.remove()

		# prevent submit
		e.preventDefault()