<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="user_session.jsp" %>
      <%@ page import="java.util.Base64" %>
        <!DOCTYPE html>
        <html>

        <head>
          <!-- Basic Page Info -->
          <meta charset="utf-8">
          <title>SkillPilots | Student Dashboard</title>

          <!-- Site favicon -->
          <link rel="apple-touch-icon" sizes="180x180"
            href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
          <link rel="icon" type="image/png" sizes="16x16"
            href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

          <!-- Mobile Specific Metas -->
          <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

          <!-- Google Font -->
          <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet">
          <!-- CSS -->
          <link rel="stylesheet" type="text/css"
            href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
          <link rel="stylesheet" type="text/css"
            href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
          <link rel="stylesheet" type="text/css"
            href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css'>
          <link rel="stylesheet" type="text/css"
            href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css'>
          <link rel="stylesheet" type="text/css"
            href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>
          <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css"
            integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
          <!-- Global site tag (gtag.js) - Google Analytics -->
          <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
          <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
              dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-119386393-1');
          </script>
          <style type="text/css">
            .sidebar-menu .dropdown-toggle {
              padding: 15px 12px 15px 54px !important;
              font-size: 15px !important;
            }










            @import url("https://fonts.googleapis.com/css?family=Montserrat");




            .container {
              display: flex;
              max-width: 960px;
              background-color: #eaeaea;
              justify-content: space-between;
              margin: 20px auto;
              box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1)
            }

            .profile {
              flex-basis: 35%;
              background-color: #39383a;
              color: #ababab;
            }

            .profile-photo {
              height: 270px;
              background-image: url('data:image/jpeg;base64,${photoBase64}');
              background-size: cover;
              background-position: top;
              background-repeat: no-repeat;
            }

            .profile-info {
              padding-left: 30px;
              padding-right: 30px;
              padding-top: 50px;
              padding-bottom: 70px;
            }

            .profile-text {
              font-size: 13px;
              line-height: 24.19px;
              margin-bottom: 50px;
            }

            .heading {
              margin: 0;
              padding-bottom: 16px;
              text-transform: uppercase;
              font-weight: 700;
            }

            .heading-light {
              color: #ffffff;
              border-bottom: 2px #5a5a5a dashed;
            }

            .contacts {
              margin-bottom: 70px;
            }

            .contacts-title {
              color: #fff;
              margin-bottom: 13px;
              font-size: 16px;
              font-weight: 400;
            }

            .contacts-text {
              color: #ababab;
              text-decoration: none;
              padding-left: 27px;
              line-height: 20.97px;
            }

            .contacts-item {
              padding-top: 24px;
              padding-bottom: 24px;
              border-bottom: 2px #5a5a5a dashed;
            }

            address {
              font-style: normal;
            }

            .fas {
              margin-right: 7px;
            }

            .languages {
              display: flex;
              flex-wrap: wrap;
              padding-top: 40px;
            }

            .language {
              width: 100px;
              height: 100px;
              border: 6px solid #5c5c5c;
              border-radius: 50%;
              display: flex;
              justify-content: center;
              align-items: center;
              flex-direction: column;
              margin-bottom: 30px;
              margin-right: 30px;
            }

            .language:nth-child(3) {
              margin-bottom: 0;
            }

            .language-text {
              text-transform: uppercase;
              font-size: 11px
            }

            .languages-per {
              font-size: 15px;
              font-weight: 600;
            }

            .lines {
              display: flex;
              flex-direction: column;
              justify-content: center;
            }

            .line {
              display: block;
              width: 90px;
              height: 2px;
              background-color: #5c5c5c;
              margin-top: 10px;
              margin-bottom: 10px;
            }

            .line:nth-child(2) {
              width: 100px;
              margin-left: 20px;
            }

            .resume {
              padding: 25px 30px;
              flex-basis: 63%;
              background-color: #fff;
            }

            .resume-wrap {
              padding: 36px 56px;
              border: 1px solid rgba(168, 168, 168, 0.44);
              min-height: 100%;
            }

            .logo {
              display: flex;
              justify-content: center;
              margin-bottom: 38px;
            }

            .logo-img {
              width: 90px;
              height: 90px;
              border: 1px solid #39383a;
              border-radius: 50%;
              display: flex;
              justify-content: center;
              align-items: center;
            }

            .logo-lines {
              display: flex;
              align-items: center;
              justify-content: center;
              flex-direction: column;
              margin-left: 17px;
              margin-right: 17px;
            }

            .logo-line {
              width: 43px;
              height: 2px;
              background-color: #39383a;
              margin-top: 10px;
              margin-bottom: 10px;
            }

            .logo-lines_left .logo-line:nth-child(2) {
              margin-right: 20px;
              width: 55px;
            }

            .logo-lines_right .logo-line:nth-child(2) {
              margin-left: 20px;
              width: 55px;
            }

            .about {
              padding-bottom: 30px;
              border-bottom: 1px solid #e0e0e0;
              text-align: center;
              margin-bottom: 40px;
            }

            .name {
              font-size: 16px;
              text-transform: uppercase;
              letter-spacing: 10.75px;
              margin-bottom: 10px;
            }

            .position {
              display: inline-block;
              font-size: 9px;
              text-transform: uppercase;
              color: #808080;
              margin-bottom: 30px;
            }

            .about-address {
              font-size: 13px;
              margin-bottom: 15px;
              font-family: Roboto;
            }

            .about-contacts {
              font-size: 8px;
            }

            .about-contacts__link {
              text-decoration: none;
              color: #777777;
            }

            .heading_dark {
              font-size: 16px;
              font-weight: 400;
              border-bottom: 1px solid #e0e0e0;
              margin-bottom: 37px;
            }

            .list {
              list-style: none;
              padding-left: 0;
            }

            .list-item {
              position: relative;
              padding-left: 40px;
              padding-bottom: 30px;
              margin-bottom: 30px;
              border-bottom: 2px dashed #ececec;
            }

            .list-item:before {
              content: '';
              position: absolute;
              left: 0;
              top: 3px;
              width: 9px;
              height: 9px;
              border-radius: 50%;
              background-color: #000;
            }

            .list-item__title {
              font-size: 11px;
              text-transform: uppercase;
              margin-bottom: 5px;
            }

            .list-item__date {
              font-size: 10px;
              text-transform: uppercase;
            }

            .list-item__text {
              font-size: 10px;
              color: #777;
            }

            .list-item_non-border {
              border: none;
            }

            .heading_skills {
              margin-bottom: 48px;
            }

            .skills-list {
              list-style-type: none;
              padding-left: 0;
            }

            .skills-list__item {
              margin-bottom: 30px;
              text-transform: uppercase;
              font-size: 11px;
              display: flex;
              justify-content: space-between;
            }

            .level {
              width: 70%;
              height: 8px;
              border: 1px solid #39383a;
              position: relative;
            }

            .level:before {
              content: '';
              position: absolute;
              left: 0;
              top: 0;
              height: 100%;
              background-color: #898989;
            }

            .level-80:before {
              width: 80%;
            }

            .level-90:before {
              width: 90%;
            }

            .level-50:before {
              width: 50%;
            }

            @media (max-width: 1024px) {
              .container {
                width: 90%;
              }
            }

            @media (max-width: 992px) {
              .container {
                flex-direction: column;
                width: 70%;
              }

              .profile-photo {
                width: 200px;
                height: 200px;
                border: 3px solid #fff;
                margin: auto;
                margin-top: 40px;
              }

              .profile {
                position: relative;
              }

              .profile:before {
                content: '';
                width: 100%;
                height: 150px;
                background-color: #03A9F4;
                display: block;
                position: absolute;
              }

              .profile-photo {
                position: relative;
                z-index: 0;
              }

              .lines {
                display: none;
              }
            }

            @media (max-width: 768px) {
              .container {
                width: 80%;
              }

              .resume {
                padding: 10px;
              }

              .resume-wrap {
                padding-left: 20px;
                padding-right: 20px;
              }

              .list-item__title {
                font-size: 14px;
              }

              .list-item__date {
                font-size: 12px;
              }

              .list-item__text {
                font-size: 12px;
                line-height: 1.4;
              }

              .about-contacts__link {
                display: block;
                font-size: 13px;
              }
            }

            @media (max-width: 567px) {
              .logo-img {
                width: 70px;
                height: 70px;
              }

              .logo-lines {
                margin-left: 8px;
                margin-right: 8px;
              }
            }

            @media (max-width: 480px) {
              .logo {
                display: none;
              }

              .container {
                min-width: 320px;
              }

              .name {
                letter-spacing: normal;
              }

              .level {
                width: 50%;
              }

            }

            .experience {
              margin-bottom: 40px;
            }

            .experience .heading_dark {
              font-size: 18px;
              font-weight: 600;
              color: #39383a;
              border-bottom: 2px solid #39383a;
              margin-bottom: 20px;
            }

            .experience .list {
              list-style: none;
              padding-left: 0;
            }

            .experience .list-item {
              position: relative;
              padding-left: 20px;
              padding-bottom: 15px;
              margin-bottom: 15px;
              border-bottom: 1px solid #e0e0e0;
            }

            .experience .list-item:before {
              content: '';
              position: absolute;
              left: 0;
              top: 50%;
              transform: translateY(-50%);
              width: 8px;
              height: 8px;
              border-radius: 50%;
              background-color: #03A9F4;
              /* Accent color */
            }

            .experience .list-item__title {
              font-size: 14px;
              font-weight: 600;
              margin-bottom: 5px;
              color: #39383a;
            }

            .experience .list-item__date {
              font-size: 12px;
              color: #777;
            }

            .experience .list-item__text {
              font-size: 12px;
              color: #777;
            }

            .experience .list-item_non-border {
              border: none;
            }



            /****************************************************************************************************/



            .margin {
              width: 699px;
              margin: 0 auto;
            }

            /*قاعدة السيفي*/

            .cv-base {
              width: 800px;
              height: 1052px;
              margin: 45px auto;
              background-color: transparent;
              position: relative;
            }

            /*خلفية السيفي المائلة*/

            .cv-base .back {
              z-index: 1;
              width: 100%;
              height: 100%;
              transform: rotate(4deg);
              @extend boxshadow;
              background-color: backgroundcolorback;
              position: absolute;
              overflow: hidden;
              top: 0;
            }

            /*نهاية خلفية السيفي المائلة*/

            /****************************************************************************************************/

            /*واجهة السيفي*/

            .cv-base .front {
              z-index: 2;
              width: 100%;
              height: 100%;
              @extend %boxshadow;
              background-color: white;
              position: relative;
              overflow: hidden;
            }

            /*هيدر السيفي*/

            .cv-base .front header {
              width: 100%;
              height: 310px;
              padding-bottom: 5px;
              margin-bottom: 5px;
              background-color: transparent;
              position: relative;
              overflow: hidden;
            }

            /*الجزء العلوي و الذي يتضمن الخط المائل*/

            .cv-base .front header .head-top {
              width: 100%;
              height: 68px;
              z-index: 1;
              -webkit-transform: rotate(1deg);
              -moz-transform: rotate(1deg);
              -ms-transform: rotate(1deg);
              -o-transform: rotate(1deg);
              transform: rotate(1deg);
              background-color: backgroundcolortopright;
              position: absolute;
              overflow: hidden;
              top: -16px;
            }

            /*نهاية الجزء العلوي و الذي يتضمن الخط المائل*/

            /**********************************************************************/

            /*الجزء الايمن و الذي يتضمن المثلث المائل*/

            .cv-base .front header .head-right {
              width: 497px;
              height: 373px;
              z-index: 3;
              -webkit-transform: rotate(22deg);
              -moz-transform: rotate(22deg);
              -ms-transform: rotate(22deg);
              -o-transform: rotate(22deg);
              transform: rotate(22deg);
              -webkit-box-shadow: 0 1px 12px -4px #292929;
              -moz-box-shadow: 0 1px 12px -4px #292929;
              box-shadow: 0 1px 12px -4px #292929;
              background-color: backgroundcolorleftright;
              position: absolute;
              overflow: hidden;
              top: -288px;
              right: -98px;
            }

            /*نهاية الجزء الايمن و الذي يتضمن المثلث المائل*/

            /**********************************************************************/

            /*الجزء السفلي و الذي يتضمن الصور و الاسم و التخصص*/

            .cv-base .front header .head-bottom {
              z-index: 2;
              width: 100%;
              height: 254px;
              padding: 13px 0 0 0;
              background-color: transparent;
              position: absolute;
              overflow: hidden;
              top: 55px;
            }

            /*الجزء الايسر و الذي يتضمن الصورة الشخصية*/

            .cv-base .front header .head-bottom .image-left {
              float: left;
              width: 220px;
              height: 220px;
              margin-right: 44px;
              -webkit-border-radius: 50%;
              -moz-border-radius: 50%;
              border-radius: 50%;
              background-color: #292929;
              background-image: url('data:image/jpeg;base64,${photoBase64}');
              background-repeat: no-repeat;
              -webkit-background-size: cover;
              -moz-background-size: cover;
              background-size: cover;
              overflow: hidden;
            }

            /*نهاية الجزء الايسر و الذي يتضمن الصورة الشخصية*/

            /**************************************************/

            /*الجزء الايمن و الذي يتضمن الاسم و التخصص*/

            .cv-base .front header .head-bottom .words-right {
              float: left;
              height: 201px;
              padding: 66px 0 0 0;
              background-color: transparent;
            }

            .cv-base .front header .head-bottom .words-right h3 {
              padding: 12px 40px 9px 46px;
              margin: 0 0 0 0;
              position: relative;
              border-radius: 100px;
              display: inline-block;
              background-color: backgroundcolorname;
              text-transform: uppercase;
              letter-spacing: 1px;
              text-align: center;
              font-family: allfontcv;
              font-weight: 600;
              font-size: 25px;
              color: colorname;
            }

            .cv-base .front header .head-bottom .words-right p {
              padding: 7px 0 0 3px;
              margin: 0;
              text-transform: capitalize;
              text-align: center;
              font-family: allfontcv;
              font-size: 19px;
              color: colormyjob;
            }

            .cv-base .front header .head-bottom .words-right h3:before {
              content: "";
              width: 50px;
              height: 17px;
              @extend %borderradius;
              background-color: #292929;
              position: absolute;
              bottom: -16px;
              right: 0;
            }

            .cv-base .front header .head-bottom .words-right h3:after {
              content: "";
              width: 23px;
              height: 17px;
              @extend %borderradius;
              background-color: #292929;
              position: absolute;
              bottom: -16px;
              right: -27px;
            }

            /*نهاية الجزء الايمن و الذي يتضمن الاسم و التخصص*/

            /**************************************************/

            /*الخطوط الموجودة فوق الصورة الشخصية*/

            .cv-base .front header .head-bottom .aesthetic01:before {
              content: "";
              width: 54px;
              height: 17px;
              @extend %borderradius;
              background-color: backgroundcoloraesthetic;
              position: absolute;
              top: 54px;
              left: 52px;
            }

            .cv-base .front header .head-bottom .aesthetic01:after {
              content: "";
              width: 54px;
              height: 17px;
              @extend %borderradius;
              background-color: backgroundcoloraesthetic;
              position: absolute;
              top: 70px;
              left: 29px;
            }

            .cv-base .front header .head-bottom .aesthetic02:before {
              content: "";
              width: 51px;
              height: 17px;
              @extend %borderradius;
              background-color: backgroundcoloraesthetic;
              position: absolute;
              top: 140px;
              left: 269px;
            }

            .cv-base .front header .head-bottom .aesthetic02:after {
              content: "";
              width: 26px;
              height: 17px;
              @extend %borderradius;
              background-color: backgroundcoloraesthetic;
              position: absolute;
              top: 140px;
              left: 237px;
            }

            .cv-base .front header .head-bottom .aesthetic03:before {
              content: "";
              width: 84px;
              height: 21px;
              @extend %borderradius;
              background-color: backgroundcoloraesthetic;
              position: absolute;
              top: 181px;
              left: 222px;
            }

            /*نهاية الخطوط الموجودة فوق الصورة الشخصية*/

            /*نهاية الجزء السفلي و الذي يتضمن الصور و الاسم و التخصص*/

            /*نهاية هيدر السيفي*/

            /********************************************************************************/

            /*محتوى السيلفي*/

            .cv-base section {
              width: 100%;
              height: 530.7px;
              background-color: transparent;
              overflow: hidden;
            }

            /*الجانب الايسر و الذي يتضمن نبذة و تجارب التعليم*/

            .cv-base section aside {
              float: left;
              width: 242px;
              height: 521.7px;
              margin-right: 20px;
              background-color: transparent;
              border-right: 1px solid #d8d8d8;
              overflow: hidden;
            }

            /*اختصارات لـ تنسيقات متكررة*/

            /*تنسيقات قاعدة الاقسام*/

            .cv-base section aside .aside-parts {
              width: 100%;
              padding-right: 10px;
              margin-bottom: 10px;
              background-color: transparent;
              overflow: hidden;
            }

            /*نهاية تنسيقات قاعدة الاقسام*/

            /*********************************/

            /*تنسيقات عناوين الاقسام*/

            .cv-base section aside .aside-parts h3 {
              padding: 0 0 8px 0;
              margin: 0;
              text-align: center;
              text-transform: uppercase;
              font-family: allfontcv;
              font-weight: 600;
              font-size: 20px;
              color: colortitles;
            }

            /*نهاية تنسيقات عناوين الاقسام*/

            /*تنسيقات قاعدة القوائم*/

            .cv-base section aside .aside-parts ul {
              width: 100%;
              padding: 0;
              margin: 0;
              list-style-type: none;
              overflow: hidden;
            }

            /*نهاية تنسيقات قاعدة القوائم*/

            /*********************************/

            /*تنسيقات مشتركة للقوائم*/

            .cv-base section aside .aside-parts ul li {
              width: 100%;
              margin-bottom: 10px;
              overflow: hidden;
            }

            .cv-base section aside .aside-parts ul li h3 {
              color: colordate;
            }

            .cv-base section aside .aside-parts ul li p {
              padding: 0;
              margin: 0;
              font-family: allfontcv;
              color: colortexts;
            }

            /*نهاية تنسيقات مشتركة للقوائم*/

            /*نهاية اختصارات لـ تنسيقات متكررة*/

            /**************************************************/

            /*القسم الاول = نبذة عن نفسي*/

            .cv-base section aside #aside01 ul {
              height: 124px;
            }

            .cv-base section aside #aside01 ul li p {
              line-height: 19px;
              font-size: 12px;
            }

            /*نهاية القسم الاول = نبذة عن نفسي*/

            /**************************************************/

            /*القسم الثاني = تجارب التعليم*/

            .cv-base section aside #aside02 {
              margin-bottom: 0;
            }

            .cv-base section aside #aside02 ul {
              height: 326.7px;
              padding-right: 8px;
            }

            .cv-base section aside #aside02 ul li h3 {
              padding: 0 0 3px 0;
              text-align: left;
              font-size: 15px;
            }

            .cv-base section aside #aside02 ul li p:first-of-type {
              padding: 0 0 3px 0;
              font-size: 13px;
            }

            .cv-base section aside #aside02 ul li p:last-of-type {
              line-height: 19px;
              font-size: 12px;
            }

            /*التحكم بـ ظهور و اختفاء تجارب التعليم الـ 30*/

            .cv-base section aside #aside02 ul #education01 {
              display: education01;
            }

            .cv-base section aside #aside02 ul #education02 {
              display: education02;
            }

            .cv-base section aside #aside02 ul #education03 {
              display: education03;
            }

            .cv-base section aside #aside02 ul #education04 {
              display: education04;
            }

            .cv-base section aside #aside02 ul #education05 {
              display: education05;
            }

            .cv-base section aside #aside02 ul #education06 {
              display: education06;
            }

            .cv-base section aside #aside02 ul #education07 {
              display: education07;
            }

            .cv-base section aside #aside02 ul #education08 {
              display: education08;
            }

            .cv-base section aside #aside02 ul #education09 {
              display: education09;
            }

            .cv-base section aside #aside02 ul #education10 {
              display: education10;
            }

            .cv-base section aside #aside02 ul #education11 {
              display: education11;
            }

            .cv-base section aside #aside02 ul #education12 {
              display: education12;
            }

            .cv-base section aside #aside02 ul #education13 {
              display: education13;
            }

            .cv-base section aside #aside02 ul #education14 {
              display: education14;
            }

            .cv-base section aside #aside02 ul #education15 {
              display: education15;
            }

            .cv-base section aside #aside02 ul #education16 {
              display: education16;
            }

            .cv-base section aside #aside02 ul #education17 {
              display: education17;
            }

            .cv-base section aside #aside02 ul #education18 {
              display: education18;
            }

            .cv-base section aside #aside02 ul #education19 {
              display: education19;
            }

            .cv-base section aside #aside02 ul #education20 {
              display: education20;
            }

            .cv-base section aside #aside02 ul #education21 {
              display: education21;
            }

            .cv-base section aside #aside02 ul #education22 {
              display: education22;
            }

            .cv-base section aside #aside02 ul #education23 {
              display: education23;
            }

            .cv-base section aside #aside02 ul #education24 {
              display: education24;
            }

            .cv-base section aside #aside02 ul #education25 {
              display: education25;
            }

            .cv-base section aside #aside02 ul #education26 {
              display: education26;
            }

            .cv-base section aside #aside02 ul #education27 {
              display: education27;
            }

            .cv-base section aside #aside02 ul #education28 {
              display: education28;
            }

            .cv-base section aside #aside02 ul #education29 {
              display: education29;
            }

            .cv-base section aside #aside02 ul #education30 {
              display: education30;
            }

            .cv-base section aside #aside02 ul #education31 {
              display: education31;
            }

            .cv-base section aside #aside02 ul #education32 {
              display: education32;
            }

            .cv-base section aside #aside02 ul #education33 {
              display: education33;
            }

            /*نهاية التحكم بـ ظهور و اختفاء تجارب التعليم الـ 30*/

            /*نهاية القسم الثاني = تجارب التعليم*/

            /*نهاية الجانب الايسر و الذي يتضمن نبذة و تجارب التعليم*/

            /**********************************************************************/

            /*الجانب الايمن و الذي يتضمن المهارات و تجارب العمل*/

            .cv-base section article {
              float: right;
              width: 435px;
              height: 521.7px;
              background-color: transparent;
              overflow: hidden;
            }

            /*اختصارات لـ تنسيقات متكررة*/

            /*تنسيقات قاعدة الاقسام*/

            .cv-base section article .article-parts {
              width: 100%;
              margin-bottom: 18px;
              background-color: transparent;
              overflow: hidden;
            }

            /*نهاية تنسيقات قاعدة الاقسام*/

            /*********************************/

            /*تنسيقات عناوين الاقسام*/

            .cv-base section article .article-parts h3 {
              padding: 0 0 10px 0;
              margin: 0;
              text-align: center;
              text-transform: uppercase;
              font-family: allfontcv;
              font-weight: 600;
              font-size: 20px;
              color: colortitles;
            }

            /*نهاية تنسيقات عناوين الاقسام*/

            /*********************************/

            /*تنسيقات قاعدة القوائم*/

            .cv-base section article .article-parts ul {
              padding: 0;
              margin: 0;
              list-style-type: none;
            }

            /*نهاية تنسيقات قاعدة القوائم*/

            /*نهاية اختصارات لـ تنسيقات متكررة*/

            /**************************************************/

            /*القسم الاول = المهارات*/

            /*قاعدة المهارات*/

            .cv-base section article #article01 .groups {
              width: 100%;
              height: 74px;
              padding-right: 10px;
              overflow: hidden;
            }

            /*تنسيقات الخطوط التي تحتوي على المهارات*/

            .cv-base section article #article01 .groups .lines {
              width: 100%;
              margin-bottom: 15px;
              background-color: transparent;
              overflow: hidden;
            }

            .cv-base section article #article01 .groups .lines:last-child {
              margin-bottom: 0;
            }

            .cv-base section article #article01 .groups .lines ul li {
              float: left;
              width: 135px;
              margin-right: 10px;
              background-color: transparent;
              overflow: hidden;
            }

            .cv-base section article #article01 .groups .lines ul li:last-child {
              margin-right: 0;
            }

            /*تنسيقات الايقونات*/

            .cv-base section article #article01 .groups .lines ul li .icons {
              float: left;
              width: 18px;
              padding-right: 0;
              overflow: hidden;
            }

            .cv-base section article #article01 .groups .lines ul li .icons i {
              font-size: 14px;
              color: coloricons;
            }

            /*نهاية تنسيقات الايقونات*/

            /*********************************/

            /*تنسيقات المهارات*/

            .cv-base section article #article01 .groups .lines ul li .words {
              float: right;
              width: 108px;
              padding-top: 3px;
              overflow: hidden;
            }

            .cv-base section article #article01 .groups .lines ul li .words p {
              padding: 0;
              margin: 0;
              text-transform: uppercase;
              font-family: allfontcv;
              font-size: 13px;
              color: colortexts;
            }

            /*نهاية تنسيقات المهارات*/

            /*نهاية تنسيقات الخطوط التي تحتوي على المهارات*/

            /*********************************/

            /*التحكم بـ ظهور و اختفاء خطوط المهارات الـ 6*/

            .cv-base section article #article01 .groups #line01 {
              display: ine01;
            }

            .cv-base section article #article01 .groups #line02 {
              display: ine02;
            }

            .cv-base section article #article01 .groups #line03 {
              display: ine03;
            }

            .cv-base section article #article01 .groups #line04 {
              display: ine04;
            }

            .cv-base section article #article01 .groups #line05 {
              display: ine05;
            }

            .cv-base section article #article01 .groups #line06 {
              display: ine06;
            }

            /*نهاية التحكم بـ ظهور و اختفاء خطوط المهارات الـ 6*/

            /*********************************/

            /*التحكم بـ ظهور و اختفاء عناصر كل خط*/

            /*Line01*/

            .cv-base section article #article01 .groups #line01 ul li:first-child {
              display: line01-skill01;
            }

            .cv-base section article #article01 .groups #line01 ul li:nth-child(2) {
              display: line01-skill02;
            }

            .cv-base section article #article01 .groups #line01 ul li:last-child {
              display: line01-skill03;
            }

            /*End Line01*/

            /********************/

            /*Line02*/

            .cv-base section article #article01 .groups #line02 ul li:first-child {
              display: line02-skill01;
            }

            .cv-base section article #article01 .groups #line02 ul li:nth-child(2) {
              display: line02-skill02;
            }

            .cv-base section article #article01 .groups #line02 ul li:last-child {
              display: line02-skill03;
            }

            /*End Line02*/

            /********************/

            /*Line03*/

            .cv-base section article #article01 .groups #line03 ul li:first-child {
              display: line03-skill01;
            }

            .cv-base section article #article01 .groups #line03 ul li:nth-child(2) {
              display: line03-skill02;
            }

            .cv-base section article #article01 .groups #line03 ul li:last-child {
              display: line03-skill03;
            }

            /*End Line03*/

            /********************/

            /*Line04*/

            .cv-base section article #article01 .groups #line04 ul li:first-child {
              display: line04-skill01;
            }

            .cv-base section article #article01 .groups #line04 ul li:nth-child(2) {
              display: line04-skill02;
            }

            .cv-base section article #article01 .groups #line04 ul li:last-child {
              display: line04-skill03;
            }

            /*End Line04*/

            /********************/

            /*Line05*/

            .cv-base section article #article01 .groups #line05 ul li:first-child {
              display: line05-skill01;
            }

            .cv-base section article #article01 .groups #line05 ul li:nth-child(2) {
              display: line05-skill02;
            }

            .cv-base section article #article01 .groups #line05 ul li:last-child {
              display: line05-skill03;
            }

            /*End Line05*/

            /********************/

            /*Line06*/

            .cv-base section article #article01 .groups #line06 ul li:first-child {
              display: line06-skill01;
            }

            .cv-base section article #article01 .groups #line06 ul li:nth-child(2) {
              display: line06-skill02;
            }

            .cv-base section article #article01 .groups #line06 ul li:last-child {
              display: line06-skill03;
            }

            /*End Line06*/

            /*نهاية التحكم بـ ظهور و اختفاء عناصر كل خط*/

            /*نهاية القسم الاول = المهارات*/

            /**************************************************/

            /*القسم الثاني = تجارب العمل*/

            .cv-base section article #article02 {
              margin-bottom: 0;
            }

            .cv-base section article #article02 ul {
              height: 367px;
              padding-right: 10px;
              overflow: hidden;
            }

            .cv-base section article #article02 ul li {
              width: 100%;
              margin-bottom: 10px;
              overflow: hidden;
            }

            .cv-base section article #article02 ul li h3 {
              padding: 0 0 3px 0;
              text-align: left;
              font-size: 15px;
              color: colordate;
            }

            .cv-base section article #article02 ul li p:first-of-type {
              padding: 0 0 3px 0;
              margin: 0 0 0 0;
              font-family: allfontcv;
              font-size: 13px;
              color: colortexts
            }

            .cv-base section article #article02 ul li p:last-of-type {
              padding: 0;
              margin: 0;
              font-family: allfontcv;
              line-height: 19px;
              font-size: 12px;
              color: colortexts
            }

            /*********************************/

            /*التحكم بـ اظهار و اخفاء تجارب العمل الـ 30*/

            .cv-base section article #article02 ul #experience01 {
              display: experience01;
            }

            .cv-base section article #article02 ul #experience02 {
              display: experience02;
            }

            .cv-base section article #article02 ul #experience03 {
              display: experience03;
            }

            .cv-base section article #article02 ul #experience04 {
              display: experience04;
            }

            .cv-base section article #article02 ul #experience05 {
              display: experience05;
            }

            .cv-base section article #article02 ul #experience06 {
              display: experience06;
            }

            .cv-base section article #article02 ul #experience07 {
              display: experience07;
            }

            .cv-base section article #article02 ul #experience08 {
              display: experience08;
            }

            .cv-base section article #article02 ul #experience09 {
              display: experience09;
            }

            .cv-base section article #article02 ul #experience10 {
              display: experience10;
            }

            .cv-base section article #article02 ul #experience11 {
              display: experience11;
            }

            .cv-base section article #article02 ul #experience12 {
              display: experience12;
            }

            .cv-base section article #article02 ul #experience13 {
              display: experience13;
            }

            .cv-base section article #article02 ul #experience14 {
              display: experience14;
            }

            .cv-base section article #article02 ul #experience15 {
              display: experience15;
            }

            .cv-base section article #article02 ul #experience16 {
              display: experience16;
            }

            .cv-base section article #article02 ul #experience17 {
              display: experience17;
            }

            .cv-base section article #article02 ul #experience18 {
              display: experience18;
            }

            .cv-base section article #article02 ul #experience19 {
              display: experience19;
            }

            .cv-base section article #article02 ul #experience20 {
              display: experience20;
            }

            .cv-base section article #article02 ul #experience21 {
              display: experience21;
            }

            .cv-base section article #article02 ul #experience22 {
              display: experience22;
            }

            .cv-base section article #article02 ul #experience23 {
              display: experience23;
            }

            .cv-base section article #article02 ul #experience24 {
              display: experience24;
            }

            .cv-base section article #article02 ul #experience25 {
              display: experience25;
            }

            .cv-base section article #article02 ul #experience26 {
              display: experience26;
            }

            .cv-base section article #article02 ul #experience27 {
              display: experience27;
            }

            .cv-base section article #article02 ul #experience28 {
              display: experience28;
            }

            .cv-base section article #article02 ul #experience29 {
              display: experience29;
            }

            .cv-base section article #article02 ul #experience30 {
              display: experience30;
            }

            .cv-base section article #article02 ul #experience31 {
              display: experience31;
            }

            .cv-base section article #article02 ul #experience32 {
              display: experience32;
            }

            .cv-base section article #article02 ul #experience33 {
              display: experience33;
            }

            /*نهاية التحكم بـ اظهار و اخفاء تجارب العمل الـ 30*/

            /*نهاية القسم الثاني = تجارب العمل*/

            /*نهاية الجانب الايمن و الذي يتضمن المهارات و تجارب العمل*/

            /*نهاية محتوى السيلفي*/

            /********************************************************************************/

            .cv-base .loop {
              width: 100%;
              height: 212px;
              z-index: 1;
              -webkit-transform: rotate(-16deg);
              -moz-transform: rotate(-16deg);
              -ms-transform: rotate(-16deg);
              -o-transform: rotate(-16deg);
              transform: rotate(-16deg);
              background-color: backgroundcolortopright;
              position: absolute;
              bottom: -106px;
              left: 55px;
            }

            /********************************************************************************/

            /*فوتر السيلفي*/

            .cv-base .front footer {
              width: 100%;
              height: 207px;
              background-color: transparent;
              position: relative;
              overflow: hidden;
              z-index: 2;
            }

            .cv-base .front footer .foot-back {
              width: 86%;
              height: 222px;
              z-index: 1;
              -webkit-transform: rotate(7deg);
              -moz-transform: rotate(7deg);
              -ms-transform: rotate(7deg);
              -o-transform: rotate(7deg);
              transform: rotate(7deg);
              @extend %boxshadow;
              background-color: backgroundcolorleftright;
              position: absolute;
              overflow: hidden;
              bottom: -98px;
              left: -43px;
            }

            .cv-base .front footer .foot-front {
              width: 345px;
              height: 205px;
              z-index: 2;
              -webkit-transform: rotate(28deg);
              -moz-transform: rotate(28deg);
              -ms-transform: rotate(28deg);
              -o-transform: rotate(28deg);
              transform: rotate(28deg);
              background-color: backgroundcolorleftright;
              position: absolute;
              overflow: hidden;
              bottom: -193px;
              right: -133px;
            }

            .cv-base .front footer .foot-words {
              z-index: 3;
              width: 639px;
              height: 115px;
              padding: 8px 0 0 49px;
              background-color: transparent;
              position: absolute;
              overflow: hidden;
              top: 91px;
              left: 0;
            }

            .cv-base .front footer .foot-words h3 {
              padding: 0 0 13px 0;
              margin: 0;
              text-transform: uppercase;
              font-family: allfontcv;
              font-weight: 600;
              font-size: 20px;
              color: colorcontect;
            }

            .cv-base .front footer .foot-words ul {
              padding: 0;
              margin: 0;
              list-style-type: none;
            }

            .cv-base .front footer .foot-words ul li {
              float: left;
              width: 182px;
              margin-bottom: 14px;
              background-color: transparent;
              overflow: hidden;
            }

            /*تنسيقات الايقونات*/

            .cv-base .front footer .foot-words ul li .icons {
              float: left;
              width: 20px;
              overflow: hidden;
            }

            .cv-base .front footer .foot-words ul li .icons i {
              font-size: 16px;
              color: coloricons;
            }

            /*نهاية تنسيقات الايقونات*/

            /*********************************/

            /*تنسيقات المعلومات*/

            .cv-base .front footer .foot-words ul li .words {
              float: right;
              width: 156px;
              overflow: hidden;
            }

            .cv-base .front footer .foot-words ul li .words p {
              width: 149px;
              padding: 0;
              margin: 0;
              overflow: hidden;
              font-family: allfontcv;
              font-size: 13px;
              color: colorcontecttexts;
            }

            /*نهاية تنسيقات المعلومات*/

            /*نهاية فوتر السيلفي*/

            /*نهاية واجهة السيفي*/

            /*نهاية قاعدة السيفي*/

            /****************************************************************************************************/

            boxshadow {
              -webkit-box-shadow: 0 0 12px -4px #000;
              -moz-box-shadow: 0 0 12px -4px #000;
              box-shadow: 0 0 12px -4px #000;
            }

            borderradius {
              -webkit-border-radius: 100px;
              -moz-border-radius: 100px;
              border-radius: 100px;
            }
          </style>




          <style>
            li {
              list-style-type: none;
            }

            ul {
              padding: 0px;
              display: inline-block;
            }

            .center {
              text-align: center;
            }

            body {
              background-color: #9593a8;
            }

            h2,
            h3,
            h4,
            .content p {
              color: #3a3560;
            }

            .grey {
              color: #838385;
            }

            h3 {
              padding-top: 10px;
              padding-bottom: 3px;
              font-size: 17px;
            }

            h4 {
              font-size: 15px;
            }

            p {
              font-size: 14px;
              margin-bottom: 40px;
              line-height: 18px;
            }

            .paper {
              width: 800px;
              margin-left: auto;
              margin-right: auto;
              background-color: #d2d3d6;
              padding: 50px;
              margin-top: 45px;
              box-shadow: -10px 40px 37px 5px #3a3560;
            }

            .paper2 {
              background-color: #e2e2e4;
            }

            .contact {
              display: inline-block;
              width: 70px;
              text-align: center;
              height: 1070px;
              vertical-align: top;
              padding-top: 244px;
            }

            .contact li {
              padding-top: 34px;
              padding-bottom: 34px;
            }

            .contact h3.grey {
              writing-mode: vertical-rl;
              color: #9ca8a8;
              padding-top: 70px;
              padding-bottom: 40px;
              padding-left: 5px;
            }

            .content {
              display: inline-block;
            }

            .left {
              display: inline-block;
              width: 270px;
              padding: 30px;
              box-sizing: border-box;
              margin-right: 5px;
              border-left: solid 2px #a8adb0;
              box-sizing: border-box;
              height: 1070px;
              vertical-align: top;
            }

            .left h2 {
              padding-top: 20px;
              padding-bottom: 20px;
              line-height: 35px;
              letter-spacing: 2px;
              font-size: 27px;
            }

            .right {
              display: inline-block;
              width: 330px;
              box-sizing: border-box;
              height: 1070px;
            }

            .pic {
              position: relative;
              margin-top: 40px;
              padding-left: 15px;
            }

            .colorbox {
              position: absolute;
              top: 357px;
              width: 315px;
              height: 90px;
              background-color: rgba(69, 73, 173, 0.78);
            }

            .colorbox2 {
              background-color: #93a0a8;
              position: absolute;
              top: 447px;
              left: 347px;
              width: 26px;
              height: 90px;
            }

            .colorbox3 {
              position: absolute;
              top: 410px;
              left: 104px;
            }

            .year h4 {
              display: inline-block;
            }

            .year .info {
              display: inline-block;
              text-align: right;
              width: 230px;
              font-size: 14px;
              vertical-align: middle;
              height: auto;
              margin-left: 14px;
            }

            .language {
              margin: -12px 0px;
              padding: 0px;
            }

            .language h4 {
              display: inline-block;

              width: 83px;
            }

            .rate {
              vertical-align: middle;
              height: auto;
              display: inline-block;
            }


            .skill {
              margin-top: 90px;
              height: auto;
              vertical-align: bottom;
            }

            .software {
              display: inline-block;
              width: 80px;
              height: 120px;
              text-align: center;
              position: relative;
              /*   margin:0;padding:0; */
            }

            .software h4 {
              display: block;
              /*   margin-top: 90px; */
            }

            .pie {
              width: 70px;
              height: 70px;
              background-color: #93a0a8;
              overflow: hidden;
              border-radius: 100%;
              position: absolute;
              left: 4px;
              top: -15px;
            }

            .cutpie1 {
              width: 70px;
              height: 70px;
              background-color: rgba(69, 73, 173, 1);
              position: absolute;
              transform-origin: bottom right;
              transform: rotate(0deg);
              left: 35px;
              top: -35px;
            }

            .cutpie2 {
              width: 70px;
              height: 70px;
              background-color: rgba(69, 73, 173, 1);
              /*   border:solid 1px; */
              position: absolute;
              transform-origin: bottom right;
              transform: rotate(30deg);
              left: 26px;
              top: 1px;
            }

            .cutpie2s {
              width: 70px;
              height: 70px;
              background-color: rgba(69, 73, 173, 1);
              /*   border:solid 1px; */
              position: absolute;
              transform-origin: bottom right;
              transform: rotate(150deg);
              left: -35px;
              top: -34px;
            }

            .cutpie3 {
              width: 70px;
              height: 70px;
              background-color: rgba(69, 73, 173, 1);
              /*   border:solid 1px; */
              position: absolute;
              transform-origin: bottom left;
              transform: rotate(240deg);
              left: 35px;
              top: -35px;
            }

            .software h4 {
              padding-top: 60px;
            }

            .skill h3 {
              vertical-align: middle;
              height: auto;
              margin-top: -40px;
            }

            .skillgroup {
              display: inline-block;
              text-align: right;
              width: 250px;
              /*   font-size: 14px; */
              vertical-align: middle;
              height: auto;
              margin-left: 0px;
            }
          </style>

          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap" />
          <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

        </head>

        <body>
          <div class="pre-loader">
            <div class="pre-loader-box">
              <div class="loader-logo">
                <img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg' alt="">
              </div>
              <div class='loader-progress' id="progress_div">
                <div class='bar' id='bar1'></div>
              </div>
              <div class='percent' id='percent1'>0%</div>
              <div class="loading-text">Loading...</div>
            </div>
          </div>

          <%@include file="header.jsp" %>

            <div class="right-sidebar">
              <div class="sidebar-title">
                <h3 class="weight-600 font-16 text-blue">
                  Layout Settings <span class="btn-block font-weight-400 font-12">User
                    Interface Settings</span>
                </h3>
                <div class="close-sidebar" data-toggle="right-sidebar-close">
                  <i class="icon-copy ion-close-round"></i>
                </div>
              </div>
              <div class="right-sidebar-body customscroll">
                <div class="right-sidebar-body-content">
                  <h4 class="weight-600 font-18 pb-10">Header Background</h4>
                  <div class="sidebar-btn-group pb-30 mb-10">
                    <a href="javascript:void(0);" class="btn btn-outline-primary header-white">White</a>
                    <a href="javascript:void(0);" class="btn btn-outline-primary header-dark active">Dark</a>
                  </div>

                  <h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
                  <div class="sidebar-btn-group pb-30 mb-10">
                    <a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">White</a> <a
                      href="javascript:void(0);" class="btn btn-outline-primary sidebar-dark active">Dark</a>
                  </div>

                  <div class="reset-options pt-30 text-center">
                    <button class="btn btn-danger" id="reset-settings">Reset
                      Settings</button>
                  </div>
                </div>
              </div>
            </div>

            <div class="left-side-bar">
              <div class="brand-logo">
                <a href="javascript:;"> <img
                    src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt=""
                    class="dark-logo"> <img
                    src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt=""
                    class="light-logo">
                </a>
                <div class="close-sidebar" data-toggle="left-sidebar-close">
                  <i class="ion-close-round"></i>
                </div>
              </div>
              <%@include file="sidebar.jsp"%>
            </div>
            <div class="mobile-menu-overlay"></div>

            <div class="main-container">
              <div class="xs-pd-20-10 pd-ltr-20 height-100-p">
                <div class="title pb-20 text-center">
                  <h2 class="h3 mb-0" style="background: #0f2c7eeb; color: white; border-radius: 5px;">
                    <span>Available Internships</span>
                  </h2>




                  <div class="container">
                    <div class="profile">
                      <div class="profile-photo"></div>
                      <div class="profile-info">
                        <h2 class="heading heading-light">
                          Profile
                        </h2>
                        <p class="profile-text">
                          Hello! I m ${student.student_name}. Completed Internship with all stages of the development
                          cycle for projects. Well-versed in numerous skills including ${student.skills} etc.
                        </p>
                        <div class="contacts">
                          <div class="contacts-item">
                            <h3 class="contacts-title">
                              <i class="fas fa-phone-volume"></i>
                              Phone
                            </h3>
                            <a href="tel:+18001234567" class="contacts-text">${student.contact}</a>
                            <h3 class="contacts-title">

                              Email
                            </h3>
                            <a href="mailto:Robertsmith@gamil.com" class="contacts-text">${student.email_id}</a>
                            <h3 class="contacts-title">

                              DOB
                            </h3>
                            <a href="http://www.robertsmith.com" class="contacts-text">${student.d_o_b}</a>

                            <h3 class="contacts-title">

                              City
                            </h3>
                            <a href="http://www.robertsmith.com" class="contacts-text">${student.curr_city}</a>

                          </div>


                          <div class="contacts-item">
                            <h2 class="heading heading-light">Skills</h2>
                            <ul class="skills-list">
                              <c:forEach var="skill" items="${student.skills.split(',')}">
                                <li class="skill">${skill}</li>
                              </c:forEach>
                            </ul>

                          </div>
                        </div>
                        <h2 class="heading heading-light">Languages</h2>
                        <ul class="skills-list">
                          <li>English</li>
                          <li>Hindi</li>

                        </ul>
                      </div>
                    </div>
                    <div class="resume">
                      <div class="resume-wrap">

                        <div class="about">
                          <h1 class="name">${student.student_name}</h1>
                          <span class="position">${student.skills}</span>
                        </div>
                        <div class="experience">
                          <h2 class="heading heading_dark">
                            Education
                          </h2>
                          <ul class="list">
                            <c:forEach var="studentPasts" items="${studentPast}">
                              <li class="list-item">
                                <h4 class="list-item__title">Qualification :
                                  <c:out value="${studentPasts.category}" />
                                </h4>
                                <span class="list-item__date">Organization Name :
                                  <c:out value="${studentPasts.organization}" />
                                </span>
                                <p class="list-item__text">Board/University :
                                  <c:out value="${studentPasts.board}" />
                                </p>
                                <p class="list-item__text">Percentage :
                                  <c:out value="${studentPasts.description}" /> %
                                </p>
                              </li>
                            </c:forEach>
                          </ul>
                        </div>
                        <div class="education">
                          <h2 class="heading heading_dark">
                            Experience
                          </h2>
                          <ul class="list">
                            <c:forEach var="internship" items="${internship3}">
                              <li class="list-item list-item_non-border">
                                <c:set var="formattedDate"
                                  value="${fn:substringBefore(internship.date_started, ' ')}" />
                                <c:set var="formattedDate2"
                                  value="${fn:substringBefore(internship.date_completed, ' ')}" />
                                <h4 class="list-item__title">
                                  <c:out value="${formattedDate}" /> - ${formattedDate2}
                                </h4>
                                <p>Company Name : &nbsp; ${internship.companyName}</p>
                                <p>Position : &nbsp; ${internship.technology} /&nbsp;&nbsp;Intern </p>
                                <p>Duration : &nbsp; ${internship.duration} /&nbsp;Weeks </p>
                                <p>Status : &nbsp; ${internship.status}</p>
                              </li>

                            </c:forEach>
                          </ul>
                        </div>
                        Objective:
                        <hr />
                        <p>To work in an organization which provides me with ample opportunities to enhance my skills
                          and knowledge along with contributing to the growth of the organisation.</p>
                      </div>
                    </div>
                  </div>
                  <div class="download-buttons">
                    <!-- <button onclick="downloadCV('word')">Download Word</button> -->
                    <button onclick="downloadCV('pdf')">Download PDF</button>
                  </div>




                  <!--                 resume 2 -->

                  <div class="cv-base">
                    <div class="back"></div>
                    <div class="front">
                      <header>
                        <div class="head-top"></div>
                        <div class="head-right"></div>
                        <div class="head-bottom">
                          <div class="margin">
                            <div class="image-left"></div>
                            <div class="words-right">
                              <h3 title="">${student.student_name}</h3>

                            </div>
                          </div>

                        </div>
                      </header>
                      <section>
                        <div class="margin">
                          <aside>
                            <div id="aside01" class="aside-parts">
                              <h3>about me</h3>
                              <ul id="scrolls">
                                <li>
                                  <p> Hello! I m ${student.student_name}. Completed Internship with all stages of the
                                    development cycle for projects. Well-versed in numerous skills including
                                    ${student.skills} etc.
                                  </p>
                                </li>
                              </ul>
                            </div>
                            <div id="aside02" class="aside-parts">
                              <h3>education</h3>
                              <ul id="scrolls">






                                <c:forEach var="studentPasts" items="${studentPast}">
                                  <li id="education01">

                                    <h4 class="list-item__title">Qualification :
                                      <c:out value="${studentPasts.category}" />
                                    </h4>
                                    <span class="list-item__date">Organization Name :
                                      <c:out value="${studentPasts.organization}" />
                                    </span>
                                    <p class="list-item__text">Board/University :
                                      <c:out value="${studentPasts.board}" />
                                    </p>
                                    <p class="list-item__text">Percentage :
                                      <c:out value="${studentPasts.description}" /> %
                                    </p>

                                  </li>
                                  <hr />
                                </c:forEach>

                              </ul>
                            </div>
                          </aside>
                          <article>
                            <div id="article01" class="article-parts">



                              <h3>skills</h3>

                              <div id="scrolls" class="groups">
                                <div id="line01" class="lines">
                                  <ul>
                                    <c:forEach var="skill" items="${student.skills.split(',')}">
                                      <center>
                                        <li style="position: relative; left: 32%;">
                                          <div class="icons">
                                            <i class="fas fa-star"></i>
                                          </div>
                                          <div class="words">
                                            <p>${skill}</p>
                                          </div>
                                        </li>
                                      </center>
                                    </c:forEach>

                                  </ul>
                                </div>

                              </div>
                            </div>




                            <div id="article02" class="article-parts">
                              <h3>work experience</h3> <br />
                              <ul id="scrolls" style="position: relative; left: 5%;">
                                <c:forEach var="internship" items="${internship3}">
                                  <li id="experience01">
                                    <c:set var="formattedDate"
                                      value="${fn:substringBefore(internship.date_started, ' ')}" />
                                    <c:set var="formattedDate2"
                                      value="${fn:substringBefore(internship.date_completed, ' ')}" />
                                    <h3 class="list-item__title" style="position: relative; left: 12%;">
                                      <c:out value="${formattedDate}" /> - ${formattedDate2}
                                    </h3>
                                    <p>Company Name : &nbsp; ${internship.companyName}</p>
                                    <p>Position : &nbsp; ${internship.technology} /&nbsp;&nbsp;Intern </p>
                                    <p>Duration : &nbsp; ${internship.duration} /&nbsp;Weeks </p>
                                    <p>Status : &nbsp; ${internship.status}</p>
                                  </li>
                                </c:forEach>
                              </ul>
                            </div>
                          </article>
                        </div>
                      </section>
                      <div class="loop"></div>
                      <footer>
                        <div class="foot-back"></div>
                        <div class="foot-front"></div>
                        <div class="foot-words">
                          <h3>contact me</h3>
                          <ul>
                            <li id="contact01">
                              <div class="icons">
                                <i class="fas fa-map-marker-alt"></i>
                              </div>
                              <div class="words">
                                <p title="">${student.curr_city}</p>
                              </div>
                            </li>
                            <li id="contact02">
                              <div class="icons">
                                <i class="fas fa-envelope"></i>
                              </div>
                              <div class="words">
                                <p maxlength="10">${student.email_id}</p>
                              </div>
                            </li>
                            <li id="contact03">
                              <div class="icons">
                                <i class="fas fa-phone"></i>
                              </div>
                              <div class="words">
                                <p>${student.contact}</p>
                              </div>
                            </li>

                          </ul>
                        </div>
                      </footer>
                    </div>
                  </div>

                  <div class="download-buttons2">
                    <!-- <button onclick="downloadCV('word')">Download Word</button> -->
                    <button onclick="downloadCV2('pdf')">Download PDF</button>
                  </div>
                </div>
              </div>


              <!-- --------------------------------------------------------------------------------------------------------------------------------------- -->


              <div class="paper">
                <div class="paper2">
                  <div class="contact">
                    <ul>
                      <li><img src="https://i.postimg.cc/VL1v2bLL/icon-marker.png" alt="" width=27px></li>
                      <li><img src="https://i.postimg.cc/fRC98fcN/icon-phone.png" alt="" width=27px></li>
                      <li><img src="https://i.postimg.cc/g0GxRXQT/icon-email.png" alt="" width=27px></li>
                      <li><img src="https://i.postimg.cc/VNwCRHr4/icon-earth.png" alt="" width=27px></li>
                    </ul>
                    <h3 class="grey">LANCUAGE</h3>
                  </div>
                  <div class="content">
                    <div class="left">
                      <h2>${student.student_name}</h2>
                      <h3>PROFILE</h3>
                      <p style="text-align: justify;color:#838385">Hello! I m ${student.student_name}. Completed
                        Internship with all stages of the development cycle for projects. Well-versed in numerous skills
                        including ${student.skills} etc. </p>

                      <h3>CONTACT</h3>
                      <h4>City</h4>
                      <p>${student.curr_city}</p>
                      <h4>Phone</h4>
                      <p>${student.contact}</p>
                      <h4>Email</h4>
                      <p>${student.email_id}</p>
                      <h4>D.O.B</h4>
                      <p>${student.d_o_b}</p>
                      <div class="language">
                        <h4>English</h4>
                        <div class="rate">
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="smlo"></div>
                          <div class="smlo"></div>
                        </div>
                      </div>
                      <div class="language">
                        <h4>Hindi</h4>
                        <div class="rate">
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                        </div>
                      </div>
                      <div class="language">
                        <h4>Marathi</h4>
                        <div class="rate">
                          <div class="bigo"></div>
                          <div class="bigo"></div>
                          <div class="smlo"></div>
                          <div class="smlo"></div>
                          <div class="smlo"></div>
                        </div>
                      </div>
                    </div>
                    <div class="right">
                      <div class="pic">
                        <img src='data:image/jpeg;base64,${photoBase64}' alt="" width=345px>
                        <div class="colorbox"></div>
                        <div class="colorbox2"></div>
                        <img class="colorbox3" src="https://i.postimg.cc/KjHJLvVw/arrow.png" alt="" width=124px>
                      </div>
                      <br /><br />








                      <h3 class="center" style="padding:169px 0px 60px;">EXPERIENCE</h3>
                      <center>
                        <c:forEach var="internship" items="${internship3}">
                          <div class="year">
                            <c:set var="formattedDate" value="${fn:substringBefore(internship.date_started, ' ')}" />
                            <c:set var="formattedDate2" value="${fn:substringBefore(internship.date_completed, ' ')}" />
                            <h4 class="list-item__title a">
                              <c:out value="${formattedDate}" /> - ${formattedDate2}
                            </h4>
                            <p style="
    margin: 0;">Company Name : &nbsp; ${internship.companyName}</p>
                            <p style="
    margin: 0;">Position : &nbsp; ${internship.technology} /&nbsp;&nbsp;Intern </p>
                            <p style="
    margin: 0;">Duration : &nbsp; ${internship.duration} /&nbsp;Weeks </p>
                            <p style="
    margin: 0;">Status : &nbsp; ${internship.status}</p>
                          </div>
                        </c:forEach>








                      </center>
                      <div class="skill">
                        <h3 style="display: inline-block;">SKILLS</h3>
                        <div class="skillgroup">
                          <c:forEach var="skill" items="${student.skills.split(',')}">
                            <div class="software">
                              <div class="pie">
                                <div class="cutpie1"></div>
                              </div>
                              <h4>${skill}</h4>
                            </div>
                          </c:forEach>

                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="greybox"></div>
                </div>
              </div>
              <center>
                <div class="download-buttons2">
                  <!-- <button onclick="downloadCV('word')">Download Word</button> -->
                  <button onclick="downloadCV3('pdf')">Download PDF</button>
                </div>
              </center>
              <!-- ----------------------------------------------------------------------------------------------------------------------------------------- -->

            </div>
            <%@include file="footer.jsp" %>
              </div>
              <input type="hidden" id="gif_file_path" value='<c:url value="/images/loading.gif"/>'>
              <c:if test="${role== ProjectConstants.hod_Role || role==ProjectConstants.dept_incharge_Role }">
                <input type="hidden" id="role" value="${role}" />
              </c:if>
              <c:if test="${log_type eq ProjectConstants.user_initials_student  }">
                <input type="hidden" id="student_log" value="${log_type}" />
              </c:if>
              <%@include file="modal_common.jsp" %>
                <%@include file="modal.jsp" %>
                  <%@include file="modal_adv_schedule.jsp" %>
                    <%@include file="comp_coll_details_modal.jsp" %>
                      <!-- js -->
                      <input type="hidden" id="role" value="${role}" />
                      <input type="hidden" id="student_log" value="${log_type}" />

                      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
                      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.js"
                        integrity="sha512-rmeGgGFs1GsDm4pB4vQNn7ZJLQv9s8gVlaEbn+u+k+nKU0UVyRcEsfrNXxOZ6Wznx4oOOYfUCWUhmsFuc2PAbw=="
                        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                      <script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
                      <script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>

                      <script
                        src="${pageContext.request.contextPath}/style/dist/js/myjs/showmore_or_showless.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/js/myjs/companyadvforcollege.js"></script>
                      <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                      <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>


                      <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
                      <script
                        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2${pageContext.request.contextPath}/style/dist/umd/popper.min.js"></script>
                      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>



                      <script>
                        async function downloadCV(format) {
                          if (format === 'pdf') {
                            const { jsPDF } = window.jspdf;
                            const doc = new jsPDF();

                            // Convert HTML to canvas using html2canvas
                            const element = document.querySelector('.container');

                            const canvas = await html2canvas(element);

                            const imgData = canvas.toDataURL('image/png');


                            // Add the image to the PDF
                            const imgProps = doc.getImageProperties(imgData);

                            const pdfWidth = doc.internal.pageSize.getWidth();
                            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;


                            doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);


                            // Save the PDF
                            doc.save('CV.pdf');
                          } else if (format === 'word') {
                            // Implementation for Word document download (not provided in this example)
                          }
                        }

                      </script>
                      <script>
                        async function downloadCV2(format) {
                          if (format === 'pdf') {
                            const { jsPDF } = window.jspdf;
                            const doc = new jsPDF();

                            // Convert HTML to canvas using html2canvas
                            const element = document.querySelector('.cv-base');

                            const canvas = await html2canvas(element);

                            const imgData = canvas.toDataURL('image/png');


                            // Add the image to the PDF
                            const imgProps = doc.getImageProperties(imgData);

                            const pdfWidth = doc.internal.pageSize.getWidth();
                            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;


                            doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);


                            // Save the PDF
                            doc.save('CV.pdf');
                          } else if (format === 'word') {
                            // Implementation for Word document download (not provided in this example)
                          }
                        }

                      </script>
                      <script>
                        async function downloadCV3(format) {
                          if (format === 'pdf') {
                            const { jsPDF } = window.jspdf;
                            const doc = new jsPDF();

                            // Convert HTML to canvas using html2canvas
                            const element = document.querySelector('.paper');

                            const canvas = await html2canvas(element);

                            const imgData = canvas.toDataURL('image/png');


                            // Add the image to the PDF
                            const imgProps = doc.getImageProperties(imgData);

                            const pdfWidth = doc.internal.pageSize.getWidth();
                            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;


                            doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);


                            // Save the PDF
                            doc.save('CV.pdf');
                          } else if (format === 'word') {
                            // Implementation for Word document download (not provided in this example)
                          }
                        }

                      </script>

                      <script>
                        $(document).ready(function () {
                          // تخصيص مؤشر النزول

                          $("html").niceScroll({

                            cursorcolor: "#212b37",
                            cursorborder: "5px solid #212b37",
                            cursorborderradius: "0",
                            scrollspeed: 65
                          })

                          $("ul, div").filter("#scrolls").niceScroll({

                            cursorcolor: "#ff4359",
                            cursorborder: "2px solid #ff4359",
                            cursorborderradius: "0",
                            scrollspeed: 65
                          })

                          // نهاية تخصيص مؤشر النزول
                        });



                      </script>
                      <script>
                        function dispStudentData(studentId) {
                          $("#divLoading").show();
                          $.ajax({
                            type: "GET",
                            url: "${pageContext.request.contextPath}/getStudentDetails?student_id=" + studentId,
                            async: false,
                            success: function (response) {
                              $('#scrollDiv').scrollTop(0);
                              // setting personal details
                              var studentDetails = response; // Access the response directly
                              $("#name").text(studentDetails.student_name);
                              $("#email").text(studentDetails.email_id);
                              $("#contact").text(studentDetails.contact);
                              $("#curr_city").text(studentDetails.curr_city);
                              $("#home_city").text(studentDetails.home_city);
                              $("#skills").text(studentDetails.skills);
                              $("#dob").text(studentDetails.d_o_b);
                              $("#interest").text(studentDetails.interest);
                              $("#hobbies").text(studentDetails.hobbies);
                              $("#achievements").text(studentDetails.achievements);
                              if (studentDetails.photo != null && studentDetails.photo != "") {
                                document.getElementById("studentPic").src = "data:image/png;base64," + studentDetails.photo;
                              } else {
                                document.getElementById("studentPic").src = "data:image/png;base64," + blank_pro_image;
                              }


                            },
                            error: function (xhr, status, error) {
                              console.log("Error:", error);
                              // Handle error here
                            }
                          });
                        }

                      </script>

        </body>

        </html>