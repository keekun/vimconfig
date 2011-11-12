ctrl+left  = buffer前跳
ctrl+right = buffer后跳

cmd+j = 快速上滚
cmd+k = 快速下滚
cmd+d = 切换NERDTree
cmd+e = 开启ctags

shift+hjkl = Visual模式选择
ctrl+hjkl = 窗口切换

,h = 上侧打开新的窗口
,v = 左侧打开新的窗口 
,u = 应用配置
,r = 回到上一个修改点
,n = 切换NERDTree
,s = 切换窗口
,b = 打开buffer explorer
,@ = 返回上一个编辑文件
,t = 快速定位文件
,l = 切换可视模式
,f = 超级查找模式

,ew
,es 垂直打开新窗口
,ev 水平打开新窗口
,et

====
NeoComplcache
<tab><S-tab> 选择
<Ctrl+k><Ctrl+j> 选择
<CR> 确认选择
Ctrl+CR 展开snippet 或者 选择snippet位置


====
Surround
Vs<tag> 选择并加上tag
cst<tag> 换一个tag

,__ 加入block注释
gc 批量注释
[u 把URL转成URLENCODE

====
插入模式

qq 返回正常模式
^^ 跳到行头并编辑
¥¥ 跳到行末并编辑

zencoding 

1. Expand Abbreviation

  Type abbreviation as 'div>p#foo$*3>a' and type '<c-y>,'.
  ---------------------
  <div>
      <p id="foo1">
          <a href=""></a>
      </p>
      <p id="foo2">
          <a href=""></a>
      </p>
      <p id="foo3">
          <a href=""></a>
      </p>
  </div>
  ---------------------

2. Wrap with Abbreviation

  Write as below.
  ---------------------
  test1
  test2
  test3
  ---------------------
  Then do visual select(line wize) and type '<c-y>,'.
  If you request 'Tag:', then type 'ul>li*'.
  ---------------------
  <ul>
      <li>test1</li>
      <li>test2</li>
      <li>test3</li>
  </ul>
  ---------------------

  If you type tag as 'blockquote', then you'll see as following.
  ---------------------
  <blockquote>
      test1
      test2
      test3
  </blockquote>
  ---------------------

5. Go to Next Edit Point

  type '<c-y>n' in insert mode.

6. Go to Previous Edit Point

  type '<c-y>N' in insert mode.

9. Remove Tag

  Move cursor in block
  ---------------------
  <div class="foo">
  	<a>cursor is here</a>
  </div>
  ---------------------
  Type '<c-y>k' in insert mode.
  ---------------------
  <div class="foo">
  	
  </div>
  ---------------------

  And type '<c-y>k' in there again.
  ---------------------

  ---------------------

10. Split/Join Tag

  Move cursor in block
  ---------------------
  <div class="foo">
  	cursor is here
  </div>
  ---------------------
  Type '<c-y>j' in insert mode.
  ---------------------
  <div class="foo"/>
  ---------------------

  And type '<c-y>j' in there again.
  ---------------------
  <div class="foo">
  </div>
  ---------------------


11. Toggle Comment

  Move cursor to block
  ---------------------
  <div>
  	hello world
  </div>
  ---------------------
  Type '<c-y>/' in insert mode.
  ---------------------
  <!-- <div>
  	hello world
  </div> -->
  ---------------------
  Type '<c-y>/' in there again.
  ---------------------
  <div>
  	hello world
  </div>
  ---------------------

====
Rails
]f 相关文件
[f 替代文件
gf 跳转文件
http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/
=====
in NERDTree

C 设定根目录
cd 设定此目录为当前目录
m 菜单
i 垂直打开文件
s 水平打开文件
