package com.skillpilots.utility;

public class ProjectConstants {
	public static final String default_student="20"; //student
	public static final String iii_role0="0"; //student
	public static final String iii_role1="1"; //college
	public static final String hr="2"; // hr
	public static final String iii_role3deptIn="8"; // department incharge
	public static final String hod="7"; // department hod
	public static final String iii_role4manager="3"; //manager
	public static final String weekly_schedule_internship="W";
	public static final String company="1"; //company
	public static final String college="5"; //college
	public static final String internshipLead="4"; //internshipLead
	public static final String tpheadiiicell="6"; //t&p cell head
	public static final String comp_advertisements_status_active="A";
	public static final String student_reg_step_2_link="https://www.home.skillpilots.com/student_reg_step2"; //need to change page
	
	public static final String login_page_link="https://www.skillpilots.com/";
	public static final String download_excel_directory = "/dist/defaultExcel/";

	
	public static final String uploadDirectory = "/Skillpilot_new/newdemo/uploadedxls";


	//Email Constants
	public static final String mail_from="SkillPilots";
	public static final String mail_subject_first_login="Temporary Login Password";
	public static final String mail_subject_forgot_pass="Login Password reset";
	public static final String mail_footer = "<p style=\"text-align:center\"><strong><br>Thanks & Regards,<br style =\"color:#414ea4\">SkillPilots Team</strong></p>" +
			"<p style=\"text-align:justify;font-size:12px;\">Note:This is a system generated mail, please do not reply to it. This mailbox isn't being monitored.<br>" +
			"The information contained in this e-mail and/or attachments to it contain confidential or privileged information." +
			"If you are not the intended recipient, any dissemination, use, review, distribution, printing or copying of the" +
			" information contained in this e-mail message and/or attachments to it are strictly prohibited." +
			"If you have received this communication in error, please notify us at <strong>++91- 9422926439</strong>.</p>";
	
	public static final String mail_body_registration_completed="<h1 style=\"font-size:55px;margin:20px;text-align:center\">Congratulations!</h1>"
			+ "<p style=\"text-align:center\"> You have been registered successfully with <strong style =\"color:#414ea4\">SkillPilots</strong></a>.<br>"
			+ "Please wait while we verify the data provided by you from our side,<br>"
			+ "shortly after which you'll recieve the temporary password for your first login.<br></p>" + mail_footer;
	
	public static final String coll_dept_link_status_active="A";
	public static final String coll_dept_link_status_deactivate="D";
	public static final String coll_dept_link_status_deleted="C";


	
	public static final String reg_user_temp_pass_yes="Y";
	public static final String reg_user_temp_pass_no="N";
	public static final String student_req_approval_status_hod_approval = "2";
	public static  final String student_req_approval_status_team_assigned="S";
	public static final String student_req_approval_status_iii_approval="1";

	
	public static final String student_req_approval_status_rejected="R";
	public static final int req_expiration_after_five_days = 5;
	public static final int req_expiration_after_days=15;
	
	public static final int student_test_validity_days=5;
	public static final String student_req_approval_status_test_assigned="T";
	
	public static final String test_type_time_key ="time";
	public static final String test_type_cutoff_key ="cut_off";
	public static final String test_type_marks_per_ques_key ="mark_ques";
	public static final int total_no_of_ques_per_test=75;
	public static final String company_test_status_inactive="I";
	public static final String student_test_data_status_disqualified="D";
	public static final String student_test_data_status_cancelbyadmin="X";
	public static final char student_test_data_status_disqualified_char='D';
	public static final String student_req_approval_status_result_declared="D";
	
	public static final String company_test_type_for_test="T";
	public static final String company_test_type_for_section="S";
	public static final String company_test_type_for_question="Q";
	public static final String company_test_result_passed="Passed";
	public static final String company_test_result_failed="Failed";
	public static final String company_test_status_active="A";

	public static final String student_test_data_status_pending="P";
	public static final String student_test_data_status_passed="C";
	public static final String student_test_data_status_failed="F";
	
		public static final String request_cancelled_by_system="X";
	public static final String section_ques_type_multi_ans = "M";
	public static final String section_ques_type_single_ans = "S";
	public static final String section_ques_type_true_false = "T";
	public static final String assessment_test_status_active="A";
	public static final String assessment_test_status_inactive="D";
	
	public static final String coll_internal_req_approval_status_HOD=""+hod;
	public static final String coll_internal_req_approval_status_III=""+tpheadiiicell;
	public static final String coll_internal_req_approval_status_approved="A";
	public static final String coll_internal_req_approval_status_rejected="R";
	public static final String coll_internal_req_approval_status_cancelled="C";
	public static final String coll_internal_req_approval_status_dept_del="D";
//	public static final String comp_advertisements_status_active="A";
	public static final String comp_advertisements_status_deleted="D";
	public static final String comp_dept_link_status_active="A";
	public static final String comp_dept_link_status_deactivate="D";
	public static final String comp_dept_link_status_deleted="C";
	public static final String comp_internal_req_approval_status_manager=""+iii_role4manager;
	public static final String comp_internal_req_approval_status_internship_lead=""+internshipLead;
	public static final String comp_internal_req_approval_status_approved="A";
	public static final String comp_internal_req_approval_status_cancelled="C";
	public static final String comp_internal_req_approval_status_dept_del="D";
	public static final String external_req_approval_status_pending="P";
	public static final String external_req_approval_status_approved="A";
	public static final String external_req_approval_status_rejected="R";
	public static final String external_req_approval_status_cancelled="C";
	public static final String external_req_approval_status_assigned="S";
	public static final String external_req_approval_status_dept_del="D";
	public static final String external_req_approval_status_test_assigned="T";
	public static final String package_data_package_for_college="COL";
	public static final String package_data_package_for_company="COM";
	public static final String package_data_package_for_student="STU";
	public static final String progress_status_ongoing="O";
	public static final String progress_status_completed="C";
	
	public static final String comp_internal_req_id_initial="IR";
	//query 
	
	public static final String stud_req_conditions = " (approval_status IN ('pending', '"+ student_req_approval_status_test_assigned +
            "', '"+ student_req_approval_status_result_declared +
            "', '"+ student_req_approval_status_hod_approval +
            "', '"+ student_req_approval_status_iii_approval +
            "', 'Approved') OR approval_status = '"+ student_req_approval_status_rejected + "' )";
	
	public static final String check_stud_in_coll_int_req = " for_users LIKE :for_users"
			+ " AND (expiration_date>=:expiration_date OR expiration_date is null)"
			+ " AND approval_status in ('"+ coll_internal_req_approval_status_III
			+ "','"+ coll_internal_req_approval_status_HOD+"')";
	public static final String check_stud_in_ext_req = " student_ids LIKE :student_id"
			+ " AND (((expiration_date>=:expiration_date OR expiration_date is null)"
			+ " AND approval_status in ('"+ external_req_approval_status_pending
			+ "','" + external_req_approval_status_approved
			+ "','" + external_req_approval_status_test_assigned
			+ "')) OR (approval_status = '" + external_req_approval_status_rejected + "'))";
	
	//Login expired reason codes - Linked to expiration messages in MessageConstants by UserBeanUtil.GetExpRsnMessage() function
	public static final String reg_user_expiration_rsn_low_balance="LB";
	public static final String reg_user_expiration_rsn_dept_del="DD";
	public static final String reg_user_expiration_rsn_dept_changed="DC";
	public static final String reg_user_expiration_rsn_user_removed="UD";
	
	
	//time Constants
	public static final int cooling_period = 3;//Months

	//Student not present in any active coll_int_req
//	public static final String check_stud_in_coll_int_req = " for_users = :studentId"
//	        + " AND approval_status = ('"+ coll_internal_req_approval_status_III
//	        + "','"+ coll_internal_req_approval_status_HOD+"')";

	public static final String internships_status_pending="P";
	
	public static final String internships_status_completed = "Completed";
	public static final String internships_status_cancelled="X";
	public static final String COMPANY_TEST_STATUS_ACTIVE = "A";
	public static final String COMPANY_TEST_STATUS_INACTIVE = "I";
	public static final String SECRET_KEY = "8dM/12+3Df8z9hGFAzrfTf1rG6DHOz4yfYfPqEZ8N2Q=";
	public static final String SECRET_KEY_BASE64 = "ZSeYHqpH6AqkROfVH9RjF3kQPyYbXNVNbGz5MiHJ08w=";
}
