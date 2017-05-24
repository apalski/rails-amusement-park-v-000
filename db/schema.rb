
ActiveRecord::Schema.define(version: 20140703140419) do

  create_table "attractions", force: :cascade do |t|
    t.string  "name"
    t.integer "tickets"
    t.integer "nausea_rating"
    t.integer "happiness_rating"
    t.integer "min_height"
  end

  create_table "rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "password_digest"
    t.integer "nausea"
    t.integer "happiness"
    t.integer "tickets"
    t.integer "height"
    t.boolean "admin",           default: false
  end

end
