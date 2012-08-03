$ ->
  $('#delete_button').click (ev) ->
    $('#form_bucket div').append('<input name="_method" type="hidden" value="delete">')

$ ->
  $('#buy_button').click (ev) ->
    $('#form_bucket').attr('action', '/purchases/order')
    $('#form_bucket').submit
        