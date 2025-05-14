<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Registration Form | CodingLab</title>

    <style>
      /* Importing Google Fonts - Poppins */
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
      }

      .container {
        max-width: 700px;
        width: 100%;
        background-color: #fff;
        padding: 25px 30px;
        border-radius: 5px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
      }

      .container .title {
        font-size: 25px;
        font-weight: 500;
        position: relative;
      }

      .container .title::before {
        content: "";
        position: absolute;
        left: 0;
        bottom: 0;
        height: 3px;
        width: 30px;
        border-radius: 5px;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
      }

      .content form .user-details {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin: 20px 0 12px 0;
      }

      form .user-details .input-box {
        margin-bottom: 15px;
        width: calc(100% / 2 - 20px);
      }

      form .input-box span.details {
        display: block;
        font-weight: 500;
        margin-bottom: 5px;
      }

      .user-details .input-box input {
        height: 45px;
        width: 100%;
        outline: none;
        font-size: 16px;
        border-radius: 5px;
        padding-left: 15px;
        border: 1px solid #ccc;
        border-bottom-width: 2px;
        transition: all 0.3s ease;
      }

      .user-details .input-box input:focus,
      .user-details .input-box input:valid {
        border-color: #9b59b6;
      }

      form .button {
        height: 45px;
        margin: 35px 0;
      }

      form .button input {
        height: 100%;
        width: 100%;
        border-radius: 5px;
        border: none;
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        letter-spacing: 1px;
        cursor: pointer;
        transition: all 0.3s ease;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
      }

      form .button input:hover {
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
      }

      /* Responsive media query code for mobile devices */
      @media (max-width: 584px) {
        .container {
          max-width: 100%;
        }

        form .user-details .input-box {
          margin-bottom: 15px;
          width: 100%;
        }

        .content form .user-details {
          max-height: 300px;
          overflow-y: scroll;
        }
      }

      /* Responsive media query code for mobile devices */
      @media (max-width: 459px) {
        .container .content .category {
          flex-direction: column;
        }
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="title">Login</div>
      <div class="content">
        <form id="loginForm">
          <div class="user-details">
            <div class="input-box">
              <span class="details">Email</span>
              <input
                type="text"
                id="email"
                placeholder="Enter your email"
                required
              />
            </div>
            <div class="input-box">
              <span class="details">Password</span>
              <input
                type="password"
                id="password"
                placeholder="Enter your password"
                required
              />
            </div>
          </div>
          <div class="button">
            <input type="submit" value="Login" />
            <br /><br />
            <center><a href="drive_registration">Registration</a></center>
          </div>
        </form>
      </div>
    </div>

    <script>
      document
        .getElementById("loginForm")
        .addEventListener("submit", function (event) {
          event.preventDefault(); // Prevent the default form submission

          // Get form values
          const email = document.getElementById("email").value;
          const password = document.getElementById("password").value;

          // Send the data using fetch API
          // fetch('http://localhost:8001/newskill/loginDrive', {
          fetch("http://43.204.35.211:8000/newskill/loginDrive", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded", // Specify content type
            },
            body: new URLSearchParams({
              email: email,
              password: password,
            }),
          })
            .then((response) => {
              if (!response.ok) {
                throw new Error("Network response was not ok");
              }
              return response.json(); // Parse JSON response
            })
            .then((data) => {
              console.log("Success:", data); // Handle success
              // Optionally, redirect or show a success message
              if (data.statusCode === 200) {
                localStorage.setItem("userData", JSON.stringify(data.userData));

                window.location.href = "/drive_disclamer";
              } else {
                alert(data.message);
              }
            })
            .catch((error) => {
              console.error("Error:", error); // Handle error
              alert("Cannot log in. Please contact Skillpilot.");
            });
        });
    </script>
  </body>
</html>
