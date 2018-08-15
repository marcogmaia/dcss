autopickup_exceptions += >uselessness, >inaccuracy
confirm_butcher = never
auto_butcher = very full
chunks_autopickup = true
easy_eat_chunks = true
easy_eat_gourmand = true
auto_eat_chunks = true
# easy_eat_contaminated = false
runrest_stop_message += corpse
message_colour += mute:You (start|continue|finish|stop) butchering
message_colour += mute:This raw flesh tastes
message_colour += mute:You continue eating

autoinscribe += (inedible|mutagenic|forbidden).*(chunk|corpse):noeat
autofight_stop = 75
hp_warning = 50

rest_wait_percent = 99
explore_auto_rest = true

travel_delay = 1
explore_delay = 1
rest_delay = -1
show_travel_trail = true
# explore_stop  = items,stairs,shops,altars,portals,branches,runed_doors
# explore_stop += greedy_visited_item_stack
auto_exclude = oklob plant,statue,curse skull,roxanne
runrest_ignore_poison  = 2:30
runrest_ignore_monster = butterfly:1
trap_prompt = false
trapwalk_safe_hp = dart:1,needle:1,arrow:1,bolt:1,spear:1,axe:1,blade:1,teleport:1,zot:1,alarm:1

{
LOS = 7

function at_feet()
  return iter.invent_iterator:new(you.floor_items())
end

function count_nearby(cx, cy, r)
  local x, y
  local i = 0
  for x = -r, r do
    for y = -r, r do
      i = i+1

    end
  end
end

need_skills_opened = true
function open_skills()
  if you.turns() == 0 and need_skills_opened then
    crawl.sendkeys("m/bffm")
    need_skills_opened = false
  end
end


function Set(list)
  local set = {}
  for _, l in ipairs(list) do
    set[l] = true
  end
end


function check_dun()
  -- check if you are in a valid level for auto_hunting
  local dungeon = {"D:1", "D:2", "D:3", "D:4", "D:5", "D:6", "D:7", "D:8", "D:9"}
  for _, valid_level in pairs(dungeon) do
    if you.where() == valid_level then
      -- crawl.mpr("you are in " .. you.where())
      return true
    end
  end
  return false
end

function count_nearby(cx, cy, r)
  local x, y
  local i = 0
  for x = -r, r do
    for y = -r, r do

end

function max(a, b)
  return (a < b) ? b : a;
end

function do_hunt()
  if check_dun() then

  end
end

function ready()
  -- if you.xl() < 11 and
  -- if you.xl() < 11 and you.where() ~= "Dungeon"

  open_skills()
end

}

