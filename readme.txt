现有案例：
signature：签名相关
Graphdw_saveas：图表标题等字体的倾斜度(旋转)；
graphintegration：图表各样式，图表标题字体
Performance：字段及控件颜色
newpdf_Greg(1481)：客户提供的多层嵌套报表；
dw_gradient_transparency：dw背景（header、detail，summary、footer）颜色，控件背景，图片，
xslfo_to_pdf_conversion：各类dw风格
appeon_code_examples：各类都涉及一些，作为一个补充；
dwintegration：各类dw风格，稍微复杂些；
testrapport：报表，比较单一；
treedw：TreeView数据窗口的补充；
rtedemo：RichText的字体大小及颜色；
pbdemos：TreeView数据窗口的补充；
pageA4test(1523)：纸张选择8.5*11in刚好满1屏report，NativePDF默认值8.26*11.7 打印2屏；
t_language：RichText 多语言测试；
dw_pdf_test(1504):dw背景图片；
test1(1524):条形编码；
testboldpdf(1542):NativePDF 和GhostScript 字体比较；
qrproblem(1562):二维码案例；


验证标准：所见即所得
1.颜色：字段和控件（线条、正方形、椭圆、按钮--“受属性控制”、图片，下拉框、单选、多选等）前后背景颜色，字体颜色，dw本身背景（header、detail，summary、footer）颜色（渐变色），背景图颜色(Print Shows Background)，颜色还原接近真实；
2.大小：字段及控件文字大小间距、粗细、放大缩小清晰可见，最好是矢量效果(图片除外)，图片动态修改；
3.打印区域(纸张大小)：纵横方向，区域内正常显示，验证区域外换页打印，特别是空白页；
4.图表：标题旋转角度，各种样式的Graph，（现3D PIE 毛边）；
5.字体：各支持字体，不丢失，未安装字体，（PB会加载当前目录下的字体，如条形编码）；
6.dw风格：Tabular、Grid、Label、N-Up、Group、Free Form、Crosstab、Child Report、TreeView、Grid TV和多嵌套报表；
7.RichTextDW：颜色（背景，字体），字体大小位置, 没有重复和重叠；
8.签名：inkpicture(有背景、无背景)字段，inkpicture签名后保存图片文件再动态加载到dw的picture控件中（或者计算列中）；
9.嵌套报表：各子报表显示完整；
10.二维码清晰度（100%~200%），手机是否可以识别；
11.PDF文件属性的Fonts参数；
12.Runtime下，考虑不同语言下的情况；

PDF新方案：
A.PDF标准PDF/A、PDF/A3 (0~5)的验证(关键字查找?透明度？字体全部嵌入？嵌入其他文档(不包含音乐电影等))；
B.有/无打印机环境下默认纸张/非默认纸张验证；


现有问题：
1.使用了系统未安装字体，PDF和显示的不一致，比如条形编码打印出来是数值，PB运行会读取当前目录的字体；；
2.dw背景(开启Print Shows Background)各区域渐变色打印有白色横线（缩放100%）；
3.同样字体大小，Native和Ghostscript不一样，删除钱偏下，下划线偏上，Header换行间距太大；
4.图片或者二维码清晰度，Native比Ghostscript差，模糊化；
5.页面为8.5*11in时，Native打印出来是8.26*11.7in，默认纸张在Label中也有不同；
6.Richtext 文字重叠；
7.图表3D PIE Native比Ghostscript差，有锯齿毛边，对弧度处理效果不好，文件大小很小；
8.按钮是否打印没有根据开关(Display Buttons - Print)来；

