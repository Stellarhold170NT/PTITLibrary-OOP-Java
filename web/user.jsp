<%-- Document : home Created on : Oct 12, 2024, 9:48:17 PM Author : Admin --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta property="og:title" content="PTIT Library" />
        <meta
            property="og:description"
            content="Ptiters are united by a share purpose"
        />
        <meta
            property="og:image"
            content="https://stellarhold170nt.github.io/PTITLibrary/assets/img/icon.svg"
        />
        <meta property="og:type" content="website" />
        <link
            rel="icon"
            href="https://stellarhold170nt.github.io/PTITLibrary/assets/img/icon.svg"
        />

        <title>PTIT Library</title>

        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        />

        <style>
            body {
                box-sizing: border-box;
            }
            .section1,
            .section2 {
                min-height: calc(100vh - 148px);
            }

            .profile {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 32px;
                padding-right: 24px;
            }

            .avatar {
                width: 128px;
                height: 128px;
                background-color: #ccc;
                background-image: url("<%=session.getAttribute("avatar")%>");
                background-size: cover;
                background-position: center;
                border-radius: 50%;
                background-repeat: no-repeat;
                /* transition: opacity 0.5s ease; */
                opacity: 1;
            }

            .avatar.loading {
                animation: loading 1.5s ease-in-out infinite;
            }

            @keyframes loading {
                0% {
                    opacity: 0.5;
                    transform: scale(1); /* Kích thước ban đầu */
                }
                50% {
                    opacity: 1; /* Đầy đủ độ sáng */
                    transform: scale(1.05); /* Phóng to một chút */
                }
                100% {
                    opacity: 0.5; /* Quay lại trạng thái mờ */
                    transform: scale(1); /* Quay lại kích thước ban đầu */
                }
            }

            .profile .student_name {
                margin-top: 24px;
                font-size: 1.8rem;
                font-weight: 700;
            }

            .profile .student_id {
                margin-top: 8px;
                font-size: 1.6rem;
            }

            .profile__email {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .profile__email .title {
                margin-top: 24px;
                font-size: 1.6rem;
                font-weight: 700;
            }

            .profile .student_email {
                margin-top: 8px;
                display: block;
                width: 150px;
                font-size: 1.6rem;
                text-align: center;
                word-wrap: break-word;
                color: #467886;
                text-decoration: underline;
            }

            .profile__gpa,
            .profile__rank {
                display: flex;
                align-self: center;
                justify-content: center;
                gap: 3px;
            }

            .profile__gpa {
                margin-top: 24px;
            }

            .profile__rank {
                margin-top: 8px;
            }

            .profile__gpa .title,
            .profile__rank .title {
                font-size: 1.6rem;
                font-weight: 700;
            }

            .profile .student_gpa {
                font-size: 1.6rem;
            }

            .profile .student_rank {
                font-size: 1.6rem;
            }

            .social {
                margin-top: 20px;
                width: 100%;
                height: 40px;
                text-align: center;
                font-size: 1.8rem;
                line-height: 40px;
                color: white;
                background-color: var(--primary-color);
            }

            /* #Section2 */

            .navigator {
                margin-top: 24px;
            }

            .navigator ul {
                display: flex;
                justify-content: flex-end;
                padding-right: 3.2em;
            }

            .navigator li span {
                margin-left: 12px;
                display: inline-block;
                height: 32px;
                padding: 0 32px;
                color: white;
                font-size: 1.6rem;
                line-height: 32px;
                background-color: var(--primary-color);
                border-radius: 6px;
                cursor: pointer;
                box-sizing: border-box;
            }

            .navigator li span.unselect {
                background-color: white;
                outline: 2px #d9d9d9 solid;
                color: black;
            }

            .navigator_content {
                margin: 0 3.2em;
                margin-left: 64px;
            }
            .hello {
                position: relative;
                margin-top: 24px;
            }

            .hello span {
                display: inline-block;
                position: absolute;
                top: -14px;
                left: 6rem;
                padding: 0 8px;
                height: 28px;
                font-size: 1.8rem;
                line-height: 28px;
                background-color: white;
            }

            .box {
                height: 200px;
                border: 2px #d9d9d9 solid;
            }

            .small_lib {
                margin-top: 80px;
                display: flex;
                align-items: center;
                gap: 24px;
            }

            .small_lib a {
                font-size: 1.8rem;
                color: var(--primary-color);
                text-decoration: underline;
            }

            .small_lib a i {
                font-weight: 700;
            }

            /* Table CSS */

            table {
                margin-top: 24px;
                width: 100%;
                overflow-x: auto;
            }

            table tr {
                height: 44px;
                width: 100%;
            }

            table td {
                vertical-align: middle;
                line-height: 44px;
                text-align: center;
            }

            table tr:nth-child(odd) {
                background-color: #fcfcfc;
            }

            table tr:nth-child(even) {
                background-color: #f4f4f4;
            }

            table tr:first-child td {
                font-size: 1.6rem;
                font-weight: 700;
            }

            table tr:not(:first-child) td {
                font-size: 1.6rem;
            }

            table img {
                cursor: pointer;
            }

            table tr td:not(:first-child) {
                margin: 0 8px;
            }

            /* ProfileEdit */
            .edit_profile {
                margin-top: 24px;
            }

            .edit_avatar {
                margin: 0 128px;
                display: flex;
                align-items: center;
                gap: 16px;
            }

            .change_avatar,
            .reset_avatar {
                font-size: 1.6rem;
                line-height: 32px;
                height: 32px;
                padding: 0 12px;
                border-radius: 16px;
                cursor: pointer;
                outline: 2px #d9d9d9 solid;
            }

            .change_avatar:hover {
                background-color: #f2f2f2;
            }

            .reset_avatar {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <!-- <%@ include file="header.jsp"%> -->
        <jsp:include page="header.jsp" />
        <div class="header">
            <div class="main-content">
                <div class="body">
                    <div class="section1">
                        <h3 style="margin-top: 24px">Profile / Tài khoản</h3>
                        <div class="profile">
                            <div class="avatar"></div>
                            <span class="student_name"
                                ><%=session.getAttribute("full_name")%></span
                            >
                            <span class="student_id"
                                ><%=session.getAttribute("username")%></span
                            >

                            <div class="profile__email">
                                <span class="title">Email: </span>
                                <span class="student_email"
                                    ><%=session.getAttribute("email")%></span
                                >
                            </div>
                            <div class="profile__gpa">
                                <span class="title">Gpa: </span>
                                <span class="student_gpa">3.33</span>
                            </div>

                            <div class="profile__rank">
                                <span class="title">Xếp hạng: </span>
                                <span class="student_rank">#313</span>
                            </div>

                            <a href="" class="social">Facebook</a>
                        </div>
                    </div>
                    <div class="section2">
                        <div class="navigator">
                            <ul>
                                <li><span class="about">About</span></li>
                                <li>
                                    <span class="borrow unselect"
                                        >Tài liệu đã mượn</span
                                    >
                                </li>
                                <li>
                                    <span class="edit unselect"
                                        >Edit Profile</span
                                    >
                                </li>
                            </ul>
                        </div>

                        <div class="navigator_content">
                            <!-- <div class="about_content">
                                <div class="hello">
                                    <span>Giới thiệu</span>
                                    <div class="box"></div>
                                </div>

                                <div class="small_lib">
                                    <img src="./assets/img/drive.svg" alt="" />
                                    <a href=""> Thư viện của <i>Huy</i> </a>
                                </div>
                            </div> -->
                            <div class="edit_profile">
                                <form
                                    action="EditProfile"
                                    method="post"
                                    enctype="multipart/form-data"
                                >
                                    <div class="edit_avatar">
                                        <input
                                            type="hidden"
                                            name="action"
                                            value="change_avatar"
                                        />
                                        <div
                                            class="avatar"
                                            style="width: 68px; height: 68px"
                                        ></div>
                                        <input
                                            style="display: none"
                                            type="file"
                                            name="avatar"
                                            id="avatar_input"
                                            accept="image/*"
                                            onchange="this.form.submit()"
                                        />
                                        <label
                                            for="avatar_input"
                                            class="change_avatar"
                                            >Upload new avatar</label
                                        >

                                        <span class="reset_avatar">Reset</span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />

        <% String username = (String) session.getAttribute("username"); if
        (username == null) username = ""; %>
        <script src="./assets/js/jquery3.6.0.js"></script>
        <script>
            var username_account = "<%=username%>";

            function focus(tab1, tab2, tab3) {
                naviContent.empty();
                tab1.classList.remove("unselect");
                tab2.classList.add("unselect");
                tab3.classList.add("unselect");
            }

            var aboutTab = document.querySelector(".about");
            var borrowTab = document.querySelector(".borrow");
            var editTab = document.querySelector(".edit");

            var naviContent = $(".navigator_content");
            aboutTab.addEventListener("click", function (e) {
                e.preventDefault();
                focus(aboutTab, borrowTab, editTab);

                naviContent.append(
                    `
                <div class="about_content">
                    <div class="hello">
                        <span>Giới thiệu</span>
                        <div class="box"></div>
                    </div>

                    <div class="small_lib">
                        <img src="./assets/img/drive.svg" alt="" />
                        <a href="">
                            Thư viện của <i>Huy</i>
                        </a>
                    </div>
                </div>
            `
                );
            });

            borrowTab.addEventListener("click", function (e) {
                e.preventDefault();
                focus(borrowTab, aboutTab, editTab);

                $.ajax({
                    url: "./record",
                    type: "GET",
                    dataType: "json",
                    data: { username: username_account },

                    success: function (data) {
                        console.log(data);
                        naviContent.empty();
                        var content = "";
                        content += `
                        <table>
                                    <tr>
                                    <td></td>
                                    <td>Tên tài liệu</td>
                                    <td>Tác giả</td>
                                    <td>Năm xuất bản</td>
                                    <td>Ngày đăng ký</td>
                                    <td>Trạng thái</td>
                                </tr>`;

                        data.forEach((record) => {
                            if (
                                record.status !== "Đã trả" &&
                                record.status !== "Đăng ký bị hủy"
                            ) {
                                content +=
                                    `
                                 <tr>
                                    <td>
                                        <img
                                            style="
                                                margin: 0 12px;
                                                width: 24px;
                                                vertical-align: middle;
                                            "
                                            src="./assets/img/red.svg"
                                            alt=""
                                        />
                                    </td>
                                    <td> ` +
                                    record.title +
                                    `
                                    </td>
                                    <td> ` +
                                    record.author +
                                    ` </td> 
                                    <td> ` +
                                    record.published_year +
                                    ` </td>
                                    <td>  ` +
                                    record.borrow_date +
                                    ` </td>
                                    <td style="font-weight: 700">` +
                                    record.status +
                                    `</td>
                                </tr>
                                `;
                            }
                        });

                        content += `</table>`;
                        naviContent.append(content);
                    },
                });
            });

            editTab.addEventListener("click", function (e) {
                e.preventDefault();

                focus(editTab, borrowTab, aboutTab);
            });

            /* Image Loader */

            document
                .getElementById("avatar_input")
                .addEventListener("change", function (e) {
                    var avatarDiv = document.querySelector(".avatar");
                    avatarDiv.classList.add("loading");
                });

            var resetAvatarbtn = document.querySelector(".reset_avatar");
            console.log(resetAvatarbtn);
            resetAvatarbtn.addEventListener("click", function () {
                console.log("DO SOMETHING");
                var avatarDiv = document.querySelector(".avatar");
                avatarDiv.classList.add("loading");
                $.ajax({
                    url: "./EditProfile",
                    type: "POST",
                    data: { action: "reset_avatar" },
                    success: function () {
                        window.location.href = "./user.jsp";
                        console.log("DONE AVATAR");
                    },
                });
            });
        </script>
    </body>
</html>
