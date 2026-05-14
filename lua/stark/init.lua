-- Stark: a high-contrast black-background Neovim colorscheme

local M = {
  name = "stark",
}

-- Custom color theme foundation. Start monochrome, then add personal accents deliberately.
local nvim_background = "#000000"
local nvim_foreground = "#f2f2f2"
local nvim_muted = "#9aa4b5"

-- Make gutter line numbers readable. Reapply after colorscheme changes.
local function apply_line_number_highlights()
  vim.api.nvim_set_hl(0, "LineNr", { fg = nvim_muted, bg = nvim_background })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = nvim_foreground, bg = nvim_background, bold = true })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = nvim_background })
end
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = apply_line_number_highlights,
})
apply_line_number_highlights()

local custom_theme = {
  bg = nvim_background,
  fg = nvim_foreground,
  muted = nvim_muted,
  comment = "#aab4c4",
  string = "#ffd580",
  keyword = "#cba6f7",
  func = "#89b4fa",
  constant = "#fab387",
  type = "#8bd5ca",
  component = "#89b4fa",
  prop = "#8bd5ca",
  heading = "#cba6f7",
  link = "#89b4fa",
  markdown_code = "#ffd580",
  quote = "#aab4c4",
  bullet = "#8bd5ca",
  parameter = "#fff1dd",
  property = "#dce8ff",
  punctuation = "#aab4c4",
  variable = "#e6e6e6",
  error = "#ff7b72",
  warn = "#ffd580",
  info = "#89b4fa",
  hint = "#8bd5ca",
  surface = "#101010",
  surface_high = "#262626",
  popup = "#080808",
  popup_selection = "#172033",
  cursorline = "#0b0f14",
  selection = "#2a3344",
  search_bg = "#ffd580",
  search_fg = "#000000",
  git_add = "#a6e3a1",
  git_change = "#89b4fa",
  git_delete = "#ff7b72",
  diff_add_bg = "#102015",
  diff_change_bg = "#101827",
  diff_delete_bg = "#241010",
  border = "#303030",
}

function M.load()
  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = M.name

  local set_hl = vim.api.nvim_set_hl
  local c = custom_theme

  -- Core editor surface.
  set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
  set_hl(0, "NormalNC", { fg = c.fg, bg = c.bg })
  set_hl(0, "NormalFloat", { fg = c.fg, bg = c.popup })
  set_hl(0, "FloatBorder", { fg = c.border, bg = c.popup })
  set_hl(0, "EndOfBuffer", { fg = c.bg, bg = c.bg })
  set_hl(0, "VertSplit", { fg = c.border, bg = c.bg })
  set_hl(0, "WinSeparator", { fg = c.border, bg = c.bg })
  set_hl(0, "Cursor", { fg = c.bg, bg = c.fg })
  set_hl(0, "CursorLine", { bg = c.cursorline })
  set_hl(0, "Visual", { bg = c.selection })
  set_hl(0, "Search", { fg = c.search_fg, bg = c.search_bg })
  set_hl(0, "IncSearch", { fg = c.search_fg, bg = c.search_bg, bold = true })
  set_hl(0, "MatchParen", { fg = c.fg, bg = c.surface_high, bold = true })
  set_hl(0, "ColorColumn", { bg = c.surface })

  -- UI chrome.
  set_hl(0, "StatusLine", { fg = c.fg, bg = c.surface })
  set_hl(0, "StatusLineNC", { fg = c.muted, bg = c.surface })
  set_hl(0, "TabLine", { fg = c.muted, bg = c.surface })
  set_hl(0, "TabLineSel", { fg = c.fg, bg = c.bg })
  set_hl(0, "Pmenu", { fg = c.fg, bg = c.popup })
  set_hl(0, "PmenuSel", { fg = c.fg, bg = c.popup_selection, bold = true })
  set_hl(0, "PmenuKind", { fg = c.type, bg = c.popup })
  set_hl(0, "PmenuExtra", { fg = c.muted, bg = c.popup })
  set_hl(0, "PmenuSbar", { bg = c.popup })
  set_hl(0, "PmenuThumb", { bg = c.border })
  set_hl(0, "NonText", { fg = c.border })
  set_hl(0, "Whitespace", { fg = c.border })
  set_hl(0, "SpecialKey", { fg = c.muted })
  set_hl(0, "Directory", { fg = c.fg, bold = true })

  -- Syntax palette.
  set_hl(0, "Comment", { fg = c.comment })
  set_hl(0, "Constant", { fg = c.constant })
  set_hl(0, "String", { fg = c.string })
  set_hl(0, "Character", { fg = c.string })
  set_hl(0, "Number", { fg = c.constant })
  set_hl(0, "Boolean", { fg = c.constant })
  set_hl(0, "Float", { fg = c.constant })
  set_hl(0, "Identifier", { fg = c.variable })
  set_hl(0, "Function", { fg = c.func })
  set_hl(0, "Statement", { fg = c.keyword })
  set_hl(0, "Keyword", { fg = c.keyword })
  set_hl(0, "Operator", { fg = c.punctuation })
  set_hl(0, "PreProc", { fg = c.fg })
  set_hl(0, "Type", { fg = c.type })
  set_hl(0, "Special", { fg = c.fg })
  set_hl(0, "Delimiter", { fg = c.punctuation })
  set_hl(0, "Underlined", { fg = c.fg, underline = true })
  set_hl(0, "Todo", { fg = c.bg, bg = c.fg, bold = true })

  -- JSX/TSX: make React components and props distinct from plain text.
  set_hl(0, "@tag", { fg = c.component, bold = true })
  set_hl(0, "@tag.tsx", { fg = c.component, bold = true })
  set_hl(0, "@tag.javascript", { fg = c.component, bold = true })
  set_hl(0, "@tag.builtin", { fg = c.muted })
  set_hl(0, "@tag.builtin.tsx", { fg = c.muted })
  set_hl(0, "@tag.builtin.javascript", { fg = c.muted })
  set_hl(0, "@tag.attribute", { fg = c.prop })
  set_hl(0, "@tag.attribute.tsx", { fg = c.prop })
  set_hl(0, "@tag.attribute.javascript", { fg = c.prop })
  set_hl(0, "@tag.delimiter", { fg = c.punctuation })
  set_hl(0, "@tag.delimiter.tsx", { fg = c.punctuation })
  set_hl(0, "@tag.delimiter.javascript", { fg = c.punctuation })

  -- LSP semantic tokens: refine TypeScript/React symbols when language servers provide them.
  set_hl(0, "@lsp.type.parameter", { fg = c.parameter })
  set_hl(0, "@lsp.type.property", { fg = c.property })
  set_hl(0, "@lsp.type.method", { fg = c.func })
  set_hl(0, "@lsp.type.function", { fg = c.func })
  set_hl(0, "@lsp.type.class", { fg = c.type })
  set_hl(0, "@lsp.type.interface", { fg = c.type })
  set_hl(0, "@lsp.type.type", { fg = c.type })
  set_hl(0, "@lsp.type.typeParameter", { fg = c.type })
  set_hl(0, "@lsp.type.enum", { fg = c.type })
  set_hl(0, "@lsp.type.enumMember", { fg = c.constant })
  set_hl(0, "@lsp.type.variable", { fg = c.variable })
  set_hl(0, "@lsp.type.keyword", { fg = c.keyword })
  set_hl(0, "@lsp.type.string", { fg = c.string })
  set_hl(0, "@lsp.type.number", { fg = c.constant })
  set_hl(0, "@lsp.type.boolean", { fg = c.constant })
  set_hl(0, "@lsp.type.comment", { fg = c.comment })
  set_hl(0, "@lsp.mod.deprecated", { strikethrough = true })
  set_hl(0, "@lsp.mod.readonly", { fg = c.constant })

  -- Markdown/prose.
  set_hl(0, "Title", { fg = c.heading, bold = true })
  set_hl(0, "@markup.heading", { fg = c.heading, bold = true })
  set_hl(0, "@markup.heading.1", { fg = c.heading, bold = true })
  set_hl(0, "@markup.heading.2", { fg = c.func, bold = true })
  set_hl(0, "@markup.heading.3", { fg = c.type, bold = true })
  set_hl(0, "@markup.heading.4", { fg = c.string, bold = true })
  set_hl(0, "@markup.heading.5", { fg = c.constant, bold = true })
  set_hl(0, "@markup.heading.6", { fg = c.comment, bold = true })
  set_hl(0, "@markup.link", { fg = c.link, underline = true })
  set_hl(0, "@markup.link.label", { fg = c.link })
  set_hl(0, "@markup.link.url", { fg = c.link, underline = true })
  set_hl(0, "@markup.raw", { fg = c.markdown_code })
  set_hl(0, "@markup.raw.block", { fg = c.markdown_code })
  set_hl(0, "@markup.quote", { fg = c.quote, italic = true })
  set_hl(0, "@markup.list", { fg = c.bullet })
  -- Bold prose gets a visible accent; heading queries have higher priority and keep heading colors.
  set_hl(0, "@markup.strong", { fg = c.heading, bold = true })
  set_hl(0, "@markup.italic", { italic = true })
  set_hl(0, "markdownHeadingDelimiter", { fg = c.heading })
  set_hl(0, "markdownCode", { fg = c.markdown_code })
  set_hl(0, "markdownCodeBlock", { fg = c.markdown_code })
  set_hl(0, "markdownBlockquote", { fg = c.quote, italic = true })
  set_hl(0, "markdownListMarker", { fg = c.bullet })
  set_hl(0, "markdownUrl", { fg = c.link, underline = true })
  set_hl(0, "markdownLinkText", { fg = c.link })

  -- Diagnostics reuse the established palette so alerts are readable but cohesive.
  set_hl(0, "DiagnosticError", { fg = c.error })
  set_hl(0, "DiagnosticWarn", { fg = c.warn })
  set_hl(0, "DiagnosticInfo", { fg = c.info })
  set_hl(0, "DiagnosticHint", { fg = c.hint })
  set_hl(0, "DiagnosticUnderlineError", { sp = c.error, undercurl = true })
  set_hl(0, "DiagnosticUnderlineWarn", { sp = c.warn, undercurl = true })
  set_hl(0, "DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
  set_hl(0, "DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
  set_hl(0, "ErrorMsg", { fg = c.error })
  set_hl(0, "WarningMsg", { fg = c.warn })

  -- Git and diff views use subtle backgrounds with clear gutter signs.
  set_hl(0, "DiffAdd", { fg = c.git_add, bg = c.diff_add_bg })
  set_hl(0, "DiffChange", { fg = c.git_change, bg = c.diff_change_bg })
  set_hl(0, "DiffDelete", { fg = c.git_delete, bg = c.diff_delete_bg })
  set_hl(0, "DiffText", { fg = c.fg, bg = c.selection, bold = true })
  set_hl(0, "Added", { fg = c.git_add })
  set_hl(0, "Changed", { fg = c.git_change })
  set_hl(0, "Removed", { fg = c.git_delete })
  set_hl(0, "GitSignsAdd", { fg = c.git_add, bg = c.bg })
  set_hl(0, "GitSignsChange", { fg = c.git_change, bg = c.bg })
  set_hl(0, "GitSignsDelete", { fg = c.git_delete, bg = c.bg })
  set_hl(0, "GitSignsAddNr", { fg = c.git_add, bg = c.bg })
  set_hl(0, "GitSignsChangeNr", { fg = c.git_change, bg = c.bg })
  set_hl(0, "GitSignsDeleteNr", { fg = c.git_delete, bg = c.bg })
  set_hl(0, "NvimTreeGitNew", { fg = c.git_add })
  set_hl(0, "NvimTreeGitDirty", { fg = c.git_change })
  set_hl(0, "NvimTreeGitDeleted", { fg = c.git_delete })

  -- Completion, hover docs, and fuzzy-finder popups.
  set_hl(0, "BlinkCmpMenu", { fg = c.fg, bg = c.popup })
  set_hl(0, "BlinkCmpMenuBorder", { fg = c.border, bg = c.popup })
  set_hl(0, "BlinkCmpMenuSelection", { fg = c.fg, bg = c.popup_selection, bold = true })
  set_hl(0, "BlinkCmpDoc", { fg = c.fg, bg = c.popup })
  set_hl(0, "BlinkCmpDocBorder", { fg = c.border, bg = c.popup })
  set_hl(0, "BlinkCmpDocSeparator", { fg = c.border, bg = c.popup })
  set_hl(0, "BlinkCmpSignatureHelp", { fg = c.fg, bg = c.popup })
  set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = c.border, bg = c.popup })
  set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { fg = c.parameter, bg = c.popup_selection, bold = true })
  set_hl(0, "BlinkCmpLabel", { fg = c.fg, bg = c.popup })
  set_hl(0, "BlinkCmpLabelMatch", { fg = c.func, bg = c.popup, bold = true })
  set_hl(0, "BlinkCmpLabelDeprecated", { fg = c.muted, bg = c.popup, strikethrough = true })
  set_hl(0, "BlinkCmpLabelDetail", { fg = c.muted, bg = c.popup })
  set_hl(0, "BlinkCmpLabelDescription", { fg = c.muted, bg = c.popup })
  set_hl(0, "BlinkCmpSource", { fg = c.comment, bg = c.popup })
  set_hl(0, "BlinkCmpKind", { fg = c.type, bg = c.popup })
  set_hl(0, "BlinkCmpKindFunction", { fg = c.func, bg = c.popup })
  set_hl(0, "BlinkCmpKindMethod", { fg = c.func, bg = c.popup })
  set_hl(0, "BlinkCmpKindClass", { fg = c.type, bg = c.popup })
  set_hl(0, "BlinkCmpKindInterface", { fg = c.type, bg = c.popup })
  set_hl(0, "BlinkCmpKindProperty", { fg = c.property, bg = c.popup })
  set_hl(0, "BlinkCmpKindField", { fg = c.property, bg = c.popup })
  set_hl(0, "BlinkCmpKindVariable", { fg = c.variable, bg = c.popup })
  set_hl(0, "BlinkCmpKindConstant", { fg = c.constant, bg = c.popup })
  set_hl(0, "BlinkCmpKindKeyword", { fg = c.keyword, bg = c.popup })
  set_hl(0, "BlinkCmpKindText", { fg = c.string, bg = c.popup })
  set_hl(0, "BlinkCmpGhostText", { fg = c.border })
  set_hl(0, "FzfLuaNormal", { fg = c.fg, bg = c.popup })
  set_hl(0, "FzfLuaBorder", { fg = c.border, bg = c.popup })
  set_hl(0, "FzfLuaTitle", { fg = c.func, bg = c.popup, bold = true })
  set_hl(0, "FzfLuaCursorLine", { fg = c.fg, bg = c.popup_selection })
  set_hl(0, "FzfLuaSearch", { fg = c.search_fg, bg = c.search_bg, bold = true })
  set_hl(0, "FzfLuaDirPart", { fg = c.comment })
  set_hl(0, "FzfLuaFilePart", { fg = c.fg })
  set_hl(0, "FzfLuaFzfMatch", { fg = c.func, bold = true })
  set_hl(0, "FzfLuaFzfPrompt", { fg = c.keyword })
  set_hl(0, "FzfLuaFzfPointer", { fg = c.func })

  -- NvimTree sidebar.
  set_hl(0, "NvimTreeNormal", { fg = c.variable, bg = c.bg })
  set_hl(0, "NvimTreeNormalNC", { fg = c.variable, bg = c.bg })
  set_hl(0, "NvimTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
  set_hl(0, "NvimTreeSignColumn", { bg = c.bg })
  set_hl(0, "NvimTreeWinSeparator", { fg = c.border, bg = c.bg })
  set_hl(0, "NvimTreeCursorLine", { bg = c.cursorline })
  set_hl(0, "NvimTreeRootFolder", { fg = c.keyword, bold = true })
  set_hl(0, "NvimTreeFolderName", { fg = c.func })
  set_hl(0, "NvimTreeOpenedFolderName", { fg = c.keyword, bold = true })
  set_hl(0, "NvimTreeEmptyFolderName", { fg = c.muted })
  set_hl(0, "NvimTreeFolderIcon", { fg = c.func })
  set_hl(0, "NvimTreeOpenedFolderIcon", { fg = c.keyword })
  set_hl(0, "NvimTreeClosedFolderIcon", { fg = c.func })
  set_hl(0, "NvimTreeFolderArrowClosed", { fg = c.muted })
  set_hl(0, "NvimTreeFolderArrowOpen", { fg = c.keyword })
  set_hl(0, "NvimTreeIndentMarker", { fg = c.border })
  set_hl(0, "NvimTreeOpenedHL", { fg = c.fg, bold = true })
  set_hl(0, "NvimTreeSpecialFile", { fg = c.string, bold = true })
  set_hl(0, "NvimTreeExecFile", { fg = c.git_add })
  set_hl(0, "NvimTreeImageFile", { fg = c.constant })
  set_hl(0, "NvimTreeSymlink", { fg = c.type, underline = true })
  set_hl(0, "NvimTreeSymlinkIcon", { fg = c.type })
  set_hl(0, "NvimTreeHiddenIcon", { fg = c.border })
  set_hl(0, "NvimTreeHiddenFileHL", { fg = c.muted })
  set_hl(0, "NvimTreeHiddenFolderHL", { fg = c.muted })
  set_hl(0, "NvimTreeGitNewIcon", { fg = c.git_add })
  set_hl(0, "NvimTreeGitDirtyIcon", { fg = c.git_change })
  set_hl(0, "NvimTreeGitDeletedIcon", { fg = c.git_delete })
  set_hl(0, "NvimTreeGitStagedIcon", { fg = c.git_add })
  set_hl(0, "NvimTreeGitRenamedIcon", { fg = c.type })
  set_hl(0, "NvimTreeGitMergeIcon", { fg = c.warn })
  set_hl(0, "NvimTreeGitIgnoredIcon", { fg = c.muted })
  set_hl(0, "NvimTreeGitFileNewHL", { fg = c.git_add })
  set_hl(0, "NvimTreeGitFileDirtyHL", { fg = c.git_change })
  set_hl(0, "NvimTreeGitFileDeletedHL", { fg = c.git_delete })
  set_hl(0, "NvimTreeGitFileStagedHL", { fg = c.git_add })
  set_hl(0, "NvimTreeGitFileRenamedHL", { fg = c.type })
  set_hl(0, "NvimTreeGitFileMergeHL", { fg = c.warn })
  set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = c.muted })
  set_hl(0, "NvimTreeModifiedIcon", { fg = c.warn })
  set_hl(0, "NvimTreeModifiedFileHL", { fg = c.warn })

  apply_line_number_highlights()
end


M.palette = custom_theme

return M
