<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2022-12-02
  Time: 오후 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
  <title>글 수정</title>
  <link rel="stylesheet" href="https://unpkg.com/mvp.css@1.12/mvp.css">
</head>
<body>
<header>
  <h1>글 수정</h1>
</header>
<main>
  <form:form modelAttribute="boardVO" action="../edit_ok" method="POST" style="width: 600px; margin: 0 auto">
    <form:hidden path="seq" />
    <table id="edit">
      <tr>
        <td>카테고리</td><td><form:input path="category" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>제목</td><td><form:input path="title" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>글쓴이</td><td><form:input path="writer" style="width: 300px" /></td>
      </tr>
      <tr>
        <td>내용</td><td><form:textarea cols="50" rows="5" path="content" style="width: 480px"></form:textarea></td>
      </tr>
    </table><br />
    <input type="submit" value="수정하기" />
    <input type="button" value="취소하기" onclick="history.back()" />
  </form:form>
</main>>
</body>
</html>
