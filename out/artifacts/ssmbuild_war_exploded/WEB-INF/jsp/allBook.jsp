<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>书籍展示</title>

    <%--Bootstrap 美化界面--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表 —— 显示所有书籍</small>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 column">
                <%--新增书籍 / 显示全部书籍--%>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toInsertBook">新增书籍</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
            </div>
            <div class="col-md-pull-4 column" style="float: right">
                <%--查询书籍--%>
                <form action="${pageContext.request.contextPath}/book/selectBook" method="post" class="form-inline">
                    <span style="color: red; font-weight: bold">${error}</span>
                    <input type="text" name="selectBookName" class="form-control" id="bookName" placeholder="请输入要查询的书籍名称">
                    <input type="submit" value="Search" class="btn btn-primary">
                </form>

            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <%-- 表格头部 --%>
                <thead>
                    <tr>
                        <td>书籍编号</td>
                        <td>书籍名称</td>
                        <td>书籍数量</td>
                        <td>书籍详情</td>
                        <td>操作</td>
                    </tr>
                </thead>

                <%-- 表格内容 --%>
                <%--书籍从数据库中查询得到，并从这个list中遍历: foreach--%>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty error}">
                            <tr>
                                <td colspan="5" style="text-align: center; color: red; font-weight: bold">
                                    ${error}
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="book" items="${list}">
                                <tr>
                                    <td>${book.bookID}</td>
                                    <td>${book.bookName}</td>
                                    <td>${book.bookCounts}</td>
                                    <td>${book.detail}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}">修改</a>
                                        &nbsp;|&nbsp;
                                        <a href="${pageContext.request.contextPath}/book/deleteBook/${book.getBookID()}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
