<body>
    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>
    <h2 id="welcomeMessage">Welcome, ${userId}</h2>
    <form action="/saveUser" method="post">
      <input type="number" id="id" name="id" value="${userId}" readonly><br>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${username}" readonly><br>
        
        <label for="password">Password:</label>
        <input type="text" id="password" name="password" value="${password}" ><br>

        <label hidden for="pass_status">Password status:</label>
        <input hidden type="number" id="pass_status" name="pass_status" value="1" required readonly><br>

        <button type="submit">Update Password</button>
    </form>
    <p>${error}</p>
</body>
