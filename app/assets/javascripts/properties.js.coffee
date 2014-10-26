# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require_tree ./templates

window.App =
  Main: new Marionette.Application()
  Models: {}
  Collections: {}
  Views: {}

class App.Models.Property extends Backbone.Model

class App.Collections.Properties extends Backbone.Collection
  model: App.Models.Property
  url: 'properties'

class App.Views.Property extends Marionette.ItemView
  template: JST['property']
  tagName: 'li'

  events:
    'click .remove': 'destroy'

  destroy: ->
    @model.destroy()


class App.Views.Properties extends Marionette.CompositeView
  el: '#main'
  template: JST['properties']
  childView: App.Views.Property
  childViewContainer: '#properties'

  onRender: ->
    @collection.fetch()

App.Main.on 'start', ->
  properties = new App.Collections.Properties()
  propertiesView = new App.Views.Properties
    collection: properties
  propertiesView.render()

$ ->
  App.Main.start()
