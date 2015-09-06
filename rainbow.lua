-- script startup (no need to do anything fancy, just print a welcome message)
major_version = 1;
minor_version = 0;
server = getServer();
function onEnable()
    print(string.format("Rainbow version %d.%d started", major_version, minor_version));
end
-- end script startup function
--
function onPlayerCommand(event)
    local cmd = StringUtils:explode(event.command, " ");
    cmd[1] = string.lower(cmd[1]);

    if cmd[1] == "/rainbow" then
        if #cmd < 2 then
            event.player:sendTextMessage("[#FF0000]USAGE: /rainbow <message>");
            return;
        end
        -- use the below line to change colours of the rainbow
        local possible_colors = { "[#B22222]","[#FF8C00]","[#DAAF20]","[#8A2BE2]","[#0000FF]" };
        -- use the above line to change colours of the rainbow
        local original_string = string.sub(event.command, string.len("/rainbow "));
        local rainbow_string = "";
        for i=1,string.len(original_string) do
            local letter = string.sub(original_string, i, i);
            rainbow_string = string.format("%s%s%s",rainbow_string,possible_colors[math.random(5)],letter);
        end
        server:brodcastTextMessage(string.format("%s: %s", event.player:getName(), rainbow_string));
    end
end
addEvent("PlayerCommand", onPlayerCommand);
