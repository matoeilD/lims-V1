# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120713134252) do

  create_table "cultures", :force => true do |t|
    t.string   "culturename"
    t.integer  "element_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "element_elements", :force => true do |t|
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "element_elements", ["element_id"], :name => "index_element_elements_on_element_id"

  create_table "elements", :force => true do |t|
    t.string   "elementname"
    t.string   "elementtype"
    t.text     "elementnote"
    t.integer  "user_id"
    t.integer  "element_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "elements", ["element_id"], :name => "index_elements_on_element_id"
  add_index "elements", ["project_id"], :name => "index_elements_on_project_id"
  add_index "elements", ["user_id"], :name => "index_elements_on_user_id"

  create_table "experiments", :force => true do |t|
    t.string   "exptype"
    t.string   "resultfile"
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "experiments", ["element_id"], :name => "index_experiments_on_element_id"

  create_table "extractions", :force => true do |t|
    t.string   "extractionname"
    t.integer  "element_id"
    t.integer  "culture_id"
    t.text     "extractionnote"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "project_elements", :force => true do |t|
    t.integer  "project_id"
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_elements", ["element_id"], :name => "index_project_elements_on_element_id"
  add_index "project_elements", ["project_id"], :name => "index_project_elements_on_project_id"

  create_table "projects", :force => true do |t|
    t.string  "projectname"
    t.text    "projectdescription"
    t.integer "projecttype_id"
    t.integer "user_id"
    t.integer "element_id"
  end

  add_index "projects", ["element_id"], :name => "index_projects_on_element_id"
  add_index "projects", ["projecttype_id"], :name => "index_projects_on_projecttype_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "projecttypes", :force => true do |t|
    t.string   "projecttypename"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "user_elements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_elements", ["element_id"], :name => "index_user_elements_on_element_id"
  add_index "user_elements", ["user_id"], :name => "index_user_elements_on_user_id"

  create_table "user_projects", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_projects", ["project_id"], :name => "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id"], :name => "index_user_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "email"
    t.string   "password"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "welldish_experiments", :force => true do |t|
    t.integer  "welldish_id"
    t.integer  "experiment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "welldish_experiments", ["experiment_id"], :name => "index_welldish_experiments_on_experiment_id"
  add_index "welldish_experiments", ["welldish_id"], :name => "index_welldish_experiments_on_welldish_id"

  create_table "welldishes", :force => true do |t|
    t.string   "welldishtype"
    t.text     "welldishnote"
    t.string   "welldishdimension"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
