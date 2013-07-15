# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	# Attach event handlers to all up/down links

	$('a.vote-link').on 'click', (e) ->
		e.preventDefault()

		return if $(@).hasClass 'fade'

		voteType = $(@).data 'type'
		playlistPath = $(@).attr 'href'
		votePath = "#{playlistPath}/vote"

		$.ajax
			url: votePath
			data: voteType:voteType
			type: 'POST'
			success: =>
				$votesContainer = $(@).parents('.votes')
				$votesContainer.find('a.vote-link').removeClass 'fade'
				$(@).addClass 'fade'


