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

      form .gender-details .gender-title {
        font-size: 20px;
        font-weight: 500;
      }

      form .category {
        display: flex;
        width: 80%;
        margin: 14px 0;
        justify-content: space-between;
      }

      form .category label {
        display: flex;
        align-items: center;
        cursor: pointer;
      }

      form .category label .dot {
        height: 18px;
        width: 18px;
        border-radius: 50%;
        margin-right: 10px;
        background: #d9d9d9;
        border: 5px solid transparent;
        transition: all 0.3s ease;
      }

      #dot-1:checked ~ .category label .one,
      #dot-2:checked ~ .category label .two,
      #dot-3:checked ~ .category label .three {
        background: #9b59b6;
        border-color: #d9d9d9;
      }

      form input[type="radio"] {
        display: none;
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

        form .category {
          width: 100%;
        }

        .content form .user-details {
          max-height: 300px;
          overflow-y: scroll;
        }

        .user-details::-webkit-scrollbar {
          width: 5px;
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
      <!-- Title section -->
      <div class="title">Registration</div>
      <div class="content">
        <!-- Registration form -->
        <form id="registrationForm">
          <div class="user-details">
            <!-- Input for Full Name -->
            <div class="input-box">
              <span class="details">Full Name</span>
              <input
                type="text"
                placeholder="Enter your name"
                name="name"
                required
              />
            </div>
            <!-- Input for Email -->
            <div class="input-box">
              <span class="details">Email</span>
              <input
                type="email"
                placeholder="Enter your email"
                name="emailId"
                required
              />
            </div>
            <!-- Input for Phone Number -->
            <div class="input-box">
              <span class="details">Phone Number</span>
              <input
                type="text"
                placeholder="Enter your number"
                name="mobNo"
                required
              />
            </div>
            <!-- Input for Password -->
            <div class="input-box">
              <span class="details">Password</span>
              <input
                type="password"
                placeholder="Enter your password"
                name="password"
                required
              />
            </div>
            <!-- Input for Aggregate Percentage -->
            <div class="input-box">
              <span class="details">Aggregate %</span>
              <input
                type="text"
                placeholder="Enter your aggregate percentage"
                name="aggregate"
                required
              />
            </div>
            <div class="input-box">
              <span class="details">College Name</span>
              <input
                type="text"
                placeholder="Enter your college name"
                name="collegeName"
                required
              />
            </div>
            <div class="input-box">
              <span class="details">Branch</span>
              <input
                type="text"
                placeholder="Enter your branch"
                name="branch"
                required
              />
            </div>
          </div>
          <div class="gender-details">
            <span class="gender-title">Gender</span>
            <div class="category">
              <!-- Radio buttons for gender selection -->
              <input type="radio" name="gender" id="dot-1" value="Male" />
              <label for="dot-1">
                <span class="dot one"></span>
                <span class="gender">Male</span>
              </label>
              <input type="radio" name="gender" id="dot-2" value="Female" />
              <label for="dot-2">
                <span class="dot two"></span>
                <span class="gender">Female</span>
              </label>
              <input type="radio" name="gender" id="dot-3" value="Other" />
              <label for="dot-3">
                <span class="dot three"></span>
                <span class="gender">Prefer not to say</span>
              </label>
            </div>
          </div>
          <!-- Submit button -->
          <div class="button">
            <input
              type="submit"
              value="Register"
              style="margin-bottom: 1%"
            /><br />
            <center><a href="drive_login">Sign In</a></center>
          </div>
        </form>

        <script>
          document
            .getElementById("registrationForm")
            .addEventListener("submit", function (event) {
              event.preventDefault(); // Prevent the default form submission

              // Create an object to gather the form data
              const formData = {
                name: this.name.value,
                emailId: this.emailId.value,
                mobNo: this.mobNo.value,
                password: this.password.value,
                aggregate: this.aggregate.value,
                collegeName: this.collegeName.value,
                branch: this.branch.value,
                gender: this.gender.value, // Get the selected gender
              };

              // Send the data using fetch API
              fetch("http://43.204.35.211:8000/newskill/registerDrive", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json", // Set the content type to JSON
                },
                body: JSON.stringify(formData), // Convert the object to JSON
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
                  alert("registration sucessfull..");
                  window.location.href =
                    "${pageContext.request.contextPath}/drive_login";
                })
                .catch((error) => {
                  console.error("Error:", error); // Handle error
                  alert(
                    "There was an error with your submission. Please try again."
                  );
                });
            });
        </script>
      </div>
    </div>
  </body>
</html>
