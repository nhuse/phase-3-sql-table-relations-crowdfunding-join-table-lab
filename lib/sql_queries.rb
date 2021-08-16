# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title
  "SELECT Projects.title, sum(Pledges.amount) as total_pledges
  FROM Pledges
  LEFT JOIN Projects
  ON Projects.id = Pledges.project_id
  GROUP BY Pledges.project_id
  ORDER BY title ASC"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  "SELECT Users.name, Users.age, sum(Pledges.amount) as user_total_pledges
  FROM Users
  LEFT JOIN Pledges
  ON Users.id = Pledges.user_id
  GROUP BY Pledges.user_id
  ORDER BY name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT Projects.title, (SUM(pledges.amount) - projects.funding_goal) as amount_over_goal
  FROM Projects
  LEFT JOIN Pledges
  ON Projects.id = Pledges.project_id
  GROUP BY Pledges.project_id
  HAVING amount_over_goal >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount
  "SELECT users.name, sum(pledges.amount) as user_total_pledges
  FROM users
  LEFT JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY users.name
  ORDER BY user_total_pledges ASC"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount
  FROM projects
  LEFT JOIN pledges
  ON projects.id = pledges.project_id
  WHERE projects.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
  "SELECT projects.category, sum(pledges.amount) as books_category_sum
  FROM projects
  LEFT JOIN pledges
  ON projects.id = pledges.project_id
  WHERE projects.category = 'books'"
end
