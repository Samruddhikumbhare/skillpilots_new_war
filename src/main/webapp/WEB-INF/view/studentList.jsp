<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.skillpilots.User" %>


<html>
<head>
    <title>Student List</title>
    <style>
        /* Add some basic styling for better presentation */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        form {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Student List</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Pass Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (User user : (List<User>) request.getAttribute("userList")) { %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getDepartment() %></td>
                    <td><%= user.getPass_status() %></td>
                    <td>
                        <form action="edit" method="post" style="display: inline;">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <button type="submit">Edit</button>
                        </form>
                        <form action="delete" method="post" style="display: inline;">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

    
</body>
</html>
