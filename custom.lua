{
LOS = 7

function at_feet()
  return iter.invent_iterator:new(you.floor_items())
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

function check_dungeon()
  -- check if you are in a valid level for auto_hunting
  local dungeon = {"D:1", "D:2", "D:3", "D:4", "D:5", "D:6", "D:7", "D:8", "D:9"}
  for _, valid_level in pairs(dungeon) do
    if you.where() == valid_level then
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
      if max_dist(x, y) > 0 and monster.get_monster_at(x, y) then
        i = i+1
      end
    end
  end
  return i
end

function max_dist(x, y)
  return math.max(math.abs( x ), math.abs( y ))
end

-- function delta_to_vi(dx, dy)
--   local d2v = {
--     [-1] = {[-1] = 'y', [0] = 'h', [1] = 'b'},
--     [0]  = {[-1] = 'k', [0] = 's', [1] = 'j'},
--     [1]  = {[-1] = 'u', [0] = 'l', [1] = 'n'},
--   }
--   return d2v[dx][dy]
-- end

function do_hunt()
  if check_dungeon() then
    monsters_in_LOS = count_nearby(0, 0, LOS)
    monsters_around = count_nearby(0, 0, 1)
    if monsters_in_LOS > 0 then
      crawl.mpr("Monsters in sight = " .. monsters_in_LOS)
    end
    if monsters_around >= 2 and not you.berserk() then
      crawl.sendkeys("aa")
    end
    if (you.status("-Berserk") or you.status("Berserk")) and monsters_in_LOS == 0 then
      crawl.sendkeys('5')
    end
  end
end

function you_status(str)
  if string.find(you.status(), str) then
    return true
  end
  return false
end

function rest_status()
  status_list = {"berserk", "cooldown", "pois", "slow"}
  for _, val in ipairs(status_list) do
    if you_status(val) then
      return true
    end
  end
  return false
end

function rest_berserk()
  monsters_in_LOS = count_nearby(0, 0, LOS)
  if monsters_in_LOS == 0 and (rest_status()) then
    crawl.sendkeys("5")
  end
  -- crawl.mpr(you.status())
end

function ready()
  open_skills()
  if check_dungeon() then
    rest_berserk()
  end
  -- do_hunt()
end
}
