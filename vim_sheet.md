# My Customizations

## Languages Supported With Additional Tooling

* Ruby
* Elm
* Elixir
* Go
* JavaScript
* HTML
* CSS
* Markdown

## Overall settings

* 2 spaces, no tabs, soft and smart tabbing enabled
* Current column and row highlighted
* Red marker at 80 columns
* Uses MyContrast color scheme tested on almost 100 monitors and projectors in various lighting configurations
* Line numbering and syntax enabled

## General Customizations 

* `,<spacebar>` switches between the two most recent files
* `,sp` toggles spell check on and off.
    * `zg` adds word under cursor to your dictionary
* `,l` toggles whitespace character visibility
* `,g` will attempt to launch the program for the current file
    * HTML files open with default browser
    * Ruby files run with `ruby`
    * Elixir files run with `elixir`
    * Java files compile and run with `javac` and `java`
    * JavaScript files run with `node`
* `,r` reloads the Vim configuration
* `,1` switches to the previous tab
* `,2` switches to the next tab
* `F5` toggles highlighted search terms on and off
* `F6` on OSX opens the Finder to reveal the folder you're working in 
* `,x` deletes the line without saving it to the clipboard
* `,o` creates blank line below cursor without insert mode
* `,O` creates blank line above cursor without insert mode

## Window movement

* `CTRL+j` moves down
* `CTRL+k` moves up
* `CTRL+h` moves left
* `CTRL+l` moves right

## INSERT mode commands:

* `jj` in INSERT mode will exit INSERT mode and save the file
* `jk` in INSERT mode exits INSERT mode


#### File explorer sidebar

Powered by the NERDTree plugin

* `,d` opens and closes the tree displaying contents of current folder
    * press `Enter` to open the file in the main buffer
    * press `i` to open the file in a horizontal split
    * press `s` to open the file in a vertical split
    * press `m` when on a node to get the `menu` to add, delete, rename files.

**This tree always opens to display the `root` folder of a project if you are using Subversion or Git.** Disable the **rooter** plugin if you don't want this behavior.

#### Opening Files with a Fuzzy Search

Powered by the Ctrl-P plugin

* `,f` opens the search window. Type part of the filename to locate it.  
    * Press `Ctrl-K` and `Ctrl-j` to go up and down the list
    * Press `F5` to refresh file list
* `,b` opens search window for buffers only. 

#### Commenting Out Code

Code commenting is powered by NERDCommenter

Use `VISUAL` mode to select text. Then press:

* `,cc` to comment out selected text
* `,cu` to uncomment selected text

#### Ragtag

* `Ctrl-x /` in insert mode closes the open tag. Press again to close outer tag.

In the following table:

* `^` is the cursor position
* `<C-x>` is `Ctrl+x`


Text         |  Command      | result
-------------|---------------|---------
`<p>^`       | `<C-x> /`     | `<p></p>^`
`p^`         | `<C-x> Space` | `<p>^</p>`
`div^`       | `<C-x> Enter` | `<div>\n^\n</div>`
`^`          | `<C-x> @`     | Stylesheet link tag
`^`          | `<C-x> $`      | Script tag
`user.name^` | `<C-x> +`      | `<%= user.name %>`


## Markdown

* `:Toc` displays a table of contents view for your document in a new Quickfix window

## Snippets

Enter a snippet, followed by `<Tab>`. Based on file types.

### HTML
* `html5  generates an html5 skeleton
* 'html5t` generates a simplified HTML5 skeleton
* `ijs` generates `script` blocks for inline JS
* `image` generates image tag with alt
* `csslink` generates a `link` tag for CSS
* `jqueryref` generates a call to load jQuery from CDN
* `jslink` generates link to call external JS
* `textfield` generates `label` and `input type="text"`
* `textfieldbr` generates `label` and `input type="text"` with a `<br>` between
* `textarea` generates `label` and `textarea`
* `textareabr` generates `label` and `textarea` with a `<br>` between
* `emailfield` generates `label` and `input type="email"`
* `emailfieldbr` generates `label` and `input type="email"` with a `<br>` between
* `select` generates `label` and `select` and a default `<option>`
* `selectbr` generates `label` and `select` with a `<br>` between, with a default `<option>` between
* `number` generates `label` and `input type="number"`
* `numberbr` generates `label` and `input type="number"` with a `<br>` between
* `checkbox` generates `label` and `input type="checkbox"`
* `checkboxbr` generates `label` and `input type="checkbox"` with a `<br>` between
* `radio` generates `label` and `input type="radio"`
* `radiobr` generates `label` and `input type="radio"` with a `<br>` between
* `lorem` drops in some lorem ipsum text

## Grunt

* `gruntfile`  creates skeleton for Gruntfiles
* `gtask`  creates skeleton for a task
* `gnpm`  generates `grunt.loadNPMTasks`
* `ginitconfig` generates the initConfig code skeleton
* `gconfig` generates the `grunt.config` modular style of config
* `gll` generates `grunt.log.writeln`
* `gw` generates `grunt.warn`
* `gcg` generates `grunt.config.get`

## JavaScript
* `object` generates skeleton for object literal
* `objectkey` generates the skeleton for an object as a key
* `anon` generates anonymous function 
* `listen` generates `.addEventListener` 
* `keyval` generates a sinple key: value snippet
* `dce` is `document.createElement`
* `dgt` is `document.getElementsByTagName`
* `dgi` is 'document.getElementById`
* 'ac` is `appendChild`
* `fo` is a simple for loop
* `prompt` is a prompt box
* `number` is the `Number` function
* `tof` is `toFixed`
* `dw` is `document.write`
* `dw"` is `document.write("")`
* `todo` puts in a TODO with datestamp
* `note` puts in a NOTE with datestamp
* `fixme` puts in a FIXME with datestamp

## Notes and Comments

Supported in Ruby, Markdown, JavaScript

* `todo` puts in a TODO with datestamp
* `note` puts in a NOTE with datestamp
* `fixme` puts in a FIXME with datestamp


--- 

# Vim Command Review


## Modes

* `NORMAL` is the default mode, for navigation, reviewing, and editing documents.
* `VISUAL` is where you use the keyboard to select characters to cut or copy
* `VISUAL LINE` is where you use the keyboard to select lines to cut or copy
* `INSERT` is where you type text. In Insert mode, Vim behaves like other editors

## Getting out of Insert Mode

Multiple options exist because different keyboards and interfaces exist

* `ESC` returns to Normal mode
* `CTRL-C` returns to Normal mode
* `CTRL-[` returns to Normal mode

In addition, in this setup, these custom bindings are active:

* `jk` in INSERT mode will exit INSERT mode and return to NORMAL mode.
* `jj` in INSERT mode will save the file and then exit INSERT mode and return to NORMAL mode.


## Quitting Vim

`:q` closes the current buffer if it's saved and closes Vim if it's the last buffer
`:qa` closes all buffers that are saved and closes Vim 
`:q!` closes the current buffer, discarding unsaved changes, and closes Vim if it's the last buffer
`:qa!` closes all buffers, discarding unsaved changes,  and closes Vim 
`:wq` saves the current buffer, closes it, and closes Vim if it's the last buffer
`:wqa` saves all open buffers, closes them, and closes Vim


## Normal mode commands


### Moving

#### Basic movement

* `h` move one character left
* `j` move one row down
* `k` move one row up
* `l` move one character right
* `w` move to beginning of next word
* `b` move to previous beginning of word
* `e` move to end of word
* `W` move to beginning of next word after a whitespace
* `B` move to beginning of previous word before a whitespace
* `E` move to end of word before a whitespace


#### Moving quickly

* `gg` move to first line
* `G`  move to last line
* `nG` move to n'th line of file (n is a number; 12G moves to line 12)
* `:n<Enter>` move to n'th line of file (n is a number; `:12<Enter>` moves to line 12)
* `0`  move to beginning of line
* `^`  move to first character of line
* `$`  move to end of line
* `Ctrl-D`  move half-page down
* `Ctrl-U`  move half-page up
* `Ctrl-B`  page up
* `Ctrl-F`  page down
* `H`  move to top of screen
* `M`  move to middle of screen
* `L`  move to bottom of screen
* `z.` scroll the line with the cursor to the center of the screen
* `zt` scroll the line with the cursor to the top
* `zb` scroll the line with the cursor to the bottom

### Editing

* `x` cuts the character under the cursor
* `dd` cuts the line
* `yy` copies the line (yank line)
* `p` pastes after the cursor
* `P` pastes in front of the cursor
* `yyp` duplicates the current line (yank line, paste after cursor)

### Getting into Insert Mode so you can type stuff

* `i` enters Insert mode in front of cursor
* `a` enters Insert mode after the cursor (appends)
* `I` enters Insert mode at the start of the line
* `A` enters Insert mode after the last character of the line (append line)
* `o` creates a new line below and enters Insert mode
* `O` creates a new line above and enters Insert mode

### Rapid edits

* `diw` deletes inner word. Place cursor on word and activate.
* `ciw` changes inner word, removing word under cursor and placing you in Insert mode
* `cit` changes text in an HTML tag, removing the contents between the tags and placing you in Insert mode
* `ci"` changes text between quotes, removing the contents between the quotes and placing you in Insert mode


