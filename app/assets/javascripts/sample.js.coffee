Ext.require([
    'Ext.grid.*',
    'Ext.data.*',
    'Ext.util.*',
    'Ext.state.*'
])

Ext.define('Company', {
    extend: 'Ext.data.Model',
    fields: [
       {name: 'company'},
       {name: 'price',      type: 'float', convert: null,     defaultValue: undefined},
       {name: 'change',     type: 'float', convert: null,     defaultValue: undefined},
       {name: 'pctChange',  type: 'float', convert: null,     defaultValue: undefined},
       {name: 'lastChange', type: 'date',  dateFormat: 'n/j h:ia', defaultValue: undefined}
    ],
    idProperty: 'company'
});

Ext.onReady ->
  clickHandler = ->
    Ext.MessageBox.alert 'This is window title', 'Hello, how do you like this popup?', ->
      console.log("OK clicked!")

  Ext.create(
    'Ext.Button',
      text: 'Show popup'
      renderTo: Ext.getElementById("buttons")
      handler: clickHandler
  )
  Ext.create(
    'Ext.Button',
      text: 'Try AJAX'
      renderTo: Ext.getElementById("buttons")
      handler: ->
        $("#output").html("<table id='userTable'></table>")
        $.get "/users.json", (data) ->
          $(data).each ->
            $("#userTable").append("<tr><td>#{this.name}</td><td>#{this.email}</td><td>#{this.phone}</td></tr>")


  )


