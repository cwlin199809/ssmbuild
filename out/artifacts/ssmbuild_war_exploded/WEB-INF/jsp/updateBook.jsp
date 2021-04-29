<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--Bootstrap 美化界面--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <%--出现问题: 我们提交了修改的SQL请求,但是修改失败.
            解决思路: 首先, 考虑事务问题; 配置事务后, 仍然失败! 然后,发现前端没有给SQL语句传入bookID!
            解决方法: 前端通过隐藏域向SQL语句传递bookID.
        --%>
        <label>
            <input type="text" name="bookID" value="${books.bookID}" hidden>
        </label>
        <div class="form-group">
            <label for="bookName">书籍名称：</label>
            <input type="text" name="bookName" class="form-control" id="bookName" value="${books.bookName}" placeholder="请输入书籍名称" required>
        </div>
        <div class="form-group">
            <label for="bookCounts">书籍数量：</label>
            <input type="text" name="bookCounts" class="form-control" id="bookCounts" value="${books.bookCounts}" placeholder="请输入书籍数量" required>
        </div>
        <div class="form-group">
            <label for="detail">书籍描述：</label>
            <input type="text" name="detail" class="form-control" id="detail" value="${books.detail}" placeholder="请输入书籍描述" required>
        </div>
        <button type="submit" class="btn btn-default">Update</button>
    </form>
</div>

</body>
</html>
