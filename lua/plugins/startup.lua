return {
    'echasnovski/mini.starter',
    version = '*',
    config = function()
        local smol_oddish = [[
        ▒▒
        ▒▒▒            ▒▓
       ▒▒▒▒▒▒       ▒▓▓▓▓
       ▒▒▒▒▒▒▒    ▒▓▓▓▓▓▒      ▒▒▒▒▒▒▒▒▒▒
       ▒▒▒▒▒▒▒▓ ▒▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
      ▒▒▒▒▒▒▓▒▒▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒
      ▒▒▒▒▒▒▓▒▒▓▓▓▓▓▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▓▒  ▒▒
       ▓▒▒▒▒▓▓▒▓▓▓▒▒▒▒▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒▒
        ▒▒▓▓▒▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
         ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒
           ▒▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
       ▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
     ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
   ▒▓▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▒▓▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒
   ▓▒▒▒▒▒▒▓▓▓▓▒▒▓▓▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒▒▒
  ▒▒▒▒▒▒▒▒▓▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓
   ▒▒▒▒▒▒▒▓▒▓▒▒▒▒▒▒▒▒▒▒▒▒▓
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓
     ▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓
       ▒▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓▒
      ▒▓▓▓▓▓▒▒▒▓▓▓▓▓▒
     ▒▓▓▓▓▓▓   ▓▓▓▓▓▒
     ▒▓▓▓▓▓▒  ▓▓▓▓▓▓▓
      ▒▒▒▒    ▓▓▓▓▓▓▒
              ▒▓▒▒▓▒
        ]]
        local oddish = [[
          ▒▒
          ▒▒▒▒                ▒▒
         ▒▒▒▒▒▒             ▒▓▓▓
         ▒▒▒▒▒▒▒▒        ▒▓▓▓▓▓▒
         ▒▒▒▒▒▒▒▒▓     ▒▓▓▓▓▓▓▓▒      ▒▒▒▒▒▒▒▒▒▒▒▒▒▓
        ▒▒▒▒▒▒▓▒▒▒▓  ▒▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒
        ▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓
        ▒▒▒▒▒▒▒▓▒▒▒▒▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒ ▓▓▓
        ▒▒▒▒▒▒▒▓▓▒▒▒▓▓▓▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒   ▒▓
         ▓▒▒▒▒▒▒▓▓▒▓▓▓▓▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▒▒▒
          ▓▒▒▓▓▒▒▓▒▓▓▓▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒
           ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒
             ▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▓▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▒
               ▓▓▒▓▓▓▓▓▓▓▓▓▓▒▒▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
         ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
       ▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
     ▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒
    ▓▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒
   ▒▓▒▒▒▒▒▒▒▒▓▓▓▓▓▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒
   ▒▒▒▒▒▒▒▒▒▒▓▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓
   ▒▒▒▒▒▒▒▒▒▒▓▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
    ▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒
     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓
       ▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓
         ▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
         ▒▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▓▓▒
        ▓▓▓▓▓▓▓▒  ▒▓▓▓▓▓▓▓
       ▓▓▓▓▓▓▓▓▒   ▓▓▓▓▓▓▓
       ▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▒
       ▓▒▒▒▓▓▒    ▓▓▓▓▓▓▓▓
        ▒▒▒▒      ▓▓▓▓▓▓▓▒
                  ▒▓▒▒▒▒▒
        ]]
        local starter = require('mini.starter')

        local harpoon_files = function()
            local harpoon = require('harpoon')
            local section = {}
            for i, item in ipairs(harpoon:list().items) do
                table.insert(section,
                    {
                        name = i .. ': ' .. item.value,
                        action = 'lua require("harpoon"):list():select(' .. i .. ')',
                        section =
                        "Harpoon"
                    })
            end
            return section
        end

        starter.setup({
            header = oddish,
            items = {
                { name = "Open Recent", action = "lua require('telescope.builtin').oldfiles({only_cwd = true})", section = "Telescope" },
                -- starter.sections.recent_files(10, true),
                { name = "Find Files",  action = "Telescope find_files",                                         section = "Telescope" },
                harpoon_files(),
                { name = "Lazy", action = "Lazy check",                                            section = "Builtin actions" },
                { name = "Git",  action = "lua vim.cmd('Explore') vim.cmd('Git') vim.cmd('only')", section = "Builtin actions" },
                starter.sections.builtin_actions()
            },
        })
    end
}