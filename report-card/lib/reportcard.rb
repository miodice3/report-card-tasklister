class ReportCard < ApplicationController

    def self.run(params, session_id)
        @params = params             # number of dates user would like to request
        @session_id = session_id     # session id used to return exact user instance
        self.varset
        self.date_populate
        self.sortgoals
        self.binary
        self.qty
    end

    def self.varset
        @user = User.find_by_id(@session_id)
        @return_array = []             #array containing summaries of each goal
        @date_array = []               #used to collect all dates in correct format that user requested
        @binary_goals = []
        @qty_goals = []
    end

    def self.sortgoals
        @user.goals.each do |i|
            if i.goal_type == "1"
                @binary_goals << i
            elsif i.goal_type == "2"
                @qty_goals << i
            end
        end
    end

    def self.date_populate
        i=0
        @params.times do
            @date = Date.today-i
            @date_array << @date.strftime("%Y-%m-%d")
            i += 1
        end
    end

    def self.binary
        @binary_goals.each do |i|                 #start with iterating over all goals, one at a time, to aggregate data from days requested
            @each_goal_summary = {}
            @each_goal_summary[:goal_name]=i.goal_name
            @each_goal_summary[:goal_frequency]= i.goal_frequency.to_i
            @each_goal_summary[:date_array]= @date_array.length

            @counter = []     #used to total up times goal marked as completed
            j=0
                @date_array.length.times do            #iterate over date array, check gdc instances for each date & goal combination.
                    dt = @user.date_cards.find_by(date: @date_array[j])  #returns date instance, used in search, with goals unique id also
                    gdc = GoalDateCard.find_by(goal_id: i.id, date_card_id: dt.id)  #returns gdc instance                            
                        if gdc.binary_completed == "1"
                            @counter << 1.0
                        end
                    j += 1  #increment counter and advance through date array to check next unique gdc instance
                end

        @each_goal_summary[:counter]= @counter.sum           
        @percentage = ((@counter.sum*1.0)/((@date_array.length*1.0)/(i.goal_frequency.to_i*1.0)))*100
        @each_goal_summary[:percentage]= @percentage.truncate
        @each_goal_summary[:grade]= (self.grade(@percentage))  #call grade, pass percentage, recieve letter grade
        @return_array << @each_goal_summary  #shovel each goal summary into main return array.
        end
    @return_array
    end

    def self.qty
        @qty_goals.each do |i|                 #start with iterating over all goals, one at a time, to aggregate data from days requested
            @each_goal_summary = {}
            @each_goal_summary[:goal_name]=i.goal_name
            @each_goal_summary[:goal_frequency]= i.goal_frequency.to_i
            @each_goal_summary[:date_array]= @date_array.length

            @counter = [0]     #used to total up times goal marked as completed
            j=0
            @date_array.length.times do            #iterate over date array, check gdc instances for each date & goal combination.
                dt = @user.date_cards.find_by(date: @date_array[j])  #returns date instance, used in search, with goals unique id also
                gdc = GoalDateCard.find_by(goal_id: i.id, date_card_id: dt.id)  #returns gdc instance
                        @counter << gdc.qty_completed
                j += 1  #increment counter and advance through date array to check next unique gdc instance
            end

        @each_goal_summary[:counter]= @counter.sum
        @percentage = ((@counter.sum*1.0)/(((i.goal_qty*1.0)/(i.goal_frequency.to_i*1.0))*@date_array.length))*100
        @percentage = @percentage.truncate
        @each_goal_summary[:percentage]= @percentage
        @each_goal_summary[:grade]= (self.grade(@percentage))  #call grade, pass percentage, recieve letter grade
        @return_array << @each_goal_summary  #shovel each goal summary into main return array.
        end
    @return_array
    end

    def self.grade(integer)
        case integer
        when 97..20000
            "A+"
        when 94..96
            "A"
        when 90..93
            "A-"
        when 87..89
            "B+"
        when 84..86
            "B"
        when 80..83
            "B-"
        when 77..79
            "C+"
        when 74..76
            "C"
        when 70..73
            "C-"
        when 67..69
            "D+"
        when 64..66
            "D"
        when 60..63
            "D-"
        when 0..59
            "F"
        end
    end

end