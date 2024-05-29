<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.hongjsp.Question" %>
<%@ page import="com.google.gson.Gson" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党建红色长廊知识竞答</title>
    <link rel="stylesheet" href="css/play.css">
</head>
<body>
<div class="container">
    <div class="red-block"><img src="images/pic1.jpeg" class="image active" alt="默认图片"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>

    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>

    <div class="red-block"></div>
    <div class="content">
        <div class="intro">
            <h1>党建红色长廊知识竞答</h1>
            <p>每次五题，按空格键开始答题......</p>
        </div>
        <div class="question-container">
            <div class="question"></div>
            <div class="options"></div>
        </div>
    </div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
</div>

<script>
    // 从后端传递的questions数组
    const questions = <%= new Gson().toJson(request.getAttribute("questions")) %>;

    // 打印出questions数组以检查其内容
    console.log("Loaded questions:", questions);
</script>
<script src="js/play.js"></script>
</body>
</html>
