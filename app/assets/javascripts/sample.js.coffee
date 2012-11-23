Ext.onReady ->
  Ext.create 'Ext.Button',
    text: 'Show popup'
    renderTo: 'buttons'
    handler: ->
      Ext.MessageBox.alert 'This is window title', 'Hello, how do you like this popup?', ->
        console.log("OK clicked!")

  Ext.create 'Ext.Button',
    text: 'Try AJAX'
    renderTo: 'buttons'
    handler: ->
      $("#output").html("<table id='userTable'></table>")
      $.get "/users.json", (data) ->
        $(data).each ->
          $("#userTable").append("<tr><td>#{this.name}</td><td>#{this.email}</td><td>#{this.phone}</td></tr>")

  Ext.create 'Ext.Button',
    text: 'Refresh data'
    renderTo: 'buttons'
    handler: -> myStore.load()

  Ext.define 'User',
    extend: 'Ext.data.Model',
    fields: ['name', 'email', 'phone']

  myStore = Ext.create 'Ext.data.Store',
    model: 'User'
    proxy:
      type: 'ajax'
      url: '/users.json'
      reader:
        type: 'json'
    autoLoad: true

  grid = Ext.create 'Ext.grid.Panel',
    store: myStore
    columns: [
      {header: 'name', sortable: false, dataIndex: 'name'}
      {header: 'email', sortable: false, dataIndex: 'email'}
      {header: 'phone', sortable: false, dataIndex: 'phone'}
    ]
    width: 300
    title: 'User data'
    renderTo: 'grid'

  testForm = Ext.create 'Ext.form.Panel',
    width: 300,
    renderTo: 'form'
    title: 'User Form'
    url: '/users_ajax'
    items: [
      {
      xtype: 'textfield'
      fieldLabel: 'Name'
      name: 'user[name]'
      }
      {
      xtype: 'textfield'
      fieldLabel: 'Email'
      name: 'user[email]'
      }
      {
      xtype: 'textfield'
      fieldLabel: 'Phone'
      name: 'user[phone]'
      }
    ]
    buttons: [
      text: "Submit"
      handler: ->
        this.up('form').getForm().submit(
          success: -> myStore.load()
        )
    ]
