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

ActiveRecord::Schema.define(:version => 20120809155101) do

  create_table "cultures", :force => true do |t|
    t.string   "culture_name"
    t.string   "host_strain"
    t.integer  "element_id"
    t.text     "contaminants"
    t.text     "culture_note"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "data", :force => true do |t|
    t.string   "data_name"
    t.text     "data_file"
    t.string   "sequencing_assoc"
    t.integer  "element_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "element_elements", :force => true do |t|
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "element_elements", ["element_id"], :name => "index_element_elements_on_element_id"

  create_table "elements", :force => true do |t|
    t.string   "element_name"
    t.string   "element_type"
    t.text     "element_note"
    t.integer  "user_id"
    t.integer  "element_id"
    t.integer  "project_id"
    t.date     "element_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "elements", ["element_id"], :name => "index_elements_on_element_id"
  add_index "elements", ["project_id"], :name => "index_elements_on_project_id"
  add_index "elements", ["user_id"], :name => "index_elements_on_user_id"

  create_table "em_pcrs", :force => true do |t|
    t.string   "EM_PCR_name"
    t.string   "PCR_round"
    t.integer  "element_id"
    t.string   "library_assoc"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "experiments", :force => true do |t|
    t.string   "exptype"
    t.string   "resultfile"
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "experiments", ["element_id"], :name => "index_experiments_on_element_id"

  create_table "extractions", :force => true do |t|
    t.string   "extraction_name"
    t.integer  "element_id"
    t.string   "culture_assoc"
    t.text     "extraction_note"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "genomes", :force => true do |t|
    t.string   "genome_name"
    t.string   "data_assoc"
    t.string   "genome_type"
    t.string   "genome_ref"
    t.string   "genome_params"
    t.string   "genome_annotateur"
    t.integer  "genome_nbcontigs"
    t.integer  "genome_nbscaffold"
    t.string   "genome_coverage"
    t.string   "genome_ncinquante"
    t.string   "genome_size"
    t.integer  "element_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "libraries", :force => true do |t|
    t.string   "library_name"
    t.text     "fragmentation"
    t.text     "strategy"
    t.integer  "element_id"
    t.string   "extraction_assoc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "metagenomes", :force => true do |t|
    t.string   "meta_name"
    t.string   "data_assoc"
    t.string   "meta_tools"
    t.string   "meta_params"
    t.text     "meta_output"
    t.integer  "element_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.integer "numero_smartlab"
    t.integer "numero_id_interne"
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

  create_table "rnaseqs", :force => true do |t|
    t.string   "rnaseq_name"
    t.string   "data_assoc"
    t.string   "rnaseq_tools"
    t.string   "rnaseq_params"
    t.text     "rnaseq_output"
    t.string   "rnaseq_ref"
    t.string   "rnaseq_tablecount"
    t.integer  "element_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "seizespyros", :force => true do |t|
    t.string   "seize_name"
    t.string   "data_assoc"
    t.string   "seize_tools"
    t.string   "seize_params"
    t.text     "seize_output"
    t.integer  "element_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sequencings", :force => true do |t|
    t.string   "sequencing_name"
    t.string   "paired_end"
    t.string   "distance_cassure"
    t.integer  "element_id"
    t.string   "empcr_assoc"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "spectros", :force => true do |t|
    t.string   "spectro_name"
    t.string   "culture_assoc"
    t.integer  "element_id"
    t.integer  "probe_number"
    t.string   "analyse_type"
    t.string   "sample_type"
    t.text     "attached_files"
    t.integer  "samples_number"
    t.integer  "gel_number"
    t.text     "procedure"
    t.text     "comments"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "submissions", :force => true do |t|
    t.string   "submission_name"
    t.string   "submission_center"
    t.string   "submission_type"
    t.string   "accession_number"
    t.string   "bioproject_id"
    t.integer  "element_id"
    t.string   "sequencing_assoc"
    t.text     "submission_note"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
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
    t.string   "first_name"
    t.string   "position"
    t.text     "user_note"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

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
