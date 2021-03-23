local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section

local colors = {
    name = 'Dracula',
    cursorColor = '#F8F8F2',
    selectionBackground = '#44475A',
    background = '#282A36',
    foreground = '#F8F8F2',
    black = '#21222C',
    blue = '#BD93F9',
    cyan = '#8BE9FD',
    green = '#50FA7B',
    purple = '#FF79C6',
    red = '#FF5555',
    white = '#F8F8F2',
    yellow = '#F1FA8C',
    brightBlack = '#6272A4',
    brightBlue = '#D6ACFF',
    brightCyan = '#A4FFFF',
    brightGreen = '#69FF94',
    brightPurple = '#FF92DF',
    brightRed = '#FF6E6E',
    brightWhite = '#FFFFFF',
    brightYellow = '#FFFFA5'
}

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    RainbowRed = {
        provider = function()
            return '   '
        end,
        highlight = {colors.blue, colors.background}
    }
}
gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.purple,
                no = colors.red,
                s = colors.purple,
                S = colors.purple,
                [''] = colors.purple,
                ic = colors.yellow,
                R = colors.violet,
                Rv = colors.violet,
                cv = colors.red,
                ce = colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.red,
                t = colors.red
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '   '
        end,
        highlight = {colors.red, colors.background, 'bold'}
    }
}
gls.left[3] = {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = {colors.foreground, colors.background}
    }
}
gls.left[4] = {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.background}
    }
}

gls.left[5] = {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.cyan, colors.background, 'bold'}
    }
}

gls.left[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.foreground, colors.background}
    }
}

gls.left[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.foreground, colors.background, 'bold'}
    }
}

gls.left[8] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.background}
    }
}
gls.left[9] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow, colors.background}
    }
}

gls.left[10] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan, colors.background}
    }
}

gls.left[11] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.background}
    }
}

gls.mid[1] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [''] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = ' LSP:',
        highlight = {colors.cyan, colors.background, 'bold'}
    }
}

gls.right[1] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.green, colors.background, 'bold'}
    }
}

gls.right[2] = {
    FileFormat = {
        provider = 'FileFormat',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.green, colors.background, 'bold'}
    }
}

gls.right[3] = {
    FileFormatText = {
        provider = function()
            return vim.bo.filetype:upper()
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.green, colors.background, 'bold'}
    }
}

gls.right[4] = {
    GitIcon = {
        provider = function()
            return '  '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.violet, colors.background, 'bold'}
    }
}

gls.right[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.violet, colors.background, 'bold'}
    }
}

gls.right[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.background}
    }
}
gls.right[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.orange, colors.background}
    }
}
gls.right[8] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.background}
    }
}

gls.right[9] = {
    RainbowBlue = {
        provider = function()
            return '   '
        end,
        highlight = {colors.blue, colors.background}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.background},
        highlight = {colors.blue, colors.background, 'bold'}
    }
}

gls.short_line_left[2] = {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.foreground, colors.background, 'bold'}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.foreground, colors.background}}
}
