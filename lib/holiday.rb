require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
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
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season.to_sym][holiday_name.to_sym] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  returnArray = []
  holiday_hash[:winter].each do |holiday, supplyArray|
    supplyArray.each do |supply|
      returnArray.push(supply)
    end
  end
  returnArray
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    season_str = season.to_s
    puts "#{season_str.capitalize}:"
    holidays.each do |holiday, supply_arr|
      holiday_str = holiday.to_s
      holiday_str_array = holiday_str.split("_")
      holiday_str_array = holiday_str_array.collect {|word| word.capitalize}
      holiday_str = holiday_str_array.join(" ")
      line_str = "  "
      line_str = line_str + holiday_str + ": "
      supply_arr.each do |supply|
        line_str = line_str + supply + ", "
      end
      puts "#{line_str.chomp(", ")}"
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  returnArray = []
  holiday_hash.each do |seasons, holiday_names|
    holiday_names.each do |holidays, supply_arr|
      supply_arr.each do |supply|
        if supply == "BBQ"
          returnArray.push(holidays)
        end
      end
    end
  end
  return returnArray

end
