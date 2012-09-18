lims-V1
=======
by Mathieu Dandonneau

Description
---------------

- an open source LIMS type teamlab project management web server

- designed originally for the URMITE laboratory http://www.ifr48.com/spip.php?article9

- to facilitate safe data storage, data sharing among collaborators, and tracability of the lab microbiology genomic projects

- coded in Ruby on Rails

- include a :
    + CRUD DBMS ( create/read/update/delete databases management system) for tables related to genomic projects
    + Devise-based authentication system
    + Cancan role-based administration system
    + Intuitive and ergonomic interface designed with twitter bootstrap
    + Forms have been designed with Formtastic
          
- screencast : http://www.youtube.com/watch?v=C9C6babXuXQ&feature=relmfu

- this project management system is particularely adapted to biology laboratories projects

- i believe it is rather easily modifiable for your own need .. you basically need to replace the element tables with your own

-it represents an lighter and more simple alternative to open-source project management projects such as redmine or teambox

Installation Instructions
------------------------

-install Ruby 1.9 and Rails 3

-Clone the repo :
<git clone git@github.com:matoeilD/lims-V1.git>

-create a database.yml file in config folder and fill as a start with:

    # SQLite version 3.x
    #   gem install sqlite3
    #
    #   Ensure the SQLite 3 gem is defined in your Gemfile
    #   gem 'sqlite3'
    development:
      adapter: sqlite3
      database: db/development.sqlite3
      pool: 5
      timeout: 5000

    # Warning: The database defined as "test" will be erased and
    # re-generated from your development database when you run "rake".
    # Do not set this db to the same as development or production.
    test:
      adapter: sqlite3
      database: db/test.sqlite3
      pool: 5
      timeout: 5000

    production:
      adapter: sqlite3
      database: db/production.sqlite3
      pool: 5
      timeout: 5000>
  
-run
    bundle install

-run
    bundle exec rake db:migrate

-run
    rails s

-navigate at http://localhost:3000/
   


Signing up as administrator  (initial step)
---------------------------

-in app\controllers\user_controller.rb

remove these lines of code

          #helper from devise
          before_filter :authenticate_user!
  
          #helper from cancan
          load_and_authorize_resource>
 
-start the server again , sign up , click on user , edit button , assign to admin

-put back lines of code above corresponding to authentication and administration helpers

you are now ready to use the application

few guidelines on how to use the application
-----------------------------------------------
- as administrator , attribute different roles to the users, which will restrict access to the databases and tasks

- these access can be modify in ability.rb ( see Cancan documentation )

- create a project

- add elements to it to choose between the following tables :

    + culture
    + extraction
    + library
    + EM_PCR
    + sequencing
    + submission
    + data
    + genome
    + metagenome
    + 16s_pyro
    + RNAseq
    + mass_spectro

that's pretty it !
----------------------
gimme feedback at dandonneau@yahoo.com


Contributor guidelines
----------------------------

- find ways to make this app more generic so that it serves any needs and not only biology projects

- do code refactoring

- ameliorate ajax that is fonctional ( partially ) at this stage only for elements index view

- add a metasearch system

- add a log system

- add a undo system

- .....





