hello world
<a href="https://www.google.com" target="_blank">Visit W3Schools!</a>
<a href="https://www.google.com/" target="_blank"> Google </a>
<br>
<a href="http://192.168.0.17/5/on" target="_blank"> box lock </a>
<br>
<a href="http://192.168.0.17/5/off" target="_blank"> box open </a>


session[:user_id]
we are taking the value of the key of user_id in the sessions hash and storing it as the user id of the post.
difference between show all & edit capability:
use show or edit if statements, where if session[:user_id] = post, date etc, .id
  then allow editing or viewing
else, this means that the logged in ID stored in sessions doesnt match the post, date_card, goal, etc of the user



  <p>Below are your current goals.  You have up to 10 goals to add.  Goals not checked will not be tracked, so you only need to check the boxes you would like to track.</p>
  <br>
  <form action="/users/<%= @user.id %>" method="post">
  <% @range.each do |i| %>
  <p>Goal # <%= i %> </p>
  
  <p>Check to track: <input type="checkbox" name="goal[goal_enabled_<%= i %>]" <%='checked' if @user.goal_enabled_1.include?("on") %>></p>
  <p>Units & Goal Name: <input type="text" name="goal[goal_name_<%= i %>]" value=<%= @user.goal_name_1%>></p>
  <p>Goal frequency (days, integer only): <input type="integer" name="goal[goal_frequency_<%= i %>]"></p>
  <p>Goal type:</p>
  
  <input type="radio" id="1"
  name="goal[goal_type_<%= i %>]" value="Achieved / Not Achieved" </p>
  <label for="1">Achieved / Not Achieved</label><br>
  
  
  <input type="radio" id="2"
  name="goal[goal_type_<%= i %>]" value="Units Tracking" </p>
  <label for="2">Quantity Tracking</label><br>
  <br>
  
  <p>If quantity tracking, enter desired quantity per so many days: <input type="integer" name="goal[goal_qty_<%= i %>]"></p>
  <br>
  <br>
  <% end %>
  <button type="submit">Click to save your goals</button>
  </form>
  



  <form action="/users/<%= @user.id %>" method="post">
  <% @range.each do |i| %>
  <p>Goal # <%= i %> </p>
  <p>Check to track: <input type="checkbox" name="goal[goal_enabled_<%= i %>]"></p>
  <p>Units & Goal Name: <input type="text" name="goal[goal_name_<%= i %>]"></p>
  <p>Goal frequency (days, integer only): <input type="integer" name="goal[goal_frequency_<%= i %>]"></p>
  <p>Goal type:</p>
  
  <input type="radio" id="1"
  name="goal[goal_type_<%= i %>]" value="Achieved / Not Achieved" </p>
  <label for="1">Achieved / Not Achieved</label><br>
  
  
  <input type="radio" id="2"
  name="goal[goal_type_<%= i %>]" value="Units Tracking" </p>
  <label for="2">Quantity Tracking</label><br>
  <br>
  
  <p>If quantity tracking, enter desired quantity per so many days: <input type="integer" name="goal[goal_qty_<%= i %>]"></p>
  <br>
  <br>
  <% end %>
  <button type="submit">Click to save your goals</button>
  </form>
  




  

  mike.goals << Goal.create(goal_name: "soccer for half hour")
  
  mike.date_cards << DateCard.create(date: "20201002")
  mike.date_cards

  testjoin.datecard_id=today.id
  testjoin.goal_id = 99

  today = DateCard.create
  soccer = Goal.create

  mike.date_cards << today

[67] pry(main)> Goal.all
[68] pry(main)> User.all
[70] pry(main)> DateCard.all
[71] pry(main)> GoalDateCard.all

full assocation date, user, goal, datecard
USER CREATION
[42] pry(main)> steve = User.create(password: "test")
=> #<User:0x00007f84882f8960 id: 4, first_name: nil, username: nil, password_digest: "$2a$12$xRx61AA5luBlCB3slaAWHeDA.Bi29DWFvlpxbmyAGM9lkXAZPYzCe">  

GOAL CREATION
[43] pry(main)> sales = Goal.create(goal_name: "sales")
=> #<Goal:0x00007f8488338a38 id: 16, user_id: nil, goal_name: "sales", goal_frequency: nil, goal_type: nil, goal_qty: nil>

USER & GOAL ASSOCIATION
[44] pry(main)> steve.goals << sales
=> [#<Goal:0x00007f8488338a38 id: 16, user_id: 4, goal_name: "sales", goal_frequency: nil, goal_type: nil, goal_qty: nil>]

DATE CREATION
[45] pry(main)> today = DateCard.create(date: "2020-11-16")
=> #<DateCard:0x00007f84879f5368 id: 7, user_id: nil, date: "2020-11-16">

DATE & USER ASSOCIATION
[46] pry(main)> steve.date_cards << today
=> [#<DateCard:0x00007f84879f5368 id: 7, user_id: 4, date: "2020-11-16">]


TESTSJOIN MODEL
[48] pry(main)> testjoin = GoalDateCard.create
=> #<GoalDateCard:0x00007f84868c9e90 id: 6, goal_id: nil, datecard_id: nil, binary_completed: nil, qty_completed: nil>

[50] pry(main)> testjoin.goal_id = sales.id
=> 16
[51] pry(main)> testjoin
=> #<GoalDateCard:0x00007f84868c9e90 id: 6, goal_id: 16, datecard_id: nil, binary_completed: nil, qty_completed: nil>

[52] pry(main)> testjoin.date_card_id = today.id
=> 7
[53] pry(main)> testjoin
=> #<GoalDateCard:0x00007f84868c9e90 id: 6, goal_id: 16, datecard_id: 7, binary_completed: nil, qty_completed: nil>

[88] pry(main)> testjoin
=> #<GoalDateCard:0x00007f84868c9e90 id: 6, goal_id: 16, datecard_id: 7, binary_completed: nil, qty_completed: nil>
[89] pry(main)> testjoin.save
=> true

[24] pry(main)> steve.date_cards[0].goal_date_cards
=> [#<GoalDateCard:0x00007fcf22977e78 id: 1, goal_id: 1, date_card_id: 1, binary_completed: nil, qty_completed: nil>]
[25] pry(main)> steve.goal_date_cards
=> [#<GoalDateCard:0x00007fcf22b2c570 id: 1, goal_id: 1, date_card_id: 1, binary_completed: nil, qty_completed: nil>]
[26] pry(main)> steve.goals
=> [#<Goal:0x00007fcf1e1be938 id: 1, user_id: 1, goal_name: "sales", goal_frequency: nil, goal_type: nil, goal_qty: nil>]


********** fixed.
[105] pry(main)> steve.date_cards
=> [#<DateCard:0x00007f84879f5368 id: 7, user_id: 4, date: "2020-11-16">]
[106] pry(main)> today.goal_date_cards
=> #<GoalDateCard::ActiveRecord_Associations_CollectionProxy:0x3fc2441bc880>
[107] pry(main)> sales.goal_date_cards
=> [#<GoalDateCard:0x00007f84879bf150 id: 6, goal_id: 16, datecard_id: 7, binary_completed: nil, qty_completed: nil>]
[108] pry(main)> today
=> #<DateCard:0x00007f84879f5368 id: 7, user_id: 4, date: "2020-11-16">
[109] pry(main)> 

[81] pry(main)> steve.date_cards[0].goal_date_cards
=> #<GoalDateCard::ActiveRecord_Associations_CollectionProxy:0x3fc2441bc880>