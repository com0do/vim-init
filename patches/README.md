# vim-init local patches

Third-party plugins (in `~/.vim/bundles/`) are pristine upstream clones.
Any local, opinionated tweaks live here as `git format-patch` files so
they survive plugin updates.

## Layout

    patches/
      <PluginName>/
        0001-<subject>.patch
        0002-<subject>.patch
        ...

Every patch is generated with `git format-patch --base=<baseline>`, so
the `base-commit:` trailer inside the patch records the exact upstream
commit the patch was written against. This lets `git am --3way` fall
back to a 3-way merge if upstream context has drifted.

## Applying

For a fresh clone of a plugin, or after `git pull` in `~/.vim/bundles/<Plugin>/`:

```bash
cd ~/.vim/bundles/<Plugin>
git am --3way ~/.vim/vim-init/patches/<Plugin>/*.patch
```

If a patch no longer applies cleanly:

```bash
# inspect the base commit the patch expected
grep '^base-commit:' ~/.vim/vim-init/patches/<Plugin>/0001-*.patch

# option A: apply on top of that base, then rebase forward
git checkout <base-commit>
git am --3way ~/.vim/vim-init/patches/<Plugin>/*.patch
git rebase master

# option B: resolve conflicts inline
git am --3way ~/.vim/vim-init/patches/<Plugin>/0001-*.patch
# ... fix conflicts ...
git add -u && git am --continue

# then regenerate the patch so the base moves forward
git format-patch --base=<new-base> -1 -o ~/.vim/vim-init/patches/<Plugin>/
```

## Current patches

### LeaderF

- `0001-bufExpl-add-g-Lf_ShowTerminalBuffers-...patch`
  Base: `8a50a04` (Yggdroot/LeaderF master @ 2024-07 or later).
  Adds `g:Lf_ShowTerminalBuffers` (default 0) so `LeaderfBuffer` can
  optionally list `buftype=terminal` buffers on Vim.
  Enable in your vimrc with:

  ```vim
  let g:Lf_ShowTerminalBuffers = 1
  ```
