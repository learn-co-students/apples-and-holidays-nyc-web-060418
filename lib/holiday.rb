require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].collect do |holiday, value|
    value.push(supply)
  end  
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_arr = []
  holiday_hash.each do |season, holiday_info|
    if season == :winter
      holiday_info.each do |holiday_name, supplies|
        winter_arr << supplies
      end  
    end  
  end  
  winter_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts "#{season.capitalize}:"
    holidays.each do |holiday_name, supplies|
      capital_names = holiday_name.to_s.split("_").collect do |name_part|
        name_part.capitalize
      end  
      capitalized_name = capital_names.join(" ")
      puts "  #{capitalized_name}: #{supplies.join(", ")}"
    end  
  end 
end  
    
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.



def all_holidays_with_bbq(holiday_hash)
  array_bbqs = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday_name, supplies|
      supplies.each do |supply_name|
        if supply_name == "BBQ"
          array_bbqs << holiday_name
        end  
      end
    end
  end  
  array_bbqs
end







