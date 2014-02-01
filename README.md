memo_search
===========
STATUS: Experimental

Usage
-----
~/.vimrcにて
```
let g:memo_search_dirs = [ $HOME . "/src/doc" ]
```
のように設定して:Unite memo_searchとする。
g:memo_search_dirs下にある"txt", "html", "htm", "md"ファイル全行が候補となる。

License
-------
Copyright &copy; 2013 mathfur
Distributed under the [MIT License][mit].
[MIT]: http://www.opensource.org/licenses/mit-license.php
