# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




$(document).on "page:change", ->
  $('form').on 'click','.remove_fields',(event) ->
    $(this).prev('input[type=hidden]').val("1")
    $(this).closest('fieldset').hide()
    event.preventDefault()  





$(document).on "page:change", ->
  $('form').on 'click','.add_fields',(event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'),'g')
    $(this).before($(this).data('fields').replace(regexp,time))
    event.preventDefault()  



