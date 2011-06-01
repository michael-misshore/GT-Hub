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

ActiveRecord::Schema.define(:version => 20110525011724) do

  create_table "cars", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "make",                          :null => false
    t.integer  "year"
    t.string   "model",                         :null => false
    t.boolean  "premium",    :default => false
    t.boolean  "standard",   :default => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "message"
    t.integer  "admin_id",   :null => false
    t.integer  "private",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "karma_points", :force => true do |t|
    t.integer  "tuner_id"
    t.integer  "tune_id"
    t.integer  "karma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "group",       :null => false
    t.string   "html_class",  :null => false
    t.string   "html_ref_id", :null => false
  end

  create_table "parts_tunes", :id => false, :force => true do |t|
    t.integer "part_id"
    t.integer "tune_id"
  end

  create_table "tracks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
    t.string   "name"
  end

  create_table "tuners", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tuner_name",                                          :null => false
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "group_id",                            :default => 0,  :null => false
  end

  add_index "tuners", ["email"], :name => "index_tuners_on_email", :unique => true
  add_index "tuners", ["reset_password_token"], :name => "index_tuners_on_reset_password_token", :unique => true
  add_index "tuners", ["tuner_name"], :name => "index_tuners_on_tuner_name", :unique => true

  create_table "tunes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_id"
    t.integer  "tuner_id"
    t.integer  "track_id"
    t.string   "tune_type",                  :default => "Grip", :null => false
    t.integer  "downforce_f"
    t.integer  "downforce_r"
    t.integer  "ballast_amount"
    t.integer  "ballast_position"
    t.integer  "power_limit"
    t.float    "gear_1"
    t.float    "gear_2"
    t.float    "gear_3"
    t.float    "gear_4"
    t.float    "gear_5"
    t.float    "gear_6"
    t.float    "gear_7"
    t.float    "gear_final"
    t.integer  "top_speed"
    t.integer  "initial_torque_f"
    t.integer  "initial_torque_r"
    t.integer  "acceleration_sensitivity_f"
    t.integer  "acceleration_sensitivity_r"
    t.integer  "braking_sensitivity_f"
    t.integer  "braking_sensitivity_r"
    t.integer  "ride_height_f"
    t.integer  "ride_height_r"
    t.float    "spring_rate_f"
    t.float    "spring_rate_r"
    t.integer  "dampners_ext_f"
    t.integer  "dampners_ext_r"
    t.integer  "dampners_comp_f"
    t.integer  "dampners_comp_r"
    t.integer  "anti_roll_bar_f"
    t.integer  "anti_roll_bar_r"
    t.float    "camber_f"
    t.float    "camber_r"
    t.float    "toe_f"
    t.float    "toe_r"
    t.integer  "brake_balance_f"
    t.integer  "brake_balance_r"
    t.integer  "abs"
  end

end
