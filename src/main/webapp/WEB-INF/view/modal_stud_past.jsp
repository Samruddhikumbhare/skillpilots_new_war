<style>
    #other_college {
        margin-top: 10px; /* Example of styling */
    }
    .form-control {
        width: 100%; /* Adjust as needed */
    }
</style>

<div class="modal fade show" id="addMoreEdu" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="panel-heading" style="padding:5px 2px 5px 20px;background: #1b00ff;">
				<button type="button" class="close rembtn" data-dismiss="modal" onclick="reload()">&times;</button>
				<h6 class="modal-title" style="color: white;">Add Educational Qualification</h6>
			</div>
			<div class="form-group" style="padding-top:15px;text-align:center">
				<label>Select Category :- </label>
				<select id="degreeSelector" class="form-control degreeSelector" style="display:inline;width:150px" >
					<option disabled="disabled" selected="selected">--Select Category--</option>
					<option value="SSC">SSC</option>
					<option value="HSC">HSC</option>
					<c:if test="${category!=ProjectConstants.student_education_diploma}">
						<option value="${ProjectConstants.student_education_diploma}">DIPLOMA</option>
					</c:if>
					<c:if test="${category==ProjectConstants.student_education_pg||category==ProjectConstants.student_education_phd
						||category=='none'||category==null}">
						<option value="UG">UG</option>
					</c:if>
					<c:if test="${category==ProjectConstants.student_education_phd||category=='none'||category==null}">
						<option value="PG">PG</option>
					</c:if>
					<c:if test="${category=='none'||category==null}">
						<option value="PHD">PHD</option>
					</c:if>
				</select>
			</div>
			<div id="edu_div" style="display:none">
			<form id="edu_form" action="saveStudentPast" method="post">
				<input type="hidden" value="0" name="stud_past_id" id="edu_stud_past_id"/>
				<input type="hidden" value="${user_data.user_id}" name="student_id"/>
				<input type="hidden" name="category" id="edu_category" />
				<div class="row" style="margin-right: 0px;margin-left: 0px;">
					<div class="col-md-6">
						<div class="form-group">
							<label id="edu_organization_label">School Name</label>
							<div id="existing_organization">
								<select class="form-control" id="existing_colleges" onchange="showInputField(this.value);">
									<option selected value="" disabled>--Select an Institute--</option>
									<!-- JSTL forEach for colleges -->
									<c:forEach items="${colleges}" var="college">
										<option value="${college.college_id}">${college.college_name}</option>
									</c:forEach>
									<option value="" selected>Select an Institute</option>
									<option value="other">Other</option>
								</select>
								
								<!-- Hidden input field for "Other" option -->
								<input type="text" id="other_college" name="other_college" style="display:none;" placeholder="Enter institute name" />
								
							</div>
							<div id="organization_text" style="margin-top: 15px">
								<input type="text" name="organization" class="form-control" id="edu_organization" maxlength="100"/>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Year of Passing</label> <input type="number" name="end_date"
								class="form-control" id="edu_enddate" min="1900" max="${ProjectConstants.current_year}" required/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label id="edu_board_label">Board/University</label>
							<input type="text" name="board" class="form-control" id="edu_board" maxlength="80" required/>
						</div>
					</div>
					<div class="col-md-6" id="edu_department_div">
						<div class="form-group">
							<label>Stream/Degree</label>
							<select class="form-control mySelect" name="department" id="edu_departments">
								<option selected value="" disabled="disabled">--Select a Stream/Degree--</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Marks(%)</label> <input type="text" name="description"
								class="form-control" id="edu_description" pattern="[0-9]{1,2}([\.][0-9]{0,2})?" required/>
						</div>
					</div>
				</div>
				<div class="form-group" style="text-align: center;"><input type="submit" class="btn btn-primary" value="Save"/></div>
			</form>
			</div>
			<div id="edu_div2" style="display:none" action="saveStudentPast" method="post">
			<form id="edu_form1">
				<input type="hidden" value="0" name="stud_past_id" id="edu_stud_past_id1"/>
				<input type="hidden" value="${user.id}" name="student_id"/>
				<input type="hidden" name="category" id="edu_category1" />
				<div class="row" style="margin-right: 0px;margin-left: 0px;">
					<div class="col-md-6">
						<div class="form-group">
							<label id="edu_organization_label1">Schools	 Name</label>
							<div id="existing_organization1">
								<select class="form-control" id="existing_colleges1">
									<option selected value="" disabled="disabled">--Select a Institute--</option>
									<c:forEach items="${allColleges}" var="college">
										<option value="${college.college_id}">${college.college_name}</option>
										
									</c:forEach>
									
								</select>
							</div>
							<div id="organization_text1" style="margin-top: 15px">
								<input type="text" name="organization" class="form-control" id="edu_organization1" maxlength="100"/>
							</div>
						</div>
					</div>
					
					
					
					<div class="col-md-6">
						<div class="form-group">
							<label>Year of Passing</label> <input type="number" name="end_date"
								class="form-control" id="edu_enddate1" min="1900" max="${ProjectConstants.current_year}" required/>
						</div>
					</div>
					
					
					<div class="col-md-6">
						<div class="form-group">
							<label id="edu_board_label1">Board/University</label>
							<input type="text" name="board" class="form-control" id="edu_board1" maxlength="80" required/>
						</div>
					</div>
					<div class="col-md-6" id="edu_department_div">
						<div class="form-group">
							<label>Stream/Degree</label>
							<select class="form-control mySelect" name="departments" id="edu_departments1">
								
								<!-- 12 th -->

								<option value="arts">Arts</option>
								<option value="commerce">Cmmerce</option>
								<option value="commerce">Science</option>

<hr>
								<!-- Engineering -->
								<option value="computer-science-engineering">Computer Science and Engineering</option>
								<option value="information-technology">Information Technology</option>
								<option value="electronics-communication-engineering">Electronics and Communication Engineering</option>
								<option value="electrical-engineering">Electrical Engineering</option>
								<option value="mechanical-engineering">Mechanical Engineering</option>
								<option value="civil-engineering">Civil Engineering</option>
								<option value="chemical-engineering">Chemical Engineering</option>
								<option value="aerospace-engineering">Aerospace Engineering</option>
								<option value="biomedical-engineering">Biomedical Engineering</option>
								<option value="environmental-engineering">Environmental Engineering</option>
								<option value="biotechnology-engineering">Biotechnology Engineering</option>
								<option value="artificial-intelligence">Artificial Intelligence</option>
								<option value="data-science">Data Science</option>
								<option value="cybersecurity">Cybersecurity</option>
								<option value="robotics">Robotics</option>
								<option value="vlsi-design">VLSI Design</option>
							
								<!-- Arts -->
								<option value="english-literature">English Literature</option>
								<option value="history">History</option>
								<option value="political-science">Political Science</option>
								<option value="sociology">Sociology</option>
								<option value="psychology">Psychology</option>
								<option value="philosophy">Philosophy</option>
								<option value="economics">Economics</option>
								<option value="journalism-mass-communication">Journalism and Mass Communication</option>
								<option value="international-relations">International Relations</option>
								<option value="public-administration">Public Administration</option>
								<option value="social-work">Social Work</option>
								<option value="cultural-studies">Cultural Studies</option>
							
								<!-- Science -->
								<option value="physics">Physics</option>
								<option value="chemistry">Chemistry</option>
								<option value="mathematics">Mathematics</option>
								<option value="biology">Biology</option>
								<option value="computer-science">Computer Science</option>
								<option value="biotechnology">Biotechnology</option>
								<option value="environmental-science">Environmental Science</option>
								<option value="microbiology">Microbiology</option>
								<option value="zoology">Zoology</option>
								<option value="botany">Botany</option>
								<option value="applied-physics">Applied Physics</option>
								<option value="organic-chemistry">Organic Chemistry</option>
								<option value="bioinformatics">Bioinformatics</option>
							
								<!-- Commerce -->
								<option value="accounting-finance">Accounting and Finance</option>
								<option value="banking-insurance">Banking and Insurance</option>
								<option value="business-economics">Business Economics</option>
								<option value="marketing-management">Marketing Management</option>
								<option value="business-analytics">Business Analytics</option>
								<option value="corporate-governance">Corporate Governance</option>
								<option value="financial-management">Financial Management</option>
								<option value="international-business">International Business</option>
							
								<!-- Computer Applications -->
								<option value="bca-general">BCA - General</option>
								<option value="bca-data-science">BCA - Data Science</option>
								<option value="bca-artificial-intelligence">BCA - Artificial Intelligence</option>
								<option value="mca-general">MCA - General</option>
								<option value="mca-data-science">MCA - Data Science</option>
								<option value="mca-artificial-intelligence">MCA - Artificial Intelligence</option>
							
								<!-- Business Administration -->
								<option value="bba-general">BBA - General</option>
								<option value="bba-finance">BBA - Finance</option>
								<option value="bba-marketing">BBA - Marketing</option>
								<option value="bba-human-resource-management">BBA - Human Resource Management</option>
								<option value="mba-general">MBA - General</option>
								<option value="mba-finance">MBA - Finance</option>
								<option value="mba-marketing">MBA - Marketing</option>
								<option value="mba-human-resource-management">MBA - Human Resource Management</option>
								<option value="mba-operations-management">MBA - Operations Management</option>
								<option value="mba-information-technology">MBA - Information Technology</option>
							
								<!-- Education -->
								<option value="bed">B.Ed - Bachelor of Education</option>
								<option value="med">M.Ed - Master of Education</option>
							
								<!-- Law -->
								<option value="llb">LLB - Bachelor of Laws</option>
								<option value="llm">LLM - Master of Laws</option>
							
								<!-- Medicine -->
								<option value="mbbs">MBBS - Bachelor of Medicine and Bachelor of Surgery</option>
								<option value="bds">BDS - Bachelor of Dental Surgery</option>
								<option value="bams">BAMS - Bachelor of Ayurvedic Medicine and Surgery</option>
								<option value="bhms">BHMS - Bachelor of Homeopathic Medicine and Surgery</option>
								<option value="bpt">BPT - Bachelor of Physiotherapy</option>
								<option value="md-ms">MD/MS - Doctor of Medicine/Master of Surgery</option>
								<option value="mds">MDS - Master of Dental Surgery</option>
								<option value="mpt">MPT - Master of Physiotherapy</option>
							</select>
							
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Marks(%)</label> <input type="text" name="description"
								class="form-control" id="edu_description1" pattern="[0-9]{1,2}([\.][0-9]{0,2})?" required/>
						</div>
					</div>
				</div>
				<div class="form-group" style="text-align: center;"><input type="submit" class="btn btn-primary" value="Save"/></div>
			</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade show" id="addMoreProfession" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content modelfix">
			<div class="panel-heading" style="padding:5px 2px 5px 20px;background: #1b00ff;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h6 class="modal-title" style="color: white;">Add Professional Details</h6>
			</div>
			<div class="form-group" style="padding-top:15px;text-align:center">
				<label>Select Category :- </label>
				<select id="professionSelector" class="form-control" style="display:inline;width:150px">
					<option disabled="disabled" selected="selected">--Select Category--</option>
					<option value="P">Project</option>
					<option value="T">Training</option>
					<option value="W">Work Sample</option>
					<option value="I">Internship</option>
					<option value="J">Job</option>
				</select>
			</div>
			<div id="prof_div" style="display:none">
				<form id="prof_form">
					<input type="hidden" name="stud_past_id" id="prof_stud_past_id"/>
					<input type="hidden" value="${user_data.user_id}" name="student_id" />
					<input type="hidden" name="category" id="prof_category"/>
					<div class="row" style="margin-right: 0px;margin-left: 0px;">
						<div class="col-md-6" id="organization_div">
							<div class="form-group">
								<label id="organization_label">Company Name</label>
								<input type="text" id="prof_organization" name="organization" class="form-control" 
									required maxlength="100"/>
							</div>
						</div>
						<div class="col-md-6" id="profile_div">
							<div class="form-group">
								<label id="profile_label">Role</label>
								<input type="text" name="profile" id="prof_profile" maxlength="50"	class="form-control" required/>
							</div>
						</div>
						<div class="col-md-6" id="description_div">
							<div class="form-group">
								<label>Description</label> <input type="text" name="description" id="prof_description"
									class="form-control" required maxlength="1000"/>
							</div>
						</div>
						<div class="col-md-6" id="location_div">
							<div class="form-group">
								<label>Location</label> <input type="text" name="location" id="prof_location"
									class="form-control" required maxlength="100"/>
							</div>
						</div>
						<div class="col-md-6" id="department_div">
							<div class="form-group">
								<label>Skills</label> <input type="text" name="department" id="prof_department"
									class="form-control" required maxlength="80"/>
							</div>
						</div>
						<div class="col-md-6" id="link_div">
							<div class="form-group">
								<label>Link</label>
								<input type="text" name="link" id="prof_link" class="form-control" required maxlength="100"
									pattern="[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+){2,3}$" title="www.example.com"/>
							</div>
						</div>
					</div>
					<div class="row" style="margin-right: 0px;margin-left: 0px;">
						<div class="col-md-6">
							<div class="form-group" id="startdate_div">
								<label>Start Date</label> <input type="text" name="start_date" id="prof_start_date"
									class="form-control date-picker" readonly='true' pattern="dd/MM/yyyy" required/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group" id="enddate_div">
								<label>End Date</label> <input type="text" name="end_date" id="prof_end_date"
									class="form-control date-picker" readonly='true' required/>
							</div>
						</div>
					</div>
					<div class="form-group" style="text-align: center;"><input type="submit" class="btn btn-primary" value="Save"/></div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	function showInputField(value) {
		var inputField = document.getElementById('other_college');
		if(value == "other") { // Show input field
			inputField.style.display = 'block';
		} else { // Hide input field
			inputField.style.display = 'none';
		}
	}

	function reload() {
		location.reload();
		
		
	}
	</script>
	