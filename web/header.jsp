<% response.setHeader("Cache-Control", "no-cache, no-store, " +
"must-revalidate"); response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0); %>
<nav>
    <div class="main-content">
        <div
            class="body"
            style="padding-top: 8px; height: 76px; background: #fff"
        >
            <div
                class="logo"
                style="
                    background: url(assets/img/logo-1.svg);
                    background-repeat: no-repeat;
                    background-size: contain;
                    background-position-y: 50%;
                    width: calc(2.251 * 76px);
                    height: 76px;
                "
            ></div>

            <ul>
                <li>
                    <a href="#!">Tài liệu chuyên ngành</a>
                </li>

                <% if ("librarian".equals(session.getAttribute("role"))) { %>
                <li><a href="./management.jsp">Quản lý</a></li>
                <% } %>
                <li><a href="./borrow.jsp">Mượn sách</a></li>
                <li>
                    <a href="#!">Xếp hạng</a>
                </li>
                <li><a href="./message.jsp">Nhắn tin</a></li>
            </ul>

            <div class="search" style="margin-left: 30px">
                <span class="material-symbols-outlined" style="font-size: 26px">
                    search
                </span>
            </div>
            <div
                class="language"
                style="
                    position: relative;
                    display: flex;
                    margin-left: auto;
                    align-items: center;
                    gap: 12px;
                "
            >
                <div class="notification">
                    <img src="./assets/img/notification-icon.svg" alt=""/>
                </div>

                <div class="notification-container">
                    <span
                        style="
                            display: block;
                            font-size: 2.2rem;
                            font-weight: 400;
                            padding: 12px;
                        "
                        >Thông báo</span
                    >

                    <ul data-student_id=<%=session.getAttribute("username") %>>
                        <li>
                            <img src="./assets/img/msg-noti-icon.svg" alt="" />
                            <span class="noti-header" style="font-weight: 400"
                                >Bạn có 5 tin nhắn mới</span
                            >
                            <span class="noti-content"></span>
                        </li>
                    </ul>
                </div>

                <a href="./user.jsp" class="username" style="position: relative"
                    ><span style="font-size: 18px; padding: 24px 0"
                        >Hello, <%=session.getAttribute("username") %>
                    </span>
                </a>

                <div
                    style="
                        position: absolute;
                        top: 52px;
                        right: 0;
                        padding: 16px 0;
                        padding-left: 20px;
                        padding-right: 60px;
                        background-color: white;
                        border: 1px #ccc solid;
                        border-top: 7px var(--primary-color) solid;
                        pointer-events: auto;
                    "
                    class="tab"
                >
                    <div
                        style="
                            display: flex;
                            flex-direction: column;
                            margin: 0;
                            gap: 12px;
                        "
                    >
                        <a
                            href="./user.jsp"
                            style="
                                font-size: 16px;
                                font-weight: 400;
                                text-decoration: underline;
                            "
                            >Profile</a
                        >
                        <span
                            class="log_out"
                            style="
                                font-size: 1.6rem;
                                opacity: 0.87;
                                text-decoration: underline;
                                cursor: pointer;
                            "
                        >
                            Log out
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="ulti">
    <div class="main-content">
        <div class="body" style="margin-top: 18px">
            <div class="breadcrumb">
                <ul style="display: flex; align-items: center; gap: 8px">
                    <li>
                        <a href="./home.jsp"
                            ><span
                                class="material-symbols-outlined"
                                style="font-size: 26px"
                            >
                                home_pin
                            </span></a
                        >
                    </li>
                    <li>
                        <a href="./home.jsp">PTIT Library</a>
                    </li>
                    <li>
                        <a href="#!">Tài liệu chuyên ngành</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<script src="./assets/js/jquery3.6.0.js"></script>

<script>
    
    var log_out = document.querySelector(".log_out");
    log_out.addEventListener("click", function (e) {
        e.preventDefault();

        $.ajax({
            url: "./user",
            type: "POST",
            data: { action: "logout" },
            success: function () {
                // Chuyển hướng từ phía client sau khi nhận phản hồi thành công
                window.location.href = "./Auth.jsp";
            },
        });
    });

    var noti_container = document.querySelector(
                ".notification-container ul"
            );
    var username_account = noti_container.dataset.student_id;
    console.log("USERNAME ACCOUNT = " + username_account);
    $.ajax({
        url: "./noti",
        type: "GET",
        dataType: "json",
        data: {
            student_id: username_account,
        },
        success: function (data) {
            console.log(data);
            

            data.forEach((noti) => {
                noti_container.insertAdjacentHTML(
                    "beforeend",
                    `
                    <li>
                            <img
                                src="./assets/img/` +
                        noti.icon +
                        `"
                                alt=""
                            />
                            <div>
                                <span class="noti-header">` +
                        noti.notificationType +
                        `</span>
                                <span class="noti-content"
                                    >` +
                        noti.message +
                        `
                                </span>
                            </div>
                        </li>
                    
                    `
                );
            });
        },
    });
</script>
