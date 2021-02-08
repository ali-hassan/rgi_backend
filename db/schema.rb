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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170627103340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.string   "subtitle"
    t.string   "slug"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "name"
    t.string   "answer_type"
    t.decimal  "value_number"
    t.string   "value_string"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "bubble_graphs", force: :cascade do |t|
    t.integer  "x"
    t.decimal  "y"
    t.decimal  "size"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "average"
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "position"
  end

  create_table "composites", force: :cascade do |t|
    t.decimal  "average"
    t.decimal  "min"
    t.decimal  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "iso"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "group_id"
    t.string   "description"
    t.index ["group_id"], name: "index_countries_on_group_id", using: :btree
  end

  create_table "countries_groups", id: false, force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "country_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_sector_answers", force: :cascade do |t|
    t.decimal  "score"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "country_sector_id"
    t.integer  "answer_id"
    t.index ["answer_id"], name: "index_country_sector_answers_on_answer_id", using: :btree
    t.index ["country_sector_id"], name: "index_country_sector_answers_on_country_sector_id", using: :btree
  end

  create_table "country_sector_categories", force: :cascade do |t|
    t.decimal  "score"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "country_sector_id"
    t.integer  "category_id"
    t.integer  "rank"
    t.index ["category_id"], name: "index_country_sector_categories_on_category_id", using: :btree
    t.index ["country_sector_id"], name: "index_country_sector_categories_on_country_sector_id", using: :btree
  end

  create_table "country_sector_indicators", force: :cascade do |t|
    t.decimal  "score"
    t.integer  "rank"
    t.integer  "country_sector_id"
    t.integer  "indicator_id"
    t.integer  "country_sector_subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_sector_id"], name: "index_country_sector_indicators_on_country_sector_id", using: :btree
    t.index ["indicator_id"], name: "index_country_sector_indicators_on_indicator_id", using: :btree
  end

  create_table "country_sector_questions", force: :cascade do |t|
    t.decimal  "score"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "country_sector_id"
    t.integer  "question_id"
    t.integer  "rank"
    t.string   "status"
    t.text     "researcher_justification"
    t.string   "researcher_score"
    t.text     "reviewer_justification"
    t.string   "reviewer_score"
    t.text     "final_score_justification"
    t.string   "final_score"
    t.integer  "country_sector_indicator_id"
    t.index ["country_sector_id"], name: "index_country_sector_questions_on_country_sector_id", using: :btree
    t.index ["question_id"], name: "index_country_sector_questions_on_question_id", using: :btree
  end

  create_table "country_sector_subcategories", force: :cascade do |t|
    t.decimal  "score"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "country_sector_id"
    t.integer  "subcategory_id"
    t.integer  "rank"
    t.integer  "country_sector_category_id"
    t.index ["country_sector_id"], name: "index_country_sector_subcategories_on_country_sector_id", using: :btree
    t.index ["subcategory_id"], name: "index_country_sector_subcategories_on_subcategory_id", using: :btree
  end

  create_table "country_sectors", force: :cascade do |t|
    t.text     "description"
    t.decimal  "score"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "country_id"
    t.integer  "sector_id"
    t.integer  "rank"
    t.string   "performance_title"
    t.text     "performance_highlights_top"
    t.string   "comparison_title"
    t.text     "comparison_description"
    t.string   "graph_type"
    t.text     "performance_highlights_bottom"
    t.text     "graph_text"
    t.text     "footnote"
    t.integer  "pl_graph_id"
    t.integer  "bubble_graph_id"
    t.integer  "direction_graph_id"
    t.text     "methodology"
    t.index ["bubble_graph_id"], name: "index_country_sectors_on_bubble_graph_id", using: :btree
    t.index ["country_id"], name: "index_country_sectors_on_country_id", using: :btree
    t.index ["direction_graph_id"], name: "index_country_sectors_on_direction_graph_id", using: :btree
    t.index ["pl_graph_id"], name: "index_country_sectors_on_pl_graph_id", using: :btree
    t.index ["sector_id"], name: "index_country_sectors_on_sector_id", using: :btree
  end

  create_table "direction_graphs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "direction_scores", force: :cascade do |t|
    t.integer  "direction_graph_id"
    t.string   "issue"
    t.integer  "score"
    t.string   "direction"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["direction_graph_id"], name: "index_direction_scores_on_direction_graph_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "about_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "home_informations", force: :cascade do |t|
    t.string   "section"
    t.string   "title"
    t.string   "subtitle"
    t.text     "text"
    t.string   "link_text"
    t.string   "link_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.integer  "about_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "subcategory_id"
    t.decimal  "average"
    t.decimal  "min"
    t.decimal  "max"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.index ["subcategory_id"], name: "index_indicators_on_subcategory_id", using: :btree
  end

  create_table "media_center_resources", force: :cascade do |t|
    t.string   "type"
    t.string   "link"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer  "position"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.date     "post_date"
    t.string   "slug"
  end

  create_table "pl_graphs", force: :cascade do |t|
    t.integer  "practice"
    t.integer  "law"
    t.integer  "gap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "description"
    t.integer  "number"
    t.integer  "indicator_id"
    t.integer  "position"
    t.index ["indicator_id"], name: "index_questions_on_indicator_id", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_institutions", force: :cascade do |t|
    t.string   "institution_type"
    t.string   "title"
    t.integer  "country_sector_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "description"
    t.string   "name"
    t.integer  "percentage"
    t.integer  "revenue_value"
    t.string   "revenue_unit"
    t.integer  "score"
    t.integer  "rank_1"
    t.integer  "rank_2"
    t.index ["country_sector_id"], name: "index_special_institutions_on_country_sector_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "source"
    t.decimal  "average"
    t.decimal  "min"
    t.decimal  "max"
    t.integer  "position"
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  add_foreign_key "country_sector_indicators", "country_sectors"
  add_foreign_key "country_sector_indicators", "indicators"
  add_foreign_key "indicators", "subcategories"
  add_foreign_key "special_institutions", "country_sectors"
end
