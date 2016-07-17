# hierarchies

= schema
	t.string   "name"
	t.integer  "manager_id"
	t.string   "phone"
	t.string   "email"
	t.datetime "created_at",    null: false
	t.datetime "updated_at",    null: false
	t.string   "password_hash"
	t.string   "password_salt"

= Functionality
  Added login/logout,create new employee functionalities
  Its show a tree structure of employee hierarchies using jquery.jOrgChart.js
