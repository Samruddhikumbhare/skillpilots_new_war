<%--
<div class="modal fade" id="tieup_terms_and_condition" role="dialog">
  <div class="modal-dialog" style="width: 80%">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="panel-heading">
        <button type="button" class="close" data-dismiss="modal">
          &times;
        </button>
        <h4 class="modal-title">Terms and Conditions</h4>
      </div>

      <div class="modal-body">
        <div style="text-align: center; font-size: 21px; font-weight: bold">
          <span
            >Before applying please read the following terms and
            conditions.</span
          >
        </div>
        <div class="box">
          <div class="box-body">
            <h4>The Tie-up agreement will be in following areas:</h4>
            <ol>
              <li>
                <b>Summer Internship / Final Placement Programs:</b> This Tie-up
                agreement provides opportunities to the students of this
                Institute to pursue internship programs at this Industry.
                Possibility of final placement can also be explored in the
                purview of this Tie-up agreement. The Industry will evaluate the
                candidates depending upon their requirement and shall offer -
                short/long internships before completion of degree program or
                placement after completion of degree program.
              </li>

              <li>
                <b>Site Visit:</b> This Tie-up agreement provides an opportunity
                to the students of the Institute for site visit. The industry
                will decide upon the number of students it will accommodate. The
                visit would be organized on mutually agreeable time and date.
              </li>

              <li>
                <b>Guest/Visiting Faculty:</b> The Institute can invite experts
                from the Industry to share their experience with students of the
                Institute. These lectures would be organized on a mutually
                agreeable time and date. It is expected that the Industry will
                depute the senior executives who are ready to share their
                experience with students of the Institute.
              </li>

              <li>
                <b>Technical Training Programs (TTP):</b> This Tie-up agreement
                also envisages a series of technical training programs (TTP) for
                the employees of the Industry. The said program could be
                organized for various divisions/sections of the Industry by the
                Institute on mutually agreed terms and conditions.
              </li>

              <li>
                <b>Confidentiality:</b> As part of this Tie-up agreement, either
                part will acquire or develop confidential and proprietary
                information concerning its dealings and methods of dealings.
                Both parties agree that such confidential matter is for the
                other parties exclusive benefits and that either party will not
                directly or indirectly use or disclose any confidential matter,
                except for specified purpose. The confidentiality obligations
                shall survive for two (2) years after termination of this Tie-up
                agreement. The obligations contend in this clause shall not
                apply to information in public domain or is received from a
                third party without restrictions or is developed independently.
              </li>
            </ol>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <input type="hidden" id="hidden_form_id" />
        <button type="button" class="btn btn-success" id="btn_agree">
          Agree
        </button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">
          Disagree
        </button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="tieup_terms_and_condition_pdf" role="dialog">
  <div class="modal-dialog" style="width: 600px">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="panel-heading">
        <button type="button" class="close" data-dismiss="modal">
          &times;
        </button>
        <h4 class="modal-title">Tie-Up Agreement</h4>
      </div>

      <div class="modal-body" style="overflow: auto; max-height: 500px">
        <div class="box">
          <img src="" alt="No Logo" id="requester_logo" />
          <img src="" alt="No Logo" id="approver_logo" />
          <div class="box-body" id="content" style="font-size: 12px">
            <header>
              <div style="padding-left: 200px">
                <img src="<c:url
                  value="${pageContext.request.contextPath}/dist/img/logo.png"
                />" style="max-width: 130px;"/>
              </div>
              <div
                style="
                  width: 500px;
                  text-align: center;
                  padding-top: 20px;
                  border-top: 2px solid gray;
                "
              >
                <span><b>Tie-Up Agreement</b></span>
              </div>
              <div style="width: 500px; text-align: center">
                <span>Between</span>
              </div>
              <div style="width: 500px; text-align: center">
                <b><span class="req_name"></span></b>
              </div>
              <div style="width: 500px; text-align: center">
                <span>and</span>
              </div>
              <div
                style="width: 500px; text-align: center; padding-bottom: 20px"
              >
                <b><span class="app_name"></span></b>
              </div>
            </header>

            <!-- <div style="width: 500px;text-align: center;"></div> -->
            <!-- <div style="width: 100%;">
							<div style="width: 25%;float: left;"><img src="" alt="No Logo" style="width: 50px; height: 60px;" id="requester_logo"></div>
							<div style="width: 50%;float: left;">
							<div style="text-align: center;"><span><b>Tie-Up Agreement</b></span></div>
							<div style="text-align: center;"><span>Between</span></div>
							<div style="text-align: center;"><span><b><span class="req_name"></span></b><span> and </span><b><span class="app_name"></span></b></span></div>
							</div>
							<div style="width: 25%;float: right;"><img src="" alt="No Logo" style="width: 50px; height: 60px;" id="approver_logo"/></div>
							</div> -->
            <div style="">
              <span
                >This Tie-up agreement is agreed on
                <b><span id="tieup_dt"></span></b> between
                <b><span class="req_name"></span></b> and
                <b><span class="app_name"></span></b> on the online portal -
                InternsOrbit. This Tie-up agreement shall commence from date of
                its signing and shall continue for period of one year thereof,
                unless either party terminates it from the portal. The two
                parties recognize that they share common interests in the field
                of Internship and Campus placements and hence agree to this
                Tie-up agreement. This Tie-up agreement will be based on
                non-commercial as well as commercial activities. The Tie-up
                agreement will be in following areas:
              </span>
            </div>

            <ol>
              <li style="font-weight: bold">
                Summer Internship / Final Placement Programs:
                <span style="font-weight: normal">
                  This Tie-up agreement provides opportunities to the students
                  of this Institute to pursue internship programs at this
                  Industry. Possibility of final placement can also be explored
                  in the purview of this Tie-up agreement. The Industry will
                  evaluate the candidates depending upon their requirement and
                  shall offer - short/long internships before completion of
                  degree program or placement after completion of degree
                  program.</span
                >
              </li>

              <li style="font-weight: bold">
                Site Visit:
                <span style="font-weight: normal"
                  >This Tie-up agreement provides an opportunity to the students
                  of the Institute for site visit. The industry will decide upon
                  the number of students it will accommodate. The visit would be
                  organized on mutually agreeable time and date.</span
                >
              </li>

              <li style="font-weight: bold">
                Guest/Visiting Faculty:
                <span style="font-weight: normal"
                  >The Institute can invite experts from the Industry to share
                  their experience with students of the Institute. These
                  lectures would be organized on a mutually agreeable time and
                  date. It is expected that the Industry will depute the senior
                  executives who are ready to share their experience with
                  students of the Institute.</span
                >
              </li>

              <li style="font-weight: bold">
                Technical Training Programs (TTP):
                <span style="font-weight: normal"
                  >This Tie-up agreement also envisages a series of technical
                  training programs (TTP) for the employees of the Industry. The
                  said program could be organized for various divisions/sections
                  of the Industry by the Institute on mutually agreed terms and
                  conditions.</span
                >
              </li>

              <li style="font-weight: bold">
                Confidentiality:
                <span style="font-weight: normal"
                  >As part of this Tie-up agreement, either part will acquire or
                  develop confidential and proprietary information concerning
                  its dealings and methods of dealings. Both parties agree that
                  such confidential matter is for the other parties exclusive
                  benefits and that either party will not directly or indirectly
                  use or disclose any confidential matter, except for specified
                  purpose. The confidentiality obligations shall survive for two
                  (2) years after termination of this Tie-up agreement. The
                  obligations contend in this clause shall not apply to
                  information in public domain or is received from a third party
                  without restrictions or is developed independently.</span
                >
              </li>
            </ol>
            <div>
              <span>
                Note: - This is a Tie-up agreement made after both the parties
                mutually agreed to Tie-up on the online portal InternsOrbit.
                This Tie-up agreement is not a legally binding contract and
                under no circumstances does this agreement subject either of the
                parties to liability for breach, whether material or minor of
                contract or any other liability under national applicable law.
              </span>
            </div>

            <footer>
              <div style="width: 500px; text-align: center">
                <span style="text-align: center; color: #a2a5a5"
                  >InternsOrbit India Pvt. Ltd.</span
                >
              </div>
              <div style="width: 500px; text-align: center">
                <span style="color: #a2a5a5"
                  >Address: Plot No.85,Swami Nagar Diwan Layout Manewada - Besa
                  Road Tata Chowk Nagpur - 440027</span
                >
              </div>
              <div
                style="width: 500px; text-align: center; padding-bottom: 20px"
              >
                <span style="color: #a2a5a5"
                  >www.InternsOrbit.com | info@internsorbit.com | Ph No: ++91-
                  9422926439</span
                >
              </div>
            </footer>
          </div>
        </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-success">
          <i class="fa fa-download"> Download</i>
        </button>
      </div>
    </div>
  </div>
</div>
--%>

<div
  class="modal fade bs-example-modal-xl show"
  id="tieup_terms_and_condition"
  tabindex="-1"
  role="dialog"
  aria-labelledby="myLargeModalLabel"
  aria-modal="true"
>
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div
        class="modal-header text-center"
        style="background: #0f2c7eeb; color: white; padding: 3px 0 3px 10px"
      >
        <h5 class="modal-title" id="myLargeModalLabel" style="color: white">
          Terms and Condition's
        </h5>
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-hidden="true"
        >
          X
        </button>
      </div>
      <div class="modal-body">
        <div style="text-align: center; font-size: 20px">
          <span
            style="
              background: #0f2c7eeb;
              color: white;
              border-radius: 16px;
              padding: 3px 17px 3px 20px;
            "
            >Before applying please read the following terms and
            conditions.</span
          >
        </div>
        <br />
        <div class="box">
          <div
            class="box-body"
            style="font: status-bar; font-size: 15px; line-height: 1.5rem"
          >
            <h5 class="text-center">
              The Tie-up agreement will be in following areas
            </h5>
            <br />
            <ol>
              <li>
                <b class="ttl">Summer Internship / Final Placement Programs</b>
                &nbsp;This Tie-up agreement provides opportunities to the
                students of this Institute to pursue internship programs at this
                Industry. Possibility of final placement can also be explored in
                the purview of this Tie-up agreement. The Industry will evaluate
                the candidates depending upon their requirement and shall offer
                - short/long internships before completion of degree program or
                placement after completion of degree program.
              </li>

              <li>
                <b class="ttl">Site Visit</b>&nbsp;This Tie-up agreement
                provides an opportunity to the students of the Institute for
                site visit. The industry will decide upon the number of students
                it will accommodate. The visit would be organized on mutually
                agreeable time and date.
              </li>

              <li>
                <b class="ttl">Guest/Visiting Faculty:</b>&nbsp;The Institute
                can invite experts from the Industry to share their experience
                with students of the Institute. These lectures would be
                organized on a mutually agreeable time and date. It is expected
                that the Industry will depute the senior executives who are
                ready to share their experience with students of the Institute.
              </li>

              <li>
                <b class="ttl">Technical Training Programs (TTP)</b>&nbsp; This
                Tie-up agreement also envisages a series of technical training
                programs (TTP) for the employees of the Industry. The said
                program could be organized for various divisions/sections of the
                Industry by the Institute on mutually agreed terms and
                conditions.
              </li>

              <li>
                <b class="ttl">Confidentiality</b>&nbsp;As part of this Tie-up
                agreement, either part will acquire or develop confidential and
                proprietary information concerning its dealings and methods of
                dealings. Both parties agree that such confidential matter is
                for the other parties exclusive benefits and that either party
                will not directly or indirectly use or disclose any confidential
                matter, except for specified purpose. The confidentiality
                obligations shall survive for two (2) years after termination of
                this Tie-up agreement. The obligations contend in this clause
                shall not apply to information in public domain or is received
                from a third party without restrictions or is developed
                independently.
              </li>
            </ol>
          </div>
        </div>
      </div>
      <div class="modal-footer" style="border-top: 0px">
        <form
          action="${pageContext.request.contextPath}/college_tieup_req"
          method="post"
        >
          <input type="hidden" value="${user.id}" name="company_id" />
          <input type="hidden" id="hidden_form_id" name="college_id" />
          <input type="hidden" id="collegeName" name="college_name" />
          <button type="submit" class="btn btn-success btn-sm" id="btn_agree">
            Agree
          </button>
          <button
            type="cancel"
            class="btn btn-danger btn-sm"
            data-dismiss="modal"
          >
            Disagree
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<div
  class="modal fade bs-example-modal-xl show"
  id="tieup_terms_and_condition2"
  tabindex="-1"
  role="dialog"
  aria-labelledby="myLargeModalLabel"
  aria-modal="true"
>
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div
        class="modal-header text-center"
        style="background: #0f2c7eeb; color: white; padding: 3px 0 3px 10px"
      >
        <h5 class="modal-title" id="myLargeModalLabel" style="color: white">
          Terms and Condition'ssss
        </h5>
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-hidden="true"
        >
          X
        </button>
      </div>
      <div class="modal-body">
        <div style="text-align: center; font-size: 20px">
          <span
            style="
              background: #0f2c7eeb;
              color: white;
              border-radius: 16px;
              padding: 3px 17px 3px 20px;
            "
            >Before applying please read the following terms and
            conditions.</span
          >
        </div>
        <br />
        <div class="box">
          <div
            class="box-body"
            style="font: status-bar; font-size: 15px; line-height: 1.5rem"
          >
            <h5 class="text-center">
              The Tie-up agreement will be in following areas
            </h5>
            <br />
            <ol>
              <li>
                <b class="ttl">Summer Internship / Final Placement Programs</b>
                &nbsp;This Tie-up agreement provides opportunities to the
                students of this Institute to pursue internship programs at this
                Industry. Possibility of final placement can also be explored in
                the purview of this Tie-up agreement. The Industry will evaluate
                the candidates depending upon their requirement and shall offer
                - short/long internships before completion of degree program or
                placement after completion of degree program.
              </li>

              <li>
                <b class="ttl">Site Visit</b>&nbsp;This Tie-up agreement
                provides an opportunity to the students of the Institute for
                site visit. The industry will decide upon the number of students
                it will accommodate. The visit would be organized on mutually
                agreeable time and date.
              </li>

              <li>
                <b class="ttl">Guest/Visiting Faculty:</b>&nbsp;The Institute
                can invite experts from the Industry to share their experience
                with students of the Institute. These lectures would be
                organized on a mutually agreeable time and date. It is expected
                that the Industry will depute the senior executives who are
                ready to share their experience with students of the Institute.
              </li>

              <li>
                <b class="ttl">Technical Training Programs (TTP)</b>&nbsp; This
                Tie-up agreement also envisages a series of technical training
                programs (TTP) for the employees of the Industry. The said
                program could be organized for various divisions/sections of the
                Industry by the Institute on mutually agreed terms and
                conditions.
              </li>

              <li>
                <b class="ttl">Confidentiality</b>&nbsp;As part of this Tie-up
                agreement, either part will acquire or develop confidential and
                proprietary information concerning its dealings and methods of
                dealings. Both parties agree that such confidential matter is
                for the other parties exclusive benefits and that either party
                will not directly or indirectly use or disclose any confidential
                matter, except for specified purpose. The confidentiality
                obligations shall survive for two (2) years after termination of
                this Tie-up agreement. The obligations contend in this clause
                shall not apply to information in public domain or is received
                from a third party without restrictions or is developed
                independently.
              </li>
            </ol>
          </div>
        </div>
      </div>
      <div class="modal-footer" style="border-top: 0px">
        <form
          action="${pageContext.request.contextPath}/comp_tieup_req"
          method="post"
        >
          <input type="hidden" id="CompanyId" name="company_id" />
          <input
            type="hidden"
            id="hidden_form_id"
            name="college_id"
            value="${user.id}"
          />
          <input type="hidden" id="CompanyName" name="company_name" />
          <button type="submit" class="btn btn-success btn-sm" id="btn_agree">
            Agree
          </button>
          <button
            type="cancel"
            class="btn btn-danger btn-sm"
            data-dismiss="modal"
          >
            Disagree
          </button>
        </form>
      </div>
    </div>
  </div>
</div>
