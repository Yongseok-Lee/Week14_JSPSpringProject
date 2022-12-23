<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2022-12-02
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
  <title>새 글 쓰기</title>
  <link rel="stylesheet" href="https://unpkg.com/mvp.css@1.12/mvp.css">
</head>
<body>
<header>
  <h1>새 글 쓰기</h1>
</header>
<main>
  <form action="add_ok" method="POST" style="width: 600px; margin: 0 auto">
    <table id="edit">
      <tr>
        <td>카테고리</td><td><input type="text" name="category" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>제목</td><td><input type="text" name="title" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>글쓴이</td><td><input type="text" name="writer" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>내용</td><td><textarea cols="50" rows="5" name="content" style="width: 480px"></textarea></td>
      </tr>
    </table><br />
    <button type="submit">등록하기</button>
    <button type="button" onclick="location.href='list'">목록으로</button>
  </form>
</main>
</body>
</html>
