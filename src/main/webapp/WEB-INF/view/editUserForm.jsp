<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Edit User</title>
    <style>
        /* Add some basic styling for better presentation */
        form {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Edit User</h2>

    <form action="/saveUser" method="post">
        <label for="id">ID:</label>
        <input type="text" name="id" id="id" readonly value="${editUser.id}">

        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="${editUser.name}">

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" value="${editUser.department}">
        
       
        <input hidden type="text" name="password" id="password" value="${editUser.password}">

    
        <input hidden type="text" name="pass_status" id="pass_status" value="1">

        <button type="submit">Activate Student</button>
    </form>

</body>
</html>
