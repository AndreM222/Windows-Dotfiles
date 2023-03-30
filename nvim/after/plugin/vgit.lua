local status, git = pcall(require, "vgit")
if (not status) then return end

git.setup({ settings = { scene = { diff_preference = 'split' } } } )
