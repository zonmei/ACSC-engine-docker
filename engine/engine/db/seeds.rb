# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# General Category
Setting.create!(label: "Competition Name:", 
								name: "competition_name", value: "Army Cyber Skills Challenge 2016", setting_type: "text", category: "General")
Setting.create!(label: "Competition Start Time:", 
								name: "start_time", value: DateTime.current.strftime("%m/%d/%Y %I:%M %p"), setting_type: "date", category: "General")
Setting.create!(label: "Competition End Time:", 
								name: "end_time", value: (DateTime.current + 1.days).strftime("%m/%d/%Y %I:%M %p"), setting_type: "date", category: "General")
Setting.create!(label: "Max number of members per team:", 
								name: "max_members_per_team", value: "5", setting_type: "text", category: "General")
Setting.create!(label: "Send activation e-mails?", tooltip: "Requires mailer config", 
								name: "send_activation_emails", value: "0", setting_type: "boolean", category: "General")
Setting.create!(label: "Registration on?", 
								name: "registration_active", value: "1", setting_type: "boolean", category: "General")
Setting.create!(label: "Use bracket based handicap system?", 
								name: "use_bracket_handicaps", value: "0", setting_type: "boolean", category: "General")
Setting.create!(label: "Allow users to view profiles other than their own?", 
								name: "view_other_profiles", value: "1", setting_type: "boolean", category: "General")

# Scoring Category
Setting.create!(label: "Subtract hint deductions before problem is solved?", 
								name: "subtract_hint_points_before_solve", value: "0", setting_type: "boolean", category: "Scoring")
Setting.create!(label: "Scoreboard (on/off):", 
								name: "scoreboard_on", value: "1", setting_type: "boolean", category: "Scoring")
Setting.create!(label: "Maximum number of submissions per team:", tooltip: "0 means no limit",
								name: "max_submissions_per_team", value: "0", setting_type: "text", category: "Scoring")

# Payment Category
Setting.create!(label: "Require Payment?", tooltip: "Reqires 'stripe' configuration", 
								name: "require_payment", value: "0", setting_type: "boolean", category: "Payment")
Setting.create!(label: "Entry cost:", tooltip: "in $0.01 increments (e.g., 500 = $5.00 USD)", 
								name: "entry_cost", value: "500", setting_type: "text", category: "Payment")
Setting.create!(label: "50% Off Discount Code:", tooltip: "empty string disables", 
								name: "fifty_percent_off", value: "", setting_type: "text", category: "Payment")
Setting.create!(label: "100% Off Discount Code:", tooltip: "empty string disables", 
								name: "one_hundred_percent_off", value: "", setting_type: "text", category: "Payment")

bracket = Bracket.create!(name: "Admins", priority: "10", hints_available: 0)
          Bracket.create!(name: "Competitors", priority: "1", hints_available: 100)

team = Team.create!(name:  "admins",
 						 				passphrase: "password",
 						 				bracket_id: bracket.id)

user = User.create!(id: Random.rand(10000),
						 				fname:  "admin",
 						 				lname: "user",
 						 				username: "admin",
 						 				email: "admin@gmail.com",
 						 				password:              "password",
 						 				password_confirmation: "password",
 						 				admin: true,
 						 				activated: true,
 						 				paid: true,
						 				team_id: team.id,
 						 				activated_at: Time.zone.now)

user.join_team(team)

