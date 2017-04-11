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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170409171149) do

  create_table "advertisements", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.string   "link_url"
    t.boolean  "is_link_url_global"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
    t.boolean  "enabled",                      default: false
  end

  create_table "amount_logs", force: true do |t|
    t.integer  "timestamp",     limit: 8
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.integer  "day_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.integer  "user_id"
    t.integer  "before_amount"
    t.integer  "after_amount"
    t.string   "sync_uuid"
  end

  add_index "amount_logs", ["day_id"], name: "index_amount_logs_on_day_id", using: :btree
  add_index "amount_logs", ["sync_uuid"], name: "index_amount_logs_on_sync_uuid", using: :btree
  add_index "amount_logs", ["user_id"], name: "index_amount_logs_on_user_id", using: :btree

  create_table "amount_ranges", force: true do |t|
    t.integer  "start_point"
    t.integer  "end_point"
    t.integer  "done_amount"
    t.string   "local_id"
    t.integer  "day_id"
    t.integer  "user_id"
    t.boolean  "archived",              default: false
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
  end

  add_index "amount_ranges", ["day_id"], name: "index_amount_ranges_on_day_id", using: :btree
  add_index "amount_ranges", ["user_id"], name: "index_amount_ranges_on_user_id", using: :btree

  create_table "auto_matching_logs", force: true do |t|
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "cache_series_by_groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.text     "data"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "cache_series_by_groups", ["group_id"], name: "index_cache_series_by_groups_on_group_id", using: :btree

  create_table "cache_series_by_studymates", force: true do |t|
    t.integer  "studymate_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.text     "data"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "cache_series_by_studymates", ["studymate_id"], name: "index_cache_series_by_studymates_on_studymate_id", using: :btree

  create_table "cache_top_class_avgs", force: true do |t|
    t.integer  "group_goal_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.text     "data"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
  end

  add_index "cache_top_class_avgs", ["group_goal_id"], name: "index_cache_top_class_avgs_on_group_goal_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.integer  "user_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.integer  "priority",                default: 0
    t.string   "category_type",           default: "study"
    t.boolean  "hidden",                  default: false
    t.string   "sync_uuid"
  end

  add_index "categories", ["sync_uuid"], name: "index_categories_on_sync_uuid", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "chat_prevent_messages", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "tag_name"
    t.boolean  "is_default", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_logs", force: true do |t|
    t.integer  "day_id"
    t.integer  "user_id"
    t.boolean  "before_checked"
    t.boolean  "after_checked"
    t.integer  "timestamp"
    t.string   "local_id"
    t.datetime "created_at",     limit: 3
    t.datetime "updated_at",     limit: 3
    t.integer  "review_day_id"
    t.string   "sync_uuid"
    t.boolean  "archived",                 default: false
  end

  add_index "check_logs", ["day_id"], name: "index_check_logs_on_day_id", using: :btree
  add_index "check_logs", ["review_day_id"], name: "index_check_logs_on_review_day_id", using: :btree
  add_index "check_logs", ["sync_uuid"], name: "index_check_logs_on_sync_uuid", using: :btree
  add_index "check_logs", ["user_id"], name: "index_check_logs_on_user_id", using: :btree

  create_table "cheer_log_realtimes", force: true do |t|
    t.integer  "date"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "group_members_count",   default: 0
    t.text     "group_member_ids"
    t.integer  "comments_count",        default: 0
    t.text     "commented_user_ids"
    t.integer  "commented_users_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cheer_log_realtimes", ["date"], name: "index_cheer_log_realtimes_on_date", using: :btree
  add_index "cheer_log_realtimes", ["group_id"], name: "index_cheer_log_realtimes_on_group_id", using: :btree
  add_index "cheer_log_realtimes", ["user_id"], name: "index_cheer_log_realtimes_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                       default: "comments"
    t.datetime "created_at",       limit: 3
    t.datetime "updated_at",       limit: 3
    t.boolean  "archived",                   default: false
    t.text     "images"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "cron_execution_logs", force: true do |t|
    t.string   "body"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "current_versions", force: true do |t|
    t.string   "platform",       limit: 20, null: false
    t.string   "build_type",     limit: 20, null: false
    t.integer  "version_number"
    t.datetime "created_at",     limit: 3
    t.datetime "updated_at",     limit: 3
    t.string   "description"
  end

  add_index "current_versions", ["platform", "build_type"], name: "index_current_versions_on_platform_and_build_type", unique: true, using: :btree

  create_table "custom_days", force: true do |t|
    t.integer  "date"
    t.boolean  "is_activated"
    t.boolean  "expect_check"
    t.integer  "expect_amount"
    t.integer  "expect_second"
    t.boolean  "archived"
    t.string   "sync_uuid"
    t.integer  "task_date_id"
    t.integer  "user_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
  end

  create_table "custom_push_sent_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "custom_push_sent_logs", ["user_id"], name: "index_custom_push_sent_logs_on_user_id", using: :btree

  create_table "d_days", force: true do |t|
    t.string   "name",                  default: ""
    t.integer  "date"
    t.boolean  "archived",              default: false
    t.string   "local_id"
    t.integer  "user_id"
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
    t.string   "sync_uuid"
    t.boolean  "is_selected",           default: true
  end

  add_index "d_days", ["sync_uuid"], name: "index_d_days_on_sync_uuid", using: :btree
  add_index "d_days", ["user_id"], name: "index_d_days_on_user_id", using: :btree

  create_table "daily_feedback_extras", force: true do |t|
    t.text     "formatted_text"
    t.integer  "running_day"
    t.boolean  "is_default"
    t.boolean  "is_active"
    t.boolean  "boolean"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_demo",        default: false
  end

  create_table "daily_feedback_finishers", force: true do |t|
    t.integer  "daily_report_id"
    t.text     "formatted_text"
    t.integer  "date"
    t.boolean  "is_default",                default: false, null: false
    t.datetime "created_at",      limit: 3
    t.datetime "updated_at",      limit: 3
    t.integer  "running_day"
    t.boolean  "is_active"
    t.boolean  "is_demo",                   default: false
  end

  add_index "daily_feedback_finishers", ["daily_report_id"], name: "index_daily_feedback_finishers_on_daily_report_id", using: :btree

  create_table "daily_feedback_for_concentrations", force: true do |t|
    t.integer  "user_category_id"
    t.text     "formatted_text"
    t.integer  "running_day"
    t.boolean  "is_default"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_demo",          default: false
  end

  create_table "daily_feedback_for_results", force: true do |t|
    t.integer  "user_category_id"
    t.text     "formatted_text"
    t.integer  "running_day"
    t.boolean  "is_default"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_demo",          default: false
  end

  create_table "daily_feedback_starters", force: true do |t|
    t.text     "formatted_text"
    t.integer  "running_day"
    t.boolean  "is_default"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_demo",        default: false
  end

  create_table "daily_feedbacks", force: true do |t|
    t.integer  "user_category_id"
    t.string   "categorized_by"
    t.text     "formatted_text"
    t.integer  "date"
    t.boolean  "is_default",                 default: false, null: false
    t.datetime "created_at",       limit: 3
    t.datetime "updated_at",       limit: 3
  end

  add_index "daily_feedbacks", ["user_category_id"], name: "index_daily_feedbacks_on_user_category_id", using: :btree

  create_table "daily_push_messages", force: true do |t|
    t.integer  "running_day"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_reports", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_category_by_result_id"
    t.integer  "user_category_by_concentration_id"
    t.integer  "daily_feedback_finisher_id"
    t.integer  "date"
    t.text     "prepared_data"
    t.datetime "created_at",                          limit: 3
    t.datetime "updated_at",                          limit: 3
    t.boolean  "is_read",                                       default: false
    t.integer  "manager_id"
    t.integer  "studymate_program_id"
    t.text     "yesterday_resolution"
    t.integer  "daily_feedback_starter_id"
    t.integer  "daily_feedback_for_result_id"
    t.integer  "daily_feedback_for_concentration_id"
    t.integer  "daily_feedback_extra_id"
    t.integer  "running_day"
    t.integer  "studymate_approval_id"
    t.boolean  "is_demo",                                       default: false
  end

  add_index "daily_reports", ["daily_feedback_extra_id"], name: "index_daily_reports_on_daily_feedback_extra_id", using: :btree
  add_index "daily_reports", ["daily_feedback_finisher_id"], name: "index_daily_reports_on_daily_feedback_finisher_id", using: :btree
  add_index "daily_reports", ["manager_id"], name: "index_daily_reports_on_manager_id", using: :btree
  add_index "daily_reports", ["studymate_approval_id"], name: "index_daily_reports_on_studymate_approval_id", using: :btree
  add_index "daily_reports", ["studymate_program_id"], name: "index_daily_reports_on_studymate_program_id", using: :btree
  add_index "daily_reports", ["user_category_by_concentration_id"], name: "index_daily_reports_on_user_category_by_concentration_id", using: :btree
  add_index "daily_reports", ["user_category_by_result_id"], name: "index_daily_reports_on_user_category_by_result_id", using: :btree
  add_index "daily_reports", ["user_id"], name: "index_daily_reports_on_user_id", using: :btree

  create_table "daily_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "date"
    t.integer  "achievement_rate"
    t.integer  "done_second"
    t.boolean  "state",                      default: false
    t.datetime "created_at",       limit: 3
    t.datetime "updated_at",       limit: 3
    t.integer  "timestamp",        limit: 8
  end

  add_index "daily_statuses", ["date"], name: "index_daily_statuses_on_date", using: :btree
  add_index "daily_statuses", ["user_id", "date"], name: "index_daily_statuses_on_user_id_and_date", using: :btree
  add_index "daily_statuses", ["user_id"], name: "index_daily_statuses_on_user_id", using: :btree

  create_table "daily_total_results", force: true do |t|
    t.integer  "achievement_rate"
    t.integer  "done_second"
    t.integer  "date"
    t.boolean  "archived",                   default: false
    t.string   "local_id"
    t.integer  "user_id"
    t.datetime "created_at",       limit: 3
    t.datetime "updated_at",       limit: 3
    t.string   "sync_uuid"
  end

  add_index "daily_total_results", ["date"], name: "index_daily_total_results_on_date", using: :btree
  add_index "daily_total_results", ["sync_uuid"], name: "index_daily_total_results_on_sync_uuid", using: :btree
  add_index "daily_total_results", ["user_id", "date"], name: "index_daily_total_results_on_user_id_and_date", using: :btree
  add_index "daily_total_results", ["user_id"], name: "index_daily_total_results_on_user_id", using: :btree

  create_table "days", force: true do |t|
    t.integer  "expect_amount",           default: 0
    t.integer  "done_amount",             default: 0
    t.integer  "date"
    t.integer  "done_second",             default: 0
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.integer  "task_date_id",                            null: false
    t.integer  "user_id"
    t.boolean  "off",                     default: false
    t.boolean  "done"
    t.float    "score",                   default: 0.0
    t.integer  "expect_second"
    t.string   "sync_uuid"
    t.boolean  "expect_check",            default: true,  null: false
  end

  add_index "days", ["date"], name: "index_days_on_date", using: :btree
  add_index "days", ["sync_uuid"], name: "index_days_on_sync_uuid", using: :btree
  add_index "days", ["task_date_id"], name: "index_days_on_task_date_id", using: :btree
  add_index "days", ["user_id"], name: "index_days_on_user_id", using: :btree

  create_table "delete_my_accounts", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.string   "user_email"
    t.string   "user_name"
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
  end

  add_index "delete_my_accounts", ["user_id"], name: "index_delete_my_accounts_on_user_id", using: :btree

  create_table "devices", force: true do |t|
    t.text     "uuid"
    t.string   "platform",                       default: "none", null: false
    t.datetime "created_at",           limit: 3
    t.datetime "updated_at",           limit: 3
    t.string   "one_signal_player_id"
    t.string   "name"
  end

  add_index "devices", ["uuid"], name: "index_devices_on_uuid", length: {"uuid"=>32}, using: :btree

  create_table "diaries", force: true do |t|
    t.text     "body"
    t.integer  "timestamp",  limit: 8
    t.boolean  "archived",             default: false
    t.integer  "day_id"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
    t.integer  "user_id"
    t.string   "local_id"
    t.text     "images"
    t.string   "sync_uuid"
    t.boolean  "edited",               default: false
  end

  add_index "diaries", ["day_id"], name: "index_diaries_on_day_id", using: :btree
  add_index "diaries", ["sync_uuid"], name: "index_diaries_on_sync_uuid", using: :btree
  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "discount_coupons", force: true do |t|
    t.string   "code"
    t.integer  "discount_couponable_id"
    t.string   "discount_couponable_type"
    t.integer  "discount_policy_id"
    t.boolean  "expired",                            default: false
    t.boolean  "is_used",                            default: false
    t.datetime "created_at",               limit: 3
    t.datetime "updated_at",               limit: 3
    t.boolean  "is_permanent",                       default: false
    t.string   "tags"
  end

  add_index "discount_coupons", ["discount_couponable_id", "discount_couponable_type"], name: "idx_discount_couponable_pair", using: :btree
  add_index "discount_coupons", ["discount_policy_id"], name: "index_discount_coupons_on_discount_policy_id", using: :btree

  create_table "discount_policies", force: true do |t|
    t.integer  "priority_method"
    t.integer  "discount_amount"
    t.float    "discount_percentage"
    t.integer  "special_amount"
    t.datetime "created_at",                   limit: 3
    t.datetime "updated_at",                   limit: 3
    t.string   "name"
    t.string   "default_class_name"
    t.boolean  "enabled",                                default: false
    t.string   "changeable_imp_product_alias"
  end

  create_table "feeds", force: true do |t|
    t.integer  "user_id"
    t.integer  "feedable_id"
    t.string   "feedable_type"
    t.datetime "logged_at",       limit: 3
    t.datetime "created_at",      limit: 3
    t.datetime "updated_at",      limit: 3
    t.boolean  "private",                   default: true
    t.boolean  "visible",                   default: true
    t.boolean  "archived",                  default: false
    t.integer  "cached_votes_up",           default: 0
  end

  add_index "feeds", ["cached_votes_up"], name: "index_feeds_on_cached_votes_up", using: :btree
  add_index "feeds", ["feedable_id", "feedable_type"], name: "index_feeds_on_feedable_id_and_feedable_type", using: :btree
  add_index "feeds", ["feedable_id"], name: "index_feeds_on_feedable_id", using: :btree
  add_index "feeds", ["feedable_type"], name: "index_feeds_on_feedable_type", using: :btree
  add_index "feeds", ["user_id", "logged_at"], name: "index_feeds_on_user_id_and_logged_at", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "goal_details", force: true do |t|
    t.integer  "goal_id"
    t.string   "title"
    t.string   "locale"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.integer  "group_goal_id"
  end

  add_index "goal_details", ["goal_id"], name: "index_goal_details_on_goal_id", using: :btree
  add_index "goal_details", ["group_goal_id"], name: "index_goal_details_on_group_goal_id", using: :btree

  create_table "goals", force: true do |t|
    t.string   "title"
    t.string   "locale"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "goalships", force: true do |t|
    t.integer  "goal_detail_id"
    t.integer  "relationship_id"
    t.string   "relationship_type"
    t.datetime "created_at",            limit: 3
    t.datetime "updated_at",            limit: 3
    t.string   "sync_uuid"
    t.integer  "second_goal_detail_id"
    t.integer  "third_goal_detail_id"
  end

  add_index "goalships", ["goal_detail_id", "relationship_id", "relationship_type"], name: "index_of_goal_detail", using: :btree
  add_index "goalships", ["goal_detail_id"], name: "index_goalships_on_goal_detail_id", using: :btree
  add_index "goalships", ["relationship_id", "relationship_type"], name: "index_goalships_on_relationship_id_and_relationship_type", using: :btree
  add_index "goalships", ["second_goal_detail_id"], name: "index_goalships_on_second_goal_detail_id", using: :btree
  add_index "goalships", ["sync_uuid"], name: "index_goalships_on_sync_uuid", using: :btree
  add_index "goalships", ["third_goal_detail_id"], name: "index_goalships_on_third_goal_detail_id", using: :btree

  create_table "golden_egg_event_logs", force: true do |t|
    t.integer  "imp_purchase_id"
    t.integer  "buyer_id"
    t.integer  "recommended_user_id"
    t.string   "note"
    t.integer  "amount_buyer"
    t.integer  "amount_recommended_user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_valid"
  end

  add_index "golden_egg_event_logs", ["buyer_id"], name: "index_golden_egg_event_logs_on_buyer_id", using: :btree
  add_index "golden_egg_event_logs", ["imp_purchase_id"], name: "index_golden_egg_event_logs_on_imp_purchase_id", using: :btree
  add_index "golden_egg_event_logs", ["recommended_user_id"], name: "index_golden_egg_event_logs_on_recommended_user_id", using: :btree

  create_table "google_in_app_payments", force: true do |t|
    t.integer  "in_app_purchase_id"
    t.text     "order_id"
    t.text     "product_id"
    t.text     "purchase_token"
    t.text     "signature"
    t.text     "developer_payload"
    t.integer  "purchase_time",      limit: 8
    t.boolean  "auto_renewing"
    t.text     "data"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
  end

  add_index "google_in_app_payments", ["in_app_purchase_id"], name: "index_google_in_app_payments_on_in_app_purchase_id", using: :btree

  create_table "google_in_app_products", force: true do |t|
    t.integer  "in_app_product_id"
    t.text     "product_id",                  null: false
    t.datetime "created_at",        limit: 3
    t.datetime "updated_at",        limit: 3
  end

  add_index "google_in_app_products", ["in_app_product_id"], name: "index_google_in_app_products_on_in_app_product_id", using: :btree

  create_table "google_transactions", force: true do |t|
    t.integer  "in_app_purchase_id"
    t.integer  "user_id"
    t.string   "order_id"
    t.text     "product_id"
    t.text     "purchase_token"
    t.text     "signature"
    t.text     "developer_payload"
    t.integer  "purchase_time",      limit: 8
    t.boolean  "auto_renewing"
    t.text     "data"
    t.string   "transaction_type"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
  end

  add_index "google_transactions", ["in_app_purchase_id"], name: "index_google_transactions_on_in_app_purchase_id", using: :btree
  add_index "google_transactions", ["order_id"], name: "index_google_transactions_on_order_id", unique: true, using: :btree
  add_index "google_transactions", ["user_id"], name: "index_google_transactions_on_user_id", using: :btree

  create_table "group_goals", force: true do |t|
    t.string   "title"
    t.string   "locale"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "group_invites", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "disabled",             default: false
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "group_invites", ["group_id"], name: "index_group_invites_on_group_id", using: :btree
  add_index "group_invites", ["user_id", "group_id"], name: "index_group_invites_on_user_id_and_group_id", using: :btree
  add_index "group_invites", ["user_id"], name: "index_group_invites_on_user_id", using: :btree

  create_table "group_notice_articles", force: true do |t|
    t.integer  "manager_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "is_published"
    t.integer  "published_at"
    t.integer  "reserved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_notice_articles", ["manager_id"], name: "index_group_notice_articles_on_manager_id", using: :btree

  create_table "group_notice_read_flags", force: true do |t|
    t.integer  "group_notice_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_notice_read_flags", ["group_notice_id"], name: "index_group_notice_read_flags_on_group_notice_id", using: :btree
  add_index "group_notice_read_flags", ["user_id"], name: "index_group_notice_read_flags_on_user_id", using: :btree

  create_table "group_notices", force: true do |t|
    t.integer  "group_id"
    t.integer  "group_notice_article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_up",         default: 0
    t.boolean  "is_visible",              default: true
    t.integer  "noticeable_id"
    t.string   "noticeable_type"
  end

  add_index "group_notices", ["cached_votes_up"], name: "index_group_notices_on_cached_votes_up", using: :btree
  add_index "group_notices", ["group_id"], name: "index_group_notices_on_group_id", using: :btree
  add_index "group_notices", ["group_notice_article_id"], name: "index_group_notices_on_group_notice_article_id", using: :btree
  add_index "group_notices", ["noticeable_id", "noticeable_type"], name: "index_group_notices_on_noticeable_id_and_noticeable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "join_code"
    t.string   "finish_time",                    default: "04:00"
    t.integer  "max_membership",                 default: 7
    t.datetime "created_at",           limit: 3
    t.datetime "updated_at",           limit: 3
    t.string   "group_type",                     default: "auto"
    t.integer  "group_goal_id"
    t.string   "group_image"
    t.boolean  "is_study_mate",                  default: false
    t.integer  "studymate_program_id"
    t.integer  "studymate_type_id"
    t.integer  "manager_id"
    t.boolean  "is_temp",                        default: false
  end

  add_index "groups", ["group_goal_id"], name: "index_groups_on_group_goal_id", using: :btree
  add_index "groups", ["manager_id"], name: "index_groups_on_manager_id", using: :btree
  add_index "groups", ["studymate_program_id"], name: "index_groups_on_studymate_program_id", using: :btree
  add_index "groups", ["studymate_type_id"], name: "index_groups_on_studymate_type_id", using: :btree

  create_table "imp_free_purchases", force: true do |t|
    t.integer  "user_id"
    t.string   "product_name"
    t.integer  "service_second"
    t.integer  "purchased_at"
    t.integer  "refunded_at"
    t.integer  "imp_product_id"
    t.integer  "extender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imp_free_purchases", ["extender_id"], name: "index_imp_free_purchases_on_extender_id", using: :btree
  add_index "imp_free_purchases", ["imp_product_id"], name: "index_imp_free_purchases_on_imp_product_id", using: :btree
  add_index "imp_free_purchases", ["user_id"], name: "index_imp_free_purchases_on_user_id", using: :btree

  create_table "imp_merchants", force: true do |t|
    t.integer  "user_id"
    t.integer  "imp_product_id"
    t.integer  "prev_imp_merchant_id"
    t.integer  "next_imp_merchant_id"
    t.string   "merchant_uid"
    t.integer  "seq_index"
    t.integer  "expected_amount"
    t.string   "customer_uid"
    t.integer  "schedule_at"
    t.boolean  "is_processed",                          default: false
    t.datetime "created_at",                  limit: 3
    t.datetime "updated_at",                  limit: 3
    t.integer  "imp_subscription_history_id"
    t.string   "expected_user_email"
    t.integer  "discount_coupon_id"
    t.integer  "studymate_approval_id"
  end

  add_index "imp_merchants", ["discount_coupon_id"], name: "index_imp_merchants_on_discount_coupon_id", using: :btree
  add_index "imp_merchants", ["imp_product_id"], name: "index_imp_merchants_on_imp_product_id", using: :btree
  add_index "imp_merchants", ["imp_subscription_history_id"], name: "index_imp_merchants_on_imp_subscription_history_id", using: :btree
  add_index "imp_merchants", ["merchant_uid"], name: "index_imp_merchants_on_merchant_uid", using: :btree
  add_index "imp_merchants", ["next_imp_merchant_id"], name: "index_imp_merchants_on_next_imp_merchant_id", using: :btree
  add_index "imp_merchants", ["prev_imp_merchant_id"], name: "index_imp_merchants_on_prev_imp_merchant_id", using: :btree
  add_index "imp_merchants", ["studymate_approval_id"], name: "index_imp_merchants_on_studymate_approval_id", using: :btree
  add_index "imp_merchants", ["user_id"], name: "index_imp_merchants_on_user_id", using: :btree

  create_table "imp_product_availables", force: true do |t|
    t.integer  "imp_product_id"
    t.integer  "available_model_id"
    t.string   "available_model_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imp_product_availables", ["available_model_id", "available_model_type"], name: "available_model", using: :btree
  add_index "imp_product_availables", ["imp_product_id"], name: "index_imp_product_availables_on_imp_product_id", using: :btree

  create_table "imp_products", force: true do |t|
    t.string   "name"
    t.string   "product_type"
    t.integer  "amount"
    t.boolean  "use_seq_amounts"
    t.string   "seq_amounts"
    t.string   "subscription_term_type"
    t.integer  "subscription_term_length"
    t.string   "service_term_type"
    t.integer  "service_term_length"
    t.datetime "created_at",               limit: 3
    t.datetime "updated_at",               limit: 3
    t.boolean  "is_subscription"
    t.boolean  "is_default",                         default: false
    t.integer  "payback_amount"
    t.boolean  "should_extend",                      default: false
    t.string   "alias"
    t.boolean  "can_use_chat",                       default: true
    t.string   "can_use_chat_reason"
  end

  create_table "imp_purchases", force: true do |t|
    t.integer  "user_id"
    t.integer  "imp_transaction_id"
    t.string   "product_name"
    t.integer  "service_second"
    t.integer  "service_studymate_point"
    t.integer  "paid_amount"
    t.integer  "purchased_at"
    t.integer  "refunded_at"
    t.datetime "created_at",              limit: 3
    t.datetime "updated_at",              limit: 3
    t.string   "code"
    t.integer  "code_registered_at"
    t.integer  "approved_at"
    t.integer  "imp_product_id"
    t.boolean  "is_tracked",                        default: false
  end

  add_index "imp_purchases", ["imp_product_id"], name: "index_imp_purchases_on_imp_product_id", using: :btree
  add_index "imp_purchases", ["imp_transaction_id"], name: "index_imp_purchases_on_imp_transaction_id", using: :btree
  add_index "imp_purchases", ["purchased_at"], name: "index_imp_purchases_on_purchased_at", using: :btree
  add_index "imp_purchases", ["refunded_at"], name: "index_imp_purchases_on_refunded_at", using: :btree
  add_index "imp_purchases", ["user_id"], name: "index_imp_purchases_on_user_id", using: :btree

  create_table "imp_subscription_histories", force: true do |t|
    t.integer  "user_id"
    t.string   "customer_uid"
    t.integer  "started_at"
    t.integer  "ended_at"
    t.integer  "revoked_at"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "imp_subscription_histories", ["user_id"], name: "index_imp_subscription_histories_on_user_id", using: :btree

  create_table "imp_transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "imp_merchant_id"
    t.string   "imp_uid"
    t.string   "merchant_uid"
    t.string   "pay_method"
    t.string   "pg_provider"
    t.string   "pg_tid"
    t.boolean  "escrow"
    t.string   "apply_num"
    t.string   "card_name"
    t.integer  "card_quota"
    t.string   "vbank_name"
    t.string   "vbank_num"
    t.string   "vbank_holder"
    t.integer  "vbank_date"
    t.string   "name"
    t.integer  "amount"
    t.integer  "cancel_amount"
    t.string   "buyer_name"
    t.string   "buyer_email"
    t.string   "buyer_tel"
    t.string   "buyer_addr"
    t.string   "buyer_postcode"
    t.string   "custom_data"
    t.string   "user_agent"
    t.string   "status"
    t.integer  "paid_at"
    t.integer  "failed_at"
    t.integer  "cancelled_at"
    t.string   "fail_reason"
    t.string   "cancel_reason"
    t.string   "receipt_url"
    t.text     "cancel_receipt_urls"
    t.boolean  "is_amount_valid",               default: false
    t.boolean  "is_processed",                  default: false
    t.boolean  "is_error",                      default: false
    t.datetime "created_at",          limit: 3
    t.datetime "updated_at",          limit: 3
    t.string   "currency"
    t.boolean  "is_sms_sent",                   default: false
    t.boolean  "marketing_agreement"
    t.integer  "recommended_user_id"
  end

  add_index "imp_transactions", ["imp_merchant_id"], name: "index_imp_transactions_on_imp_merchant_id", using: :btree
  add_index "imp_transactions", ["imp_uid"], name: "index_imp_transactions_on_imp_uid", using: :btree
  add_index "imp_transactions", ["merchant_uid"], name: "index_imp_transactions_on_merchant_uid", using: :btree
  add_index "imp_transactions", ["pay_method"], name: "index_imp_transactions_on_pay_method", using: :btree
  add_index "imp_transactions", ["recommended_user_id"], name: "index_imp_transactions_on_recommended_user_id", using: :btree
  add_index "imp_transactions", ["status"], name: "index_imp_transactions_on_status", using: :btree
  add_index "imp_transactions", ["user_id"], name: "index_imp_transactions_on_user_id", using: :btree
  add_index "imp_transactions", ["vbank_date"], name: "index_imp_transactions_on_vbank_date", using: :btree

  create_table "in_app_demo_intro_images", force: true do |t|
    t.string   "image"
    t.string   "note"
    t.integer  "priority"
    t.boolean  "enabled",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "in_app_panel_images", force: true do |t|
    t.string   "image",                                null: false
    t.text     "note"
    t.integer  "priority",              default: 0
    t.boolean  "disabled",              default: true
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
    t.string   "url_address"
  end

  add_index "in_app_panel_images", ["priority"], name: "index_in_app_panel_images_on_priority", using: :btree

  create_table "in_app_products", force: true do |t|
    t.string   "category"
    t.string   "name",                          null: false
    t.text     "description"
    t.string   "status",                        null: false
    t.string   "in_app_product_type",           null: false
    t.string   "subscription_period"
    t.float    "default_price"
    t.string   "default_currency"
    t.datetime "created_at",          limit: 3
    t.datetime "updated_at",          limit: 3
  end

  create_table "in_app_purchases", force: true do |t|
    t.integer  "user_id"
    t.integer  "in_app_product_id"
    t.integer  "started_at",        limit: 8
    t.integer  "expiry_at",         limit: 8
    t.boolean  "expired",                     default: true
    t.datetime "created_at",        limit: 3
    t.datetime "updated_at",        limit: 3
  end

  add_index "in_app_purchases", ["in_app_product_id"], name: "index_in_app_purchases_on_in_app_product_id", using: :btree
  add_index "in_app_purchases", ["user_id"], name: "index_in_app_purchases_on_user_id", using: :btree

  create_table "invites", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "invites", ["recipient_id"], name: "index_invites_on_recipient_id", unique: true, using: :btree

  create_table "landing_page_automatics", force: true do |t|
    t.integer  "man_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managerables", force: true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managerables", ["user_id"], name: "index_managerables_on_user_id", using: :btree

  create_table "managers", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", limit: 3
    t.datetime "remember_created_at",    limit: 3
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at",     limit: 3
    t.datetime "last_sign_in_at",        limit: 3
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             limit: 3
    t.datetime "updated_at",             limit: 3
    t.string   "name"
    t.string   "profile_image"
    t.string   "description"
    t.integer  "user_id"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "master_envs", force: true do |t|
    t.integer  "master_id"
    t.integer  "date"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "master_envs", ["manager_id"], name: "index_master_envs_on_manager_id", using: :btree
  add_index "master_envs", ["master_id"], name: "index_master_envs_on_master_id", using: :btree

  create_table "masters", force: true do |t|
    t.string   "email",                        default: "", null: false
    t.string   "encrypted_password",           default: "", null: false
    t.integer  "sign_in_count",                default: 0,  null: false
    t.datetime "current_sign_in_at", limit: 3
    t.datetime "last_sign_in_at",    limit: 3
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",              default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at",          limit: 3
    t.datetime "created_at",         limit: 3,              null: false
    t.datetime "updated_at",         limit: 3,              null: false
    t.integer  "date"
    t.integer  "manager_id"
  end

  add_index "masters", ["email"], name: "index_masters_on_email", unique: true, using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "role",                           default: "member"
    t.string   "one_signal_player_id"
    t.datetime "created_at",           limit: 3
    t.datetime "updated_at",           limit: 3
  end

  add_index "memberships", ["group_id", "user_id"], name: "index_memberships_on_group_id_and_user_id", unique: true, using: :btree
  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "mentions", force: true do |t|
    t.integer  "mentionee_id"
    t.string   "mentionee_type"
    t.integer  "mentioner_id"
    t.string   "mentioner_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "mentions", ["mentionee_id", "mentionee_type", "mentioner_id", "mentioner_type"], name: "mentions_mentionee_mentioner_idx", unique: true, using: :btree
  add_index "mentions", ["mentionee_id", "mentionee_type"], name: "mentions_mentionee_idx", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "mentions_mentioner_idx", using: :btree

  create_table "migration_check_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "migration_from"
    t.string   "migration_to"
    t.integer  "from_min_id"
    t.integer  "from_max_id"
    t.integer  "from_selected_count"
    t.integer  "dest_before_next_id"
    t.integer  "dest_after_next_id"
    t.integer  "dest_expect_count"
    t.boolean  "success",                       default: false
    t.datetime "started_at",          limit: 3
    t.datetime "completed_at",        limit: 3
    t.datetime "created_at",          limit: 3
    t.datetime "updated_at",          limit: 3
  end

  add_index "migration_check_logs", ["user_id", "migration_from"], name: "index_migration_check_logs_on_user_id_and_migration_from", unique: true, using: :btree
  add_index "migration_check_logs", ["user_id"], name: "index_migration_check_logs_on_user_id", using: :btree

  create_table "millstone_logs", force: true do |t|
    t.text     "before"
    t.text     "after"
    t.text     "manual"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "mission_scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "date"
    t.boolean  "wus_state",                           default: false
    t.integer  "wus_ts"
    t.boolean  "pss_state",                           default: false
    t.integer  "pss_ts"
    t.boolean  "pfs_state",                           default: false
    t.integer  "pfs_ts"
    t.boolean  "ar_state",                            default: false
    t.integer  "ar_ts"
    t.integer  "ar_max"
    t.boolean  "ds_state",                            default: false
    t.integer  "ds_ts"
    t.integer  "ds_max"
    t.integer  "comments_cnt",                        default: 0
    t.text     "commented_other_user_ids"
    t.integer  "commented_other_users_cnt",           default: 0
    t.integer  "group_members_cnt_min"
    t.integer  "group_members_cnt_max"
    t.datetime "created_at",                limit: 3
    t.datetime "updated_at",                limit: 3
    t.boolean  "force_activity_full",                 default: false
    t.boolean  "force_social_full",                   default: false
  end

  add_index "mission_scores", ["group_id"], name: "index_mission_scores_on_group_id", using: :btree
  add_index "mission_scores", ["user_id"], name: "index_mission_scores_on_user_id", using: :btree

  create_table "monthly_report_publish_logs", force: true do |t|
    t.integer  "user_id"
    t.integer  "studymate_program_id"
    t.integer  "studymate_approval_id"
    t.string   "note"
    t.integer  "start_date"
    t.integer  "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monthly_report_publish_logs", ["studymate_approval_id"], name: "index_monthly_report_publish_logs_on_studymate_approval_id", using: :btree
  add_index "monthly_report_publish_logs", ["studymate_program_id"], name: "index_monthly_report_publish_logs_on_studymate_program_id", using: :btree
  add_index "monthly_report_publish_logs", ["user_id"], name: "index_monthly_report_publish_logs_on_user_id", using: :btree

  create_table "monthly_report_push_messages", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_reports", force: true do |t|
    t.integer  "start_date"
    t.integer  "end_date"
    t.integer  "published_date"
    t.text     "prepared_data"
    t.boolean  "is_read",                         default: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "studymate_approval_id"
    t.integer  "studymate_program_id"
    t.integer  "month_idx"
    t.datetime "created_at",            limit: 3
    t.datetime "updated_at",            limit: 3
    t.integer  "max_week_idx"
    t.string   "slug"
    t.integer  "score_total"
    t.boolean  "is_demo",                         default: false
  end

  add_index "monthly_reports", ["group_id"], name: "index_monthly_reports_on_group_id", using: :btree
  add_index "monthly_reports", ["slug"], name: "index_monthly_reports_on_slug", using: :btree
  add_index "monthly_reports", ["studymate_approval_id"], name: "index_monthly_reports_on_studymate_approval_id", using: :btree
  add_index "monthly_reports", ["studymate_program_id"], name: "index_monthly_reports_on_studymate_program_id", using: :btree
  add_index "monthly_reports", ["user_id"], name: "index_monthly_reports_on_user_id", using: :btree

  create_table "notification_results", force: true do |t|
    t.integer  "notification_segment_id"
    t.text     "user_ids"
    t.integer  "expected_count"
    t.integer  "success_count"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_working",              default: false
  end

  add_index "notification_results", ["notification_segment_id"], name: "index_notification_results_on_notification_segment_id", using: :btree

  create_table "notification_segments", force: true do |t|
    t.string   "title"
    t.text     "conditions"
    t.boolean  "is_manual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_validations", force: true do |t|
    t.integer  "notification_result_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notification_validations", ["notification_result_id"], name: "index_notification_validations_on_notification_result_id", using: :btree
  add_index "notification_validations", ["user_id"], name: "index_notification_validations_on_user_id", using: :btree

  create_table "notification_window_counters", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "unchecked_count",           default: 0
    t.datetime "created_at",      limit: 3
    t.datetime "updated_at",      limit: 3
  end

  add_index "notification_window_counters", ["receiver_id", "receiver_type"], name: "receiver", using: :btree

  create_table "notification_windows", force: true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "action"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "source_provider_id"
    t.string   "source_provider_type"
    t.integer  "destination_id"
    t.string   "destination_type"
    t.string   "custom_text"
    t.text     "custom_data"
    t.text     "cached_data"
    t.integer  "notificated_at"
    t.boolean  "is_read"
    t.datetime "created_at",           limit: 3
    t.datetime "updated_at",           limit: 3
  end

  add_index "notification_windows", ["destination_id", "destination_type"], name: "destination", using: :btree
  add_index "notification_windows", ["receiver_id", "receiver_type"], name: "receiver", using: :btree
  add_index "notification_windows", ["sender_id", "sender_type"], name: "sender", using: :btree
  add_index "notification_windows", ["source_provider_id", "source_provider_type"], name: "source_provider", using: :btree
  add_index "notification_windows", ["subject_id", "subject_type"], name: "subject", using: :btree

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id",           null: false
    t.integer  "application_id",              null: false
    t.string   "token",                       null: false
    t.integer  "expires_in",                  null: false
    t.text     "redirect_uri",                null: false
    t.datetime "created_at",        limit: 3, null: false
    t.datetime "revoked_at",        limit: 3
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                       null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at",        limit: 3
    t.datetime "created_at",        limit: 3, null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                   null: false
    t.string   "uid",                    null: false
    t.string   "secret",                 null: false
    t.text     "redirect_uri",           null: false
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "off_days", force: true do |t|
    t.integer  "date"
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.string   "task_local_id"
    t.integer  "task_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
  end

  add_index "off_days", ["task_id"], name: "index_off_days_on_task_id", using: :btree

  create_table "payback_policies", force: true do |t|
    t.string   "title"
    t.string   "tagged_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payback_processors", force: true do |t|
    t.integer  "studymate_approval_id"
    t.integer  "payback_policy_id"
    t.string   "process_finished_by"
    t.integer  "start_access_date"
    t.integer  "end_access_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "process_finished_at"
    t.string   "bank_name"
    t.string   "account_user_name"
    t.string   "account_num"
    t.string   "user_phone_num"
    t.integer  "user_id"
    t.boolean  "is_payback_policy_id_changed"
    t.integer  "before_payback_policy_id"
  end

  add_index "payback_processors", ["payback_policy_id"], name: "index_payback_processors_on_payback_policy_id", using: :btree
  add_index "payback_processors", ["studymate_approval_id"], name: "index_payback_processors_on_studymate_approval_id", using: :btree
  add_index "payback_processors", ["user_id"], name: "index_payback_processors_on_user_id", using: :btree

  create_table "phone_auth_codes", force: true do |t|
    t.string   "phone_number"
    t.string   "code"
    t.integer  "code_expired_at"
    t.integer  "code_registered_at"
    t.integer  "phone_auth_codeable_id"
    t.string   "phone_auth_codeable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_auth_codes", ["phone_auth_codeable_id", "phone_auth_codeable_type"], name: "auth_codeable", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "local_id"
    t.datetime "created_at",     limit: 3
    t.datetime "updated_at",     limit: 3
  end

  add_index "pictures", ["imageable_id", "imageable_type"], name: "index_pictures_on_imageable_id_and_imageable_type", using: :btree

  create_table "plan_finish_stamps", force: true do |t|
    t.integer  "date"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
    t.text     "images"
    t.string   "sync_uuid"
    t.boolean  "archived",                     default: false
    t.integer  "timestamp",          limit: 8
    t.boolean  "edited",                       default: false
    t.float    "concentration_rate",           default: 0.0
  end

  add_index "plan_finish_stamps", ["sync_uuid"], name: "index_plan_finish_stamps_on_sync_uuid", using: :btree
  add_index "plan_finish_stamps", ["user_id", "date"], name: "index_plan_finish_stamps_on_user_id_and_date", using: :btree
  add_index "plan_finish_stamps", ["user_id"], name: "index_plan_finish_stamps_on_user_id", using: :btree

  create_table "plan_start_stamps", force: true do |t|
    t.integer  "date"
    t.text     "body"
    t.integer  "user_id"
    t.text     "images"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
    t.string   "sync_uuid"
    t.boolean  "archived",             default: false
    t.integer  "timestamp",  limit: 8
    t.boolean  "edited",               default: false
  end

  add_index "plan_start_stamps", ["sync_uuid"], name: "index_plan_start_stamps_on_sync_uuid", using: :btree
  add_index "plan_start_stamps", ["user_id", "date"], name: "index_plan_start_stamps_on_user_id_and_date", using: :btree
  add_index "plan_start_stamps", ["user_id"], name: "index_plan_start_stamps_on_user_id", using: :btree

  create_table "point_change_logs", force: true do |t|
    t.integer  "user_id"
    t.integer  "point_amount"
    t.string   "point_type"
    t.string   "description"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "point_change_logs", ["user_id"], name: "index_point_change_logs_on_user_id", using: :btree

  create_table "point_in_app_payments", force: true do |t|
    t.integer  "in_app_purchase_id"
    t.text     "product_id",                   null: false
    t.integer  "purchase_time",      limit: 8, null: false
    t.boolean  "auto_renewing"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
  end

  add_index "point_in_app_payments", ["in_app_purchase_id"], name: "index_point_in_app_payments_on_in_app_purchase_id", using: :btree

  create_table "point_in_app_products", force: true do |t|
    t.integer  "in_app_product_id"
    t.text     "product_id",                                  null: false
    t.integer  "price",                                       null: false
    t.string   "product_type",                                null: false
    t.integer  "period_day_count"
    t.boolean  "auto_renewing",               default: false
    t.datetime "created_at",        limit: 3
    t.datetime "updated_at",        limit: 3
  end

  add_index "point_in_app_products", ["in_app_product_id"], name: "index_point_in_app_products_on_in_app_product_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "body"
    t.string   "image_names"
    t.integer  "timestamp",   limit: 8
    t.boolean  "archived",              default: false
    t.string   "local_id"
    t.integer  "user_id"
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "preferences", force: true do |t|
    t.boolean  "stopwatch_screen_dim",                      default: false
    t.integer  "combo_count",                               default: 0
    t.integer  "max_combo_count",                           default: 0
    t.integer  "user_id"
    t.datetime "created_at",                      limit: 3
    t.datetime "updated_at",                      limit: 3
    t.boolean  "notification_mode",                         default: false
    t.string   "notification_time"
    t.string   "finish_time",                               default: "04:00"
    t.boolean  "custom_stopwatch_background",               default: true
    t.string   "stopwatch_background_image_name"
    t.integer  "today_date"
    t.string   "main_image"
    t.string   "sync_uuid"
    t.boolean  "archived",                                  default: false
    t.boolean  "wake_up_notification_mode",                 default: true
    t.string   "wake_up_notification_time"
    t.boolean  "plan_finish_notification_mode",             default: true
    t.string   "plan_finish_notification_time"
    t.boolean  "comment_notification_mode",                 default: true
    t.boolean  "like_notification_mode",                    default: true
    t.integer  "study_time_second_of_day",                  default: 21600
    t.boolean  "is_working"
    t.integer  "weekday_working_second"
    t.integer  "study_level_id"
    t.boolean  "is_d_day_show_in_main"
    t.boolean  "d_day_notification_mode"
    t.string   "d_day_notification_time"
  end

  add_index "preferences", ["study_level_id"], name: "index_preferences_on_study_level_id", using: :btree
  add_index "preferences", ["sync_uuid"], name: "index_preferences_on_sync_uuid", using: :btree
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "pro_auths", force: true do |t|
    t.string   "platform"
    t.string   "price"
    t.string   "code"
    t.string   "country"
    t.string   "currency_code"
    t.integer  "status",                  default: 1
    t.string   "order_number"
    t.text     "data"
    t.text     "signature"
    t.integer  "user_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
  end

  add_index "pro_auths", ["code"], name: "index_pro_auths_on_code", unique: true, using: :btree
  add_index "pro_auths", ["order_number"], name: "index_pro_auths_on_order_number", unique: true, using: :btree
  add_index "pro_auths", ["user_id"], name: "index_pro_auths_on_user_id", using: :btree

  create_table "pro_coupons", force: true do |t|
    t.string   "code"
    t.string   "campaign"
    t.boolean  "available",                    default: true
    t.integer  "in_app_product_id"
    t.integer  "in_app_purchase_id"
    t.datetime "created_at",         limit: 3
    t.datetime "updated_at",         limit: 3
  end

  add_index "pro_coupons", ["code"], name: "index_pro_coupons_on_code", unique: true, using: :btree
  add_index "pro_coupons", ["in_app_product_id"], name: "index_pro_coupons_on_in_app_product_id", using: :btree
  add_index "pro_coupons", ["in_app_purchase_id"], name: "index_pro_coupons_on_in_app_purchase_id", using: :btree

  create_table "recommendation_code_generated_logs", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recommendation_code_generated_logs", ["user_id"], name: "index_recommendation_code_generated_logs_on_user_id", using: :btree

  create_table "review_days", force: true do |t|
    t.integer  "day_id"
    t.integer  "user_id"
    t.string   "local_id"
    t.integer  "date"
    t.boolean  "done",                 default: false
    t.boolean  "archived",             default: false
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "review_days", ["day_id"], name: "index_review_days_on_day_id", using: :btree
  add_index "review_days", ["user_id"], name: "index_review_days_on_user_id", using: :btree

  create_table "review_tasks", force: true do |t|
    t.integer  "start_date"
    t.integer  "end_date"
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.string   "task_local_id"
    t.integer  "task_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
  end

  add_index "review_tasks", ["task_id"], name: "index_review_tasks_on_task_id", using: :btree

  create_table "s3_images", force: true do |t|
    t.string   "image"
    t.integer  "s3_imageable_id"
    t.string   "s3_imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_url"
  end

  add_index "s3_images", ["s3_imageable_id", "s3_imageable_type"], name: "index_s3_images_on_s3_imageable_id_and_s3_imageable_type", using: :btree

  create_table "second_goal_details", force: true do |t|
    t.integer  "goal_detail_id"
    t.string   "title"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "second_goal_details", ["goal_detail_id"], name: "index_second_goal_details_on_goal_detail_id", using: :btree

  create_table "send_bird_channels", force: true do |t|
    t.string   "use_case"
    t.string   "channel_type"
    t.string   "channel_url"
    t.integer  "send_bird_channelable_id"
    t.string   "send_bird_channelable_type"
    t.datetime "created_at",                 limit: 3
    t.datetime "updated_at",                 limit: 3
  end

  add_index "send_bird_channels", ["send_bird_channelable_id", "send_bird_channelable_type"], name: "index_send_bird_channelable", using: :btree

  create_table "stopwatch_logs", force: true do |t|
    t.integer  "before_second"
    t.integer  "after_second"
    t.integer  "before_amount"
    t.integer  "after_amount"
    t.integer  "timestamp",     limit: 8
    t.integer  "day_id"
    t.integer  "user_id"
    t.integer  "review_day_id"
    t.boolean  "archived",                default: false
    t.string   "sync_uuid"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.string   "local_id"
  end

  add_index "stopwatch_logs", ["day_id", "timestamp"], name: "index_stopwatch_logs_on_day_id_and_timestamp", using: :btree
  add_index "stopwatch_logs", ["day_id"], name: "index_stopwatch_logs_on_day_id", using: :btree
  add_index "stopwatch_logs", ["review_day_id"], name: "index_stopwatch_logs_on_review_day_id", using: :btree
  add_index "stopwatch_logs", ["sync_uuid"], name: "index_stopwatch_logs_on_sync_uuid", using: :btree
  add_index "stopwatch_logs", ["user_id"], name: "index_stopwatch_logs_on_user_id", using: :btree

  create_table "study_levels", force: true do |t|
    t.integer  "step"
    t.integer  "start_score"
    t.integer  "end_score"
    t.string   "title"
    t.boolean  "archived"
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
  end

  create_table "studymate_approvals", force: true do |t|
    t.integer  "user_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.boolean  "expired",                                   default: false
    t.datetime "created_at",                    limit: 3
    t.datetime "updated_at",                    limit: 3
    t.integer  "studymate_approveable_id"
    t.boolean  "is_temp",                                   default: false
    t.string   "studymate_approveable_type",    limit: 255
    t.string   "approved_type"
    t.integer  "studymate_program_id"
    t.integer  "prev_id"
    t.integer  "next_id"
    t.integer  "original_studymate_program_id"
    t.boolean  "can_use_chat",                              default: true
    t.string   "can_use_chat_reason"
  end

  add_index "studymate_approvals", ["next_id"], name: "index_studymate_approvals_on_next_id", using: :btree
  add_index "studymate_approvals", ["original_studymate_program_id"], name: "index_studymate_approvals_on_original_studymate_program_id", using: :btree
  add_index "studymate_approvals", ["prev_id"], name: "index_studymate_approvals_on_prev_id", using: :btree
  add_index "studymate_approvals", ["studymate_approveable_id"], name: "index_studymate_approvals_on_studymate_approveable_id", using: :btree
  add_index "studymate_approvals", ["studymate_program_id"], name: "index_studymate_approvals_on_studymate_program_id", using: :btree
  add_index "studymate_approvals", ["user_id"], name: "index_studymate_approvals_on_user_id", using: :btree

  create_table "studymate_demo_approvals", force: true do |t|
    t.integer  "user_id"
    t.string   "phone_num"
    t.integer  "applied_timestamp"
    t.integer  "start_timestamp"
    t.integer  "end_timestamp"
    t.integer  "extra_timestamp"
    t.boolean  "expired",                     default: false
    t.datetime "created_at",        limit: 3
    t.datetime "updated_at",        limit: 3
    t.integer  "approved_at"
    t.integer  "finish_timestamp"
  end

  add_index "studymate_demo_approvals", ["user_id"], name: "index_studymate_demo_approvals_on_user_id", using: :btree

  create_table "studymate_program_relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "studymate_program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studymate_program_relationships", ["studymate_program_id"], name: "index_studymate_program_relationships_on_studymate_program_id", using: :btree
  add_index "studymate_program_relationships", ["user_id"], name: "index_studymate_program_relationships_on_user_id", using: :btree

  create_table "studymate_programs", force: true do |t|
    t.string   "name"
    t.integer  "start_date"
    t.integer  "end_date"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "studymate_reports", force: true do |t|
    t.string   "report_type"
    t.integer  "data_version"
    t.integer  "cweek"
    t.integer  "cweek_idx"
    t.integer  "published_date"
    t.integer  "date"
    t.integer  "studymate_id"
    t.integer  "user_id"
    t.text     "data"
    t.datetime "created_at",     limit: 3
    t.datetime "updated_at",     limit: 3
    t.string   "slug"
  end

  add_index "studymate_reports", ["slug"], name: "index_studymate_reports_on_slug", unique: true, using: :btree
  add_index "studymate_reports", ["studymate_id"], name: "index_studymate_reports_on_studymate_id", using: :btree
  add_index "studymate_reports", ["user_id"], name: "index_studymate_reports_on_user_id", using: :btree

  create_table "studymate_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  create_table "sync_logs", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.string   "data_type"
    t.integer  "data_id"
    t.text     "data"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "sync_logs", ["user_id"], name: "index_sync_logs_on_user_id", using: :btree

  create_table "task_dates", force: true do |t|
    t.integer  "task_id",                              null: false
    t.integer  "user_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.integer  "state",                default: 0
    t.string   "local_id"
    t.boolean  "archived",             default: false
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
    t.string   "sync_uuid"
  end

  add_index "task_dates", ["end_date"], name: "index_task_dates_on_end_date", using: :btree
  add_index "task_dates", ["start_date"], name: "index_task_dates_on_start_date", using: :btree
  add_index "task_dates", ["sync_uuid"], name: "index_task_dates_on_sync_uuid", using: :btree
  add_index "task_dates", ["task_id"], name: "index_task_dates_on_task_id", using: :btree
  add_index "task_dates", ["user_id"], name: "index_task_dates_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "start_point"
    t.integer  "amount"
    t.boolean  "notification_mode",           default: false
    t.string   "notification_time"
    t.boolean  "archived",                    default: false
    t.string   "local_id"
    t.integer  "category_id"
    t.datetime "created_at",        limit: 3
    t.datetime "updated_at",        limit: 3
    t.integer  "priority",                    default: 0
    t.integer  "repeat_count",                default: 1
    t.string   "review_type"
    t.integer  "review_count"
    t.boolean  "completed",                   default: false
    t.string   "task_type"
    t.integer  "user_id"
    t.integer  "completed_date"
    t.string   "repeat_type"
    t.integer  "repeat_day"
    t.integer  "notification_date"
    t.integer  "time_second"
    t.string   "sync_uuid"
    t.integer  "archived_date"
  end

  add_index "tasks", ["archived_date"], name: "index_tasks_on_archived_date", using: :btree
  add_index "tasks", ["category_id"], name: "index_tasks_on_category_id", using: :btree
  add_index "tasks", ["sync_uuid"], name: "index_tasks_on_sync_uuid", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "third_goal_details", force: true do |t|
    t.integer  "second_goal_detail_id"
    t.string   "title"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "third_goal_details", ["second_goal_detail_id"], name: "index_third_goal_details_on_second_goal_detail_id", using: :btree

  create_table "time_histories", force: true do |t|
    t.integer  "started_at",  limit: 8
    t.integer  "ended_at",    limit: 8
    t.integer  "done_millis", limit: 8
    t.boolean  "archived",              default: false
    t.string   "local_id"
    t.integer  "day_id"
    t.datetime "created_at",  limit: 3
    t.datetime "updated_at",  limit: 3
    t.integer  "user_id"
    t.string   "sync_uuid"
  end

  add_index "time_histories", ["day_id"], name: "index_time_histories_on_day_id", using: :btree
  add_index "time_histories", ["sync_uuid"], name: "index_time_histories_on_sync_uuid", using: :btree
  add_index "time_histories", ["user_id"], name: "index_time_histories_on_user_id", using: :btree

  create_table "time_logs", force: true do |t|
    t.integer  "before_second"
    t.integer  "after_second"
    t.integer  "timestamp",     limit: 8
    t.boolean  "archived",                default: false
    t.string   "local_id"
    t.integer  "day_id"
    t.datetime "created_at",    limit: 3
    t.datetime "updated_at",    limit: 3
    t.integer  "user_id"
    t.integer  "review_day_id"
    t.string   "sync_uuid"
  end

  add_index "time_logs", ["day_id"], name: "index_time_logs_on_day_id", using: :btree
  add_index "time_logs", ["review_day_id"], name: "index_time_logs_on_review_day_id", using: :btree
  add_index "time_logs", ["sync_uuid"], name: "index_time_logs_on_sync_uuid", using: :btree
  add_index "time_logs", ["user_id"], name: "index_time_logs_on_user_id", using: :btree

  create_table "user_categories", force: true do |t|
    t.string   "code",                     default: "", null: false
    t.string   "name",                     default: "", null: false
    t.string   "categorized_by",           default: "", null: false
    t.datetime "created_at",     limit: 3
    t.datetime "updated_at",     limit: 3
  end

  create_table "user_devices", force: true do |t|
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
    t.boolean  "signed_in",            default: false
  end

  add_index "user_devices", ["device_id"], name: "index_user_devices_on_device_id", using: :btree
  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                            default: "",    null: false
    t.string   "encrypted_password",               default: "",    null: false
    t.string   "name",                             default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", limit: 3
    t.datetime "remember_created_at",    limit: 3
    t.integer  "sign_in_count",                    default: 0,     null: false
    t.datetime "current_sign_in_at",     limit: 3
    t.datetime "last_sign_in_at",        limit: 3
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             limit: 3
    t.datetime "updated_at",             limit: 3
    t.string   "authentication_token"
    t.integer  "invitation_code"
    t.integer  "point",                            default: 0
    t.string   "my_message"
    t.string   "grade"
    t.string   "goal"
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.text     "oauth_token"
    t.boolean  "auto_matching_status",             default: false
    t.string   "profile_image"
    t.integer  "last_sync_device_id"
    t.string   "sync_uuid"
    t.integer  "manager_id"
    t.string   "send_bird_access_token"
    t.boolean  "is_manager",                       default: false
    t.string   "recommendation_code"
    t.string   "phone_num"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_code"], name: "index_users_on_invitation_code", using: :btree
  add_index "users", ["is_manager"], name: "index_users_on_is_manager", using: :btree
  add_index "users", ["last_sync_device_id"], name: "index_users_on_last_sync_device_id", using: :btree
  add_index "users", ["manager_id"], name: "index_users_on_manager_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sync_uuid"], name: "index_users_on_sync_uuid", using: :btree

  create_table "virtual_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "is_active",            default: true
    t.datetime "created_at", limit: 3
    t.datetime "updated_at", limit: 3
  end

  add_index "virtual_memberships", ["group_id"], name: "index_virtual_memberships_on_group_id", using: :btree
  add_index "virtual_memberships", ["user_id"], name: "index_virtual_memberships_on_user_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "wake_up_stamps", force: true do |t|
    t.integer  "date"
    t.integer  "timestamp",                 limit: 8
    t.integer  "user_id"
    t.datetime "created_at",                limit: 3
    t.datetime "updated_at",                limit: 3
    t.string   "custom_background_image"
    t.string   "built_in_background_image"
    t.string   "background_image_type"
    t.string   "sync_uuid"
    t.boolean  "archived",                            default: false
  end

  add_index "wake_up_stamps", ["sync_uuid"], name: "index_wake_up_stamps_on_sync_uuid", using: :btree
  add_index "wake_up_stamps", ["user_id", "date"], name: "index_wake_up_stamps_on_user_id_and_date", using: :btree
  add_index "wake_up_stamps", ["user_id"], name: "index_wake_up_stamps_on_user_id", using: :btree

  create_table "watering_logs", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watering_logs", ["user_id"], name: "index_watering_logs_on_user_id", using: :btree

  create_table "weekly_brief_ments", force: true do |t|
    t.string   "body"
    t.integer  "week_idx"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weekly_report_push_messages", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weekly_reports", force: true do |t|
    t.integer  "start_date"
    t.integer  "end_date"
    t.text     "prepared_data"
    t.boolean  "is_read",                         default: false
    t.integer  "user_id"
    t.integer  "studymate_program_id"
    t.datetime "created_at",            limit: 3
    t.datetime "updated_at",            limit: 3
    t.string   "slug"
    t.integer  "week_idx"
    t.integer  "score_wake_up"
    t.integer  "score_plan_start"
    t.integer  "score_plan_finish"
    t.integer  "score_no_0ar"
    t.integer  "score_no_0ds"
    t.integer  "score_activity"
    t.integer  "score_activity_max"
    t.integer  "score_social"
    t.integer  "score_social_max"
    t.integer  "score_total"
    t.integer  "weekly_brief_ment_id"
    t.integer  "weekly_wise_saying_id"
    t.integer  "data_version"
    t.boolean  "is_demo",                         default: false
    t.integer  "studymate_approval_id"
  end

  add_index "weekly_reports", ["slug"], name: "index_weekly_reports_on_slug", using: :btree
  add_index "weekly_reports", ["start_date", "end_date"], name: "index_weekly_reports_on_start_date_and_end_date", using: :btree
  add_index "weekly_reports", ["studymate_approval_id"], name: "index_weekly_reports_on_studymate_approval_id", using: :btree
  add_index "weekly_reports", ["studymate_program_id"], name: "index_weekly_reports_on_studymate_program_id", using: :btree
  add_index "weekly_reports", ["user_id"], name: "index_weekly_reports_on_user_id", using: :btree
  add_index "weekly_reports", ["weekly_brief_ment_id"], name: "index_weekly_reports_on_weekly_brief_ment_id", using: :btree
  add_index "weekly_reports", ["weekly_wise_saying_id"], name: "index_weekly_reports_on_weekly_wise_saying_id", using: :btree

  create_table "weekly_wise_sayings", force: true do |t|
    t.text     "body"
    t.string   "author"
    t.integer  "week_idx"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", force: true do |t|
    t.boolean  "archived",               default: false
    t.string   "local_id"
    t.datetime "created_at",   limit: 3
    t.datetime "updated_at",   limit: 3
    t.integer  "task_date_id",                           null: false
    t.integer  "user_id"
    t.integer  "sun"
    t.integer  "mon"
    t.integer  "tue"
    t.integer  "wed"
    t.integer  "thu"
    t.integer  "fri"
    t.integer  "sat"
    t.string   "sync_uuid"
  end

  add_index "weeks", ["sync_uuid"], name: "index_weeks_on_sync_uuid", using: :btree
  add_index "weeks", ["task_date_id"], name: "index_weeks_on_task_date_id", using: :btree
  add_index "weeks", ["user_id"], name: "index_weeks_on_user_id", using: :btree

end
