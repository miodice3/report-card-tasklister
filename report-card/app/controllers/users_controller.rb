class UsersController < ApplicationController

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        @range = (1..3).to_a
        erb :'users/show'
    end

    # get '/users/7' do
    #     "Hello World"
    #   end

    get '/users/:id/edit' do
        @range = (1..3).to_a
        @user = User.find_by_id(params[:id])
        #binding.pry
        erb :'users/edit'
    end

    post '/users/:id' do
 #       binding.pry
        @user=User.all.find_by_id(params[:id])
        @user.update(params[:goal])
        binding.pry
        @user.save

        redirect "/users/#{@user.id}"
        #catch params, update user profile
    end



end


# t.string :first_name
# t.string :last_name
# t.string :username
# t.string :password_digest

# t.string :goal_enabled_1
# t.string :goal_name_1
# t.string :goal_frequency_1
# t.string :goal_type_1

# t.string :goal_enabled_2
# t.string :goal_name_2
# t.string :goal_frequency_2
# t.string :goal_type_2

# t.string :goal_enabled_3
# t.string :goal_name_3
# t.string :goal_frequency_3
# t.string :goal_type_3


# <form action="/figures" method="post">
# <label>Figure Name:</label>
# <br>
# <input type="text" name="figure[name]"</p>

# <br>
# <p>Select an existing landmark below or create a new one in the text box below</p>

# <h3>Existing Landmarks</h3>
# <% @landmarks.each do |landmark| %>
#     <input type="checkbox" name="landmark[id][]" value="<%= landmark.id %>" id="capybaratest"> <%=landmark.name %> </input><br>
# <% end %>

# <br>

# <h3>New Landmark</h3>
# <label>Landmark Name: </label>
# <br>
# <input type="text" name="landmark[name]" id="capybaratest"></input>
# <br>

# <h3>Existing Title</h3>
# <% @titles.each do |title| %>
#     <input type="checkbox" name="title[id][]" value="<%= title.id %>" id="capybaratest"> <%= title.name %> </input><br>
# <% end %>

# <br>

# <h3>New Title</h3>
# <label>Title Name: </label>
# <br>
# <input type="text" name="title[name]" id="capybaratest"></input>
# <br>
# <br>

# <button type="submit">Create New Figure</button>
# </form>