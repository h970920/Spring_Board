<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update.jsp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        form {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],input[type="password"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="button"] {
            width: calc(100% - 20px);
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="button"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<form action="/board/update" method="post" name="updateForm">
    <input type="hidden" name="id" value="${board.id}" readonly><br><br>
    <input type="text" name="boardWriter" value="${board.boardWriter}" readonly><br><br>
    <input type="password" name="boardPass" id="boardPass" placeholder="비밀번호"><br><br>
    <input type="text" name="boardTitle" value="${board.boardTitle}"><br><br>
    <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea><br><br>
    <input type="button" value="수정" onclick="updateReqFn()">
</form>
</body>
<script>
    const updateReqFn = () => {
        const passInput = document.getElementById("boardPass").value;
        const passDB = '${board.boardPass}';
        if (passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }
</script>
</html>
