  create_table "addresses", force: :cascade do |t|
    t.string   "boro"
    t.string   "building"
    t.string   "street"
    t.string   "zipcode"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisine_types", force: :cascade do |t|
    t.string   "cuisine_description"
    t.integer  "restaurant_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "inspection_date"
    t.string   "grade"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "violation_descriptions", force: :cascade do |t|
    t.string   "violation_code"
    t.string   "violation_description"
    t.integer  "restaurant_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false