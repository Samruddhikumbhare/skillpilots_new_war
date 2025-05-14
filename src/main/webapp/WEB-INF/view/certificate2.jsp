
<title>SkillPilots | Internship Certificate</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>

<link rel="icon" type="image/png" sizes="16x16" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">


<style>

body{
    color: #29375F;
}

    .ss {
      
        width: 55%;
        position: relative;
        left: 25%;
        top: 93px;
        height: 500px;
        background-image: url('${pageContext.request.contextPath}/images/certificate_skillpilot.png');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        text-align: center;
        padding: 20px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .heading {
        font-family: "Quattrocento", serif;
        font-size: 27px;
        margin-bottom: 20px;
        color: #333;
    }

    .head2 {
        font-family: "Quattrocento", serif;
        font-size: 20px;
        margin-bottom: 15px;
        color: #555;
    }

    .head3 {
        font-family: "Great Vibes", cursive;
        font-weight: 800;
        font-size: 35px;
        text-transform: capitalize;
        margin-bottom: 30px;
        color:  #283361;
    }

    .para {
        font-family: "Quattrocento", serif;
        font-size: 18px;
        color: #333;
        line-height: 1.6;
        margin-top: 20px;
        padding: 0 30px;
    }
    .head5{
        position: relative;
        left: -33%;
        top: 17%;
    }
    .sign{
        font-family: "Quattrocento", serif;
        position: relative;
        right: -37%;
        top: -12%;
        border-top: 1px solid black;
        display: inline-flex;
        border-width: 10%;
    }
    .badge{
        width: 15%;
        position: relative;
     top: -10%;
     left: -2%;
      
    }
    .logo{
        width: 100px;
        position: absolute;
        top: 10%;
  right: 12%;
    }
    .sig{
        width: 150px;
        position: absolute;
        right: 15%;
    }
</style>



<!-- /* -----------------------------for download pdf css ------------------------------------------ */ -->
 <style>
.ss2 {
      
    width: 100%;  /* Set to 100% width for full page coverage */
    height: 774px;  /* Allow height to auto adjust */
    /* left: 25%;
    top: 93px; */
    /* height: 500px; */
    padding-top: 42px;
    background-image: url('${pageContext.request.contextPath}/images/certificate_skillpilot.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    text-align: center;
    /* padding: 30px; */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
   
}

.heading2 {
    font-family: "Quattrocento", serif;
    font-size: 27px;
    margin-bottom: 20px;
    color: #333;
    margin-top: 10%;
}

.head22 {
    font-family: "Quattrocento", serif;
    font-size: 20px;
    margin-bottom: 15px;
    color: #555;
}

.head32 {
    font-family: "Great Vibes", cursive;
    font-weight: 800;
    font-size: 35px;
    text-transform: capitalize;
    margin-bottom: 30px;
    color:  #283361;
}

.para2 {
    font-family: "Quattrocento", serif;
    font-size: 23px;
    color: #333;
    line-height: 1.8;
    margin-top: 20px;
    padding: 0 30px;
}
.head52{
    position: relative;
    left: -33%;
    top: 120px;
}
.sign2{
    font-family: "Quattrocento", serif;
    position: relative;
    right: -37%;
    top: -7%;
    border-top: 1px solid black;
    display: inline-flex;
    border-width: 10%;
}
.badge2{
    width: 15%;
    position: relative;
 top: -7%;
 left: -2%;
  
}
.logo2{
    width: 100px;
    position: absolute;
    top: 14%;
right: 10%;
}
.sig2{
    width: 150px;
    position: absolute;
    right: 16%;
    bottom: 165px;
}
.refNo {
    position: absolute;
    right: 77%;
    top: 1%;
    color: #434C9E;
    font-size:22px
}

.certNo{
position: absolute;
    right: 85%;
    top: 13%;
    color: #434C9E;
}
.certificate{
 	display:none;
}

/* button------------------------- */

.download-btn {
    position: absolute;
        background: linear-gradient(45deg, #6a11cb, #2575fc); /* Gradient background */
        color: white; /* Text color */
        font-family: 'Quattrocento', serif; /* Font style */
        font-size: 18px; /* Font size */
        padding: 10px 20px; /* Padding for button */
        border: none; /* Remove border */
        border-radius: 50px; /* Rounded corners */
        cursor: pointer; /* Pointer cursor on hover */
        transition: all 0.3s ease; /* Smooth transition */
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Box shadow for depth */
    }

    .download-btn:hover {
        background: linear-gradient(45deg, #2575fc, #6a11cb); /* Reverse gradient on hover */
        transform: scale(1.05); /* Slightly increase size on hover */
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3); /* Enhance shadow on hover */
    }

    .download-btn:active {
        transform: scale(0.98); /* Slightly decrease size when clicked */
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2); /* Reduce shadow on click */
    }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Include html2pdf -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
<!-- Include jsPDF if needed -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>




<%
    String studentId = request.getParameter("studentId");
    String technology = request.getParameter("technology");
    String companyName = request.getParameter("companyName");
    String studentName = request.getParameter("studentName");
    String dateStarted = request.getParameter("dateStarted");
    String dateCompleted = request.getParameter("dateCompleted");

    String year = dateCompleted.substring(0, 4);
    // Trim the dateStarted string to remove the time part
    if (dateStarted != null && dateStarted.length() >= 10) {
        dateStarted = dateStarted.substring(0, 10);
    }
    if (dateCompleted != null && dateCompleted.length() >= 10) {
        dateCompleted = dateCompleted.substring(0, 10);
    }
%>

<center>
        
    <button   id="downloadBtn" class="download-btn">Download as PDF</button>
</center>

<div   class="ss">

    <h5 class=refNo>SP/  <%= studentId %>/<%=year %> </h5>
    <img class="logo" src="${pageContext.request.contextPath}/images/clue_final_1_10.png" alt="">
    <h4 class="heading">CERTIFICATE OF COMPLETION</h4>
    <h2 class="head2">THIS CERTIFICATE IS PRESENTED TO:</h2>
    <h3 class="head3"><%= studentName %></h3>
    <p class="para">
        Has successfully completed 8 weeks of 
        internship at <b> <%= companyName %></b>  in <br> <b>  <%= technology %>  </b>  From  <%= dateStarted %>   To <%= dateCompleted %>  With Rating <b style="color:#434C9E">A+</b> and has Managed to
        <br> Successfully Showcase Excellence in work ethic team leadership and team player skills,<br> promptness,  organization
        and attention to detail.
    </p>
    
    <h5 class="head5">Date :  <%= dateCompleted %></h5>



    <img class="sig" src="${pageContext.request.contextPath}/images/IMG_3901-removebg.png" alt="">

    <h5 class="sign">Signature</h5>

<img class="badge" src="${pageContext.request.contextPath}/images/certificate_badge.png" alt="">



</div>




<!-- -------------dowload certificate code ---------------- -->

<div  class ="certificate">
    
<div   class="ss2">
<div></div>
  <h5 class=certNo>SP/  <%= studentId %>/<%=year %> </h5>
    <img class="logo2" src="${pageContext.request.contextPath}/images/clue_final_1_10.png" alt="">
    <h4 class="heading2">CERTIFICATE OF COMPLETION</h4>
    <h2 class="head22">THIS CERTIFICATE IS PRESENTED TO:</h2>
    <h3 class="head32"><%= studentName %></h3>
    <p class="para2">
        Has successfully completed 4 weeks of 
        internship at <b> <%= companyName %></b>  in <br> <b>  <%= technology %>  </b>  From <b> <%= dateStarted %>   To <%= dateCompleted %> </b>  With Rating  <b style="color:#434C9E">A+</b> and has <br> Managed  to
         Successfully Showcase Excellence in work ethic team leadership and <br> team player skills, propmtness,  organization
        and atention to detail.
    </p>
    
    <h5 class="head52">Date :  <%= dateCompleted %></h5>



    <img class="sig2" src="${pageContext.request.contextPath}/images/IMG_3901-removebg.png" alt="">

    <h5 class="sign2">Signature</h5>

<img class="badge2" src="${pageContext.request.contextPath}/images/certificate_badge.png" alt="">

</div>


</div>
<script>
    document.getElementById('downloadBtn').addEventListener('click', function() {
        var element = document.querySelector('.ss2'); // Select the div containing the certificate content
        
        var opt = {
            margin:       0,  // No margins to cover the full page
            filename:     'certificate.pdf',
            image:        { type: 'jpeg', quality: 1.0 },
            html2canvas:  { scale: 4, useCORS: true },  // Use CORS if images are external
            jsPDF:        { unit: 'in', format: 'letter', orientation: 'landscape' }
        };

        // Generate the PDF
        html2pdf().from(element).set(opt).save().then(function() {
            // Call saveCertificate after PDF is saved
            saveCertificate();
        });
    });
    function saveCertificate() {
    // Get the full URL including query parameters
    const fullUrl = window.location.href;

    // Create an object to send as JSON
    const dataToSend = {
        url: fullUrl,
        studentId: new URLSearchParams(window.location.search).get('studentId')
    };

    $.ajax({
        url: `${pageContext.request.contextPath}/saveCertificate`,
        method: 'POST', // Use POST to send data in the request body
        contentType: 'application/json', // Send data as JSON
        data: JSON.stringify(dataToSend), // Convert the data object to a JSON string
        success: function(response) {
            alert(response);
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}


</script>