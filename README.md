# Contacts Manager

# Summary

This is a simple Contacts Manager app built with Ruby on Rails, BCrypt for hashing user passwords, Authentication and Authorization done with standard Ruby conventions, a PostgreSQL database to store contacts, and Bootstrap to make it pretty.  Embedded Ruby (erb) files are used for the html forms with erb partials as appropriate.   

Users can sign up for an account, log-in and log out, create contacts, edit contacts, and destroy contacts. Contacts have basic contact information (first name, last name, phone, email, birthday, etc.) and a user's contacts are only viewable by the user. 

# Background on Ruby on Rails router vs JavaScript Express router.

For non-Ruby on Rails developers, the Rails server is different from JavaScript’s Express server using Node. The Rails server generally follows the Model-View-Controller (MVC) paradigm.  Generally, the server is another program (Puma) in the Rails app, but generally it’s just referred to as the Rails server or Rails router.

A Rails router will receive a request from a client (generally a user on a computer thru a web browser, but it can be a request from an API), the Rails router will look at the request and based on the http PATH and METHOD and will match that request against a list of paths and methods associated with Controllers and their ACTIONS. The router will determine what controller to send the request and generate a new instance of that Controller. 

This is different from a JavaScript Express server which is function based. Express calls a function and within that function fulfills the request with a response. The functions have request, response, and (if needed) next parameters to take in a request, fill out the request, and send the response.

In a Rails app, a Controller is a class. The Rails router will instantiate a new instance of that Controller and call the correct action of that Controller. The Controller will then fulfill the HTTP request.  For example, the response might be just to show an index page, so it would go to View for any templates. In this case it would be an Embedded RuBy (erb) template (index.html.erb).  If needed, the Controller will get data through the Model from the Database, populate the html template from the View, and respond to the client with a filled out html page.

# Rails MVC Paradigm

The paradigm for Rails apps is that we want the Controllers to be skinny, the Models fat, and the Views dumb. The Views should only be concerned with presenting or formatting the data. Views should not be doing queries on the data. The Controllers should be doing the basic queries and functions (index, show, create, new, edit, update, destroy). Models hold the validation and they also have custom functions that don’t necessarily belong in the Rails Controllers.
