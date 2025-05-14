<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <title>SkillPilots | Assesment</title>
<!-- Import Google Icon Font -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Import materialize.css -->
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection"/>
    <!-- Ensure proper rendering and touch zooming -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Import materialize.css -->
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection"/>
    <!-- Ensure proper rendering and touch zooming -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        .content {
            max-width: 400px;
            padding: 20px;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content p {
            margin-bottom: 20px;
        }
        .content ul {
            margin-bottom: 20px;
            padding-left: 20px;
        }
        .content button {
            display: block;
            width: 100%;
            padding: 10px 0;
            border: none;
            border-radius: 3px;
            background-color: #4caf50;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .content button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <div class="content">
       <center> <h1 style="font-weight:600">Instruction</h1></center>
        <p>Please read the following carefully before starting the test:</p>
        <ul class="collection">
                            <li class="collection-item">
                                <i class="material-icons">check_circle</i> Make sure you are in a quiet environment.
                            </li>
                            <li class="collection-item">
                                <i class="material-icons">check_circle</i> Do not navigate away from the test page, as this will disqualify you.
                            </li>
                            <li class="collection-item">
                                <i class="material-icons">check_circle</i> Ensure you have a stable internet connection.
                            </li>
                            <!-- Add any other necessary instructions here -->
                        </ul>
        <form action="start" method="get">
            <input type="hidden" name="testId" value="${testId}">
            <button type="submit">I am ready to start the test</button>
        </form>
    </div>

    <!-- Import jQuery before materialize.js -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
