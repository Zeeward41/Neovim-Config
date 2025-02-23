vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4        -- Chaque tabulation correspond à 4 espaces
vim.opt.softtabstop = 4    -- Indentation et désindentation en mode insertion
vim.opt.shiftwidth = 4     -- Indentation de 4 espaces pour chaque niveau
vim.opt.expandtab = true   -- Remplace les tabulations par des espaces
vim.opt.smartindent = true -- Ajuste automatiquement l'indentation lors d'une nouvelle ligne

-- Affichage
vim.opt.wrap = false                  -- Active ou désactive le retour à la ligne automatique
vim.opt.swapfile = false              -- Désactive la création de fichiers temporaires en cas de plantage
vim.opt.backup = false                -- Désactive la création de fichiers de sauvegarde
vim.opt.undodir = os.getenv("HOME") ..
    "/.local/share/nvim/undotree_dir" -- Répertoire des fichiers d'annulation (undotree)
vim.opt.undofile = true               -- Active la persistance des annulations avec undotree

-- Recherche
vim.opt.hlsearch = false -- Désactive la surbrillance des résultats de recherche
vim.opt.incsearch = true -- Active la surbrillance incrémentale des résultats de recherche

-- Couleurs
vim.opt.termguicolors = true -- Permet à Vim d'utiliser plus de couleurs

-- Interface
vim.opt.scrolloff = 8           -- Nombre minimum de lignes visibles en haut et en bas de l'écran
vim.opt.signcolumn = "yes"      -- Affiche la colonne des signes (pour les diagnostics, etc.)
vim.opt.iskeyword:append("@-@") -- Ajoute les caractères spéciaux aux mots-clés (pour la complétion)

-- Performances
vim.opt.updatetime = 50 -- Temps en millisecondes pour la mise à jour des fichiers swaps

-- Guide de longueur de ligne
vim.opt.colorcolumn = "80" -- Affiche une ligne verticale à la colonne 80 pour indiquer la limite de longueur

vim.diagnostic.config({
    virtual_text = {
        source = true,
        -- prefix = '◆'
        prefix = '🙀'
    },                       -- Texte virtuel à la fin des lignes
    signs = true,            -- Icônes dans la colonne des signes
    underline = false,       -- Soulignement du texte problématique
    update_in_insert = true, -- Ne pas mettre à jour pendant le mode insertion
    severity_sort = true,    -- Trier par sévérité (erreurs avant avertissements)
    source = true
})

-- Change color Diagnostic
vim.cmd([[
    highlight DiagnosticVirtualTextError guifg=#ff0000 guibg=#1d1f27
    highlight DiagnosticVirtualTextWarn  guifg=#b877db guibg=#1d1f27
    highlight DiagnosticVirtualTextInfo  guifg=#00ff00 guibg=#1d1f27
    highlight DiagnosticVirtualTextHint  guifg=#00ffff guibg=#1d1f27
]])
