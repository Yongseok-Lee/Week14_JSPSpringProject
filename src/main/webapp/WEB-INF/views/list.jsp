<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2022-12-02
  Time: 오후 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>자유 게시판</title>
    <link rel="stylesheet" href="https://unpkg.com/mvp.css@1.12/mvp.css">
    <script>
        function delete_ok(id)
        {
            const isOK = confirm("정말로 삭제하시겠습니까?");
            if (isOK)
            {
                location.href = "delete_ok/" + id;
            }
        }

        const msg = "${msg}";
        if (msg === "deleted")
        {
            alert("삭제되었습니다.");
        }
    </script>
</head>
<body>
<header>
    <h1>자유 게시판</h1>
</header>
<main>
    <table id="list" style="margin: 0 auto">
        <tr>
            <th>번호</th>
            <th>분류</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>내용</th>
            <th>작성 일자</th>
            <th>글 수정</th>
            <th>글 삭제</th>
        </tr>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.seq}</td>
                <td>${u.category}</td>
                <td>${u.title}</td>
                <td>${u.writer}</td>
                <td>${u.content}</td>
                <td>${u.regdate}</td>
                <td><a href="edit/${u.seq}">글 수정</a></td>
                <td><a href="javascript:delete_ok('${u.seq}')">글 삭제</a></td>
            </tr>
        </c:forEach>
    </table><br />
    <button type="button" onclick="location.href='add'">새 글 쓰기</button>
</main>
</body>
</html>