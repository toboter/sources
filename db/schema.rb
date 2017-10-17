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

ActiveRecord::Schema.define(version: 20171017111700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "comment_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "comment_anc_desc_udx", unique: true
    t.index ["descendant_id"], name: "comment_desc_idx"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "commentator_id", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["commentator_id"], name: "index_comments_on_commentator_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "gid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "user_id"], name: "index_memberships_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "record_activities", id: :serial, force: :cascade do |t|
    t.integer "actor_id"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "activity_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id", "resource_type", "activity_type"], name: "index_record_activities_on_resource_and_activity", unique: true
    t.index ["resource_type", "resource_id"], name: "index_record_activities_on_resource_type_and_resource_id"
  end

  create_table "share_models", id: :serial, force: :cascade do |t|
    t.string "resource_type"
    t.integer "resource_id"
    t.string "shared_to_type"
    t.integer "shared_to_id"
    t.string "shared_from_type"
    t.integer "shared_from_id"
    t.boolean "edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id", "resource_type", "shared_to_id", "shared_to_type"], name: "index_share_models_on_resource_and_shared_to", unique: true
    t.index ["resource_type", "resource_id"], name: "index_share_models_on_resource_type_and_resource_id"
    t.index ["shared_from_type", "shared_from_id"], name: "index_share_models_on_shared_from_type_and_shared_from_id"
    t.index ["shared_to_type", "shared_to_id"], name: "index_share_models_on_shared_to_type_and_shared_to_id"
  end

  create_table "subject_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "subject_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "subject_desc_idx"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "slug"
    t.string "identifier_stable"
    t.string "identifier_temp"
    t.string "type"
    t.jsonb "type_properties"
    t.integer "parent_id"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "birthday"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "app_admin"
    t.string "token"
    t.boolean "app_commentator"
    t.boolean "app_creator"
    t.boolean "app_publisher"
    t.string "image_thumb_url"
  end

  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
end
