<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>首页</title>

    <style>
      a{
        text-decoration: none;
        color: black;
        font-size: 36px;
      }
      h3{
        width: 360px;
        height: 72px;
        margin: 100px auto;
        text-align: center;
        line-height: 72px;
        background: deepskyblue;
        border-radius: 6px;
      }
    </style>
  </head>
  <body>
    <h3>
      <%-- href 访问图书展示页面的路径 --%>
      <a href="${pageContext.request.contextPath}/book/allBook">点击进入书籍页面</a>
    </h3>
  </body>
</html>
