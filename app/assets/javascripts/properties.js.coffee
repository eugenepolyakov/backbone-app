# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#= require_tree ./templates

window.App =
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
  template: JST['properties']
  itemView: App.Views.Property
  itemViewContainer: '#properties'
  initialize: ->
#    super
    @collection = new App.Collections.Properties
#    @listenTo(@collection, 'add', @addItem)
    @collection.fetch()

$ ->
#  properties = new App.Collections.Properties
#  properties.fetch()
  propertiesView = new App.Views.Properties
#    collection: properties
  $('#main').html(propertiesView.render().el)
