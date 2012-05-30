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

ActiveRecord::Schema.define(:version => 20120530102549) do

  create_table "element_elements", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "elements", :force => true do |t|
    t.integer  "experiment_id"
    t.text     "elementnote"
    t.integer  "user_id"
    t.integer  "element_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "elements", ["element_id"], :name => "index_elements_on_element_id"
  add_index "elements", ["experiment_id"], :name => "index_elements_on_experiment_id"
  add_index "elements", ["user_id"], :name => "index_elements_on_user_id"

  create_table "experiments", :force => true do |t|
    t.string   "exptype"
    t.string   "resultfile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_elements", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "projectname"
    t.text     "projectdescription"
    t.string   "colourcode"
    t.integer  "user_id"
    t.integer  "projecttype_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "projects", ["projecttype_id"], :name => "index_projects_on_projecttype_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "projecttypes", :force => true do |t|
    t.string   "projecttypename"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "user_elements", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_projects", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "email"
    t.string   "password"
    t.string   "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "welldish_experiments", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "welldishes", :force => true do |t|
    t.string   "welldishtype"
    t.text     "welldishnote"
    t.string   "welldishdimension"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
