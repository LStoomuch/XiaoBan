# XiaoBan小梦大半
### 项目简介：
    这是一个在线论坛网站，实现了大部分论坛都有的功能。游客查看各版块帖子，会员发帖子和在他人帖子下发表评论回复，
    管理员可对会员的权限、论坛版块、帖子和回复的管理。
 
### 技术选型
    前端框架选型：jQuery、bootStrap、layer弹出层插件，后端选用Spring、Hibernate、Springmvc等开源框
    架开发，数据库使用mysql数据库。使用maven管理项目包之间的依赖。
  
### 介绍
  * 了解了下页面中嵌套iframe的不便之处，例如：移动端对iframe不友好，各种分辨率很难协调；iframe等于打开一个新的
    网页，所有的JS/CSS全部加载一遍，很消耗客户端内存；以及不方便页面的整体布局，为了使页面采用统一的风格，所以
    我在客户端发起请求时先返回一个包含多个空\<div>的jsp页面，再使用jQuery、ajax异步加载空白jsp中各个\<div>的内容。
    这么做也很方便之后有些操作需要刷新局部页面，只需调用之前加载某个\<div>中jsp页面的JS方法即可。
    
  * 使用分页查询。所有的查询显示都在后端将查询结果分页给前台展示。
  * SpringMVC和restful风格搭配使用。按照restful api，url请求写成资源名称，操作例如get、post、put、delete根据
    http请求方式来匹配方法。
    
  * 用Filter过滤器在处理请求之前判断用户状态。例如：管理员注销后再次刷新页面，在后台判断此次请求路径是管理员相关操作，
    且此时session中没有管理员对象，于是后台将请求转发，显示给客户端登陆界面。
    
  * Spring整合Hibernate配置统一的数据源和事务管理。
  
  * 用bootstrap开发响应式页面，页面风格统一用bootstrap全局样式。
