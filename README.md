# my-nvim-config

neovim config built on lazy.nvim. extremely lightweight. 
---

## plugins

| plugin | what it does |
|---|---|
| catppuccin | colorscheme (mocha) |
| lualine | statusline |
| bufferline | buffer tabs |
| alpha-nvim | start screen |
| neo-tree | file explorer |
| telescope | fuzzy finder — files, grep, buffers, help |
| nvim-treesitter | syntax highlighting + indentation for c, cpp, python, rust, java, js, ts, lua, bash, json, html, css |
| nvim-lspconfig | lsp client |
| mason + mason-lspconfig | lsp installer — pyright, rust_analyzer, tsserver, jdtls, clangd, gopls |
| nvim-cmp + luasnip | completions (lsp, buffer, path) |
| nvim-autopairs | bracket/quote pairing |
| conform.nvim | format on save — black, prettier, rustfmt, clang-format, goimports, google-java-format |
| nvim-lint | lint on save/enter/leave insert — eslint, flake8, pylint, clangtidy |
| gitsigns | git hunk indicators in the sign column |
| harpoon | file bookmarks + fast switching |
| persistence.nvim | session save/restore |
| which-key | keymap hint popup |
| snacks.nvim | subtle indent guides |
| autorun (local) | run current file in a terminal split |

---

## keybindings

leader is `space`.

### general

| key | action |
|---|---|
| `<leader>w` | save |
| `<leader>q` | quit |

### navigation

| key | action |
|---|---|
| `<C-h/j/k/l>` | move between windows |
| `<A-h/j/k/l>` | resize windows |
| `H` | jump to line start (`^`) |
| `L` | jump to line end (`$`) |
| `<leader>gg` | go to top |
| `<leader>G` | go to bottom |

### file tree

| key | action |
|---|---|
| `<leader>e` | toggle neo-tree |

### telescope

| key | action |
|---|---|
| `<leader>ff` | find files |
| `<leader>fg` | live grep |
| `<leader>fb` | open buffers |
| `<leader>fh` | help tags |

### harpoon

| key | action |
|---|---|
| `<leader>a` | mark file |
| `<leader>h` | toggle harpoon menu |
| `<leader>1-4` | jump to marked file 1-4 |

### lsp (active when an lsp is attached)

| key | action |
|---|---|
| `gd` | go to definition |
| `gD` | go to declaration |
| `gi` | go to implementation |
| `gr` | references |
| `K` | hover docs |
| `<leader>rn` | rename symbol |
| `<leader>ca` | code action |
| `[d` / `]d` | prev/next diagnostic |
| `<leader>de` | diagnostic float |
| `<leader>f` | lsp format |
| `<leader>gd` | toggle go diagnostics |
| `pd` | toggle python diagnostics (python buffers only) |

### formatting + linting

| key | action |
|---|---|
| `<leader>F` | format with conform |
| `<leader>l` | run linter manually |

### sessions

| key | action |
|---|---|
| `<leader>s` | restore session for cwd |
| `<leader>S` | restore last session |
| `<leader>ss` | pick a session |

### completion (insert mode)

| key | action |
|---|---|
| `<Tab>` | next completion item |
| `<S-Tab>` | prev completion item |
| `<CR>` | confirm completion |

### autorun

| key | action |
|---|---|
| `<leader>r` | run current file in a terminal split |

supports: python, rust (cargo run), javascript (node), typescript (ts-node), c, cpp, java.

---

## install

```
git clone https://github.com/santh-cpu/my-nvim-config ~/.config/nvim
nvim
```

lazy.nvim bootstraps itself on first launch. lsp servers install via `:Mason`.
