<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        <style rel="stylesheet" src="reset.css"></style>

        <style>
            * {
                margin: 0;
                padding: 0;
                --primary-color: #ed1c24;
                --content-width: 1422px;
                --gutter: 30px;
                --collumn: 91px;
                box-sizing: border-box;
            }

            html {
                font-size: 62.5%;
                font-family: "Arial", sans-serif;
            }

            body {
                height: 100vh;
                background-color: white;
            }

            a {
                color: var(--primary-color);
            }

            .container {
                display: flex;
                width: 100%;
                height: 100%;
            }

            .section1 {
                width: 35%;
                height: 100vh;
            }

            .section2 {
                width: 65%;
                position: relative;
                overflow: hidden;
            }

            .section2 .illus {
                position: absolute;
                height: 450px;
                right: 0px;
                top: 50%;
                transform: translateY(-50%);
                box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
                z-index: 2;
            }

            .section2 .round {
                position: absolute;
                height: 1050px;
                right: -130px;
                top: 50%;
                transform: translateY(-50%);
                z-index: 1;
            }

            .forms {
                height: 100%;
                max-width: 370px;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-left: 112px;
            }

            .form {
                margin: auto 0;
                width: 100%;
            }

            .form form {
                width: 100%;
            }

            /* .login-title {
                margin-top: 60px;
            } */

            .title {
                font-size: 2.4rem;
                opacity: 0.87;
            }

            .desc {
                margin-top: 8px;
                font-size: 1.8rem;
                opacity: 0.4;
            }

            .type {
                display: block;
                margin-bottom: 24px;
                width: 100%;
                height: 64px;
                font-size: 16px;
                color: #696969;
                border: #d9d9d9 2px solid;
                border-radius: 2px;
                padding: 0 12px;
                transition: all 0.2 ease;
            }

            .idStudent {
                margin-top: 42px;
            }

            .login .logo {
                height: 100px;
            }

            .login .checkbox-text {
                margin-top: 24px;
                display: flex;
                justify-content: space-between;
            }

            .login .checkbox-text .text {
                font-size: 14px;
            }

            .login-btn input,
            .signup-btn input {
                margin-top: 42px;
                border: none;
                width: 100%;
                height: 56px;
                color: white;
                font-size: 2.4rem;
                background-color: var(--primary-color);
            }

            .signup-btn input {
                margin-top: 24px;
            }

            .login-btn input[type="submit"] {
                cursor: pointer;
            }

            .signed-up-now,
            .login-now {
                margin-top: 48px;
                display: block;
                width: 100%;
                text-align: center;
                font-size: 1.8rem;
            }

            .signup {
                display: none;
            }

            .password-strength {
                display: none;
                gap: 8px; /* Khoảng cách giữa các thanh */
                width: 100%;
                margin-bottom: 24px;
            }

            .password-strength .bar {
                flex-grow: 1;
                height: 4px; /* Chiều cao */
                width: 50px; /* Chiều rộng */
                background-color: #ccc; /* Màu sắc ban đầu */
                transition: background-color 0.3s; /* Hiệu ứng mượt mà khi thay đổi màu */
            }

            @media screen and (max-width: 1400px) {
                .container {
                    display: flex;
                    align-items: center;
                    justify-self: center;
                }

                .section1 {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                    margin-right: 0;
                }

                .forms {
                    width: 100%;
                    max-width: 370px;
                    margin-left: 12px;
                    margin-right: 12px;
                    padding: 0;
                }
                .section2 {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <% response.setHeader("Cache-Control", "no-cache, no-store, " +
        "must-revalidate"); response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0); %>

        <div class="container">
            <div class="section1">
                <div class="forms">
                    <div class="form login">
                        <img class="logo" src="./assets/img/logo.svg" alt="" />
                        <div class="login-title" style="margin-top: 60px">
                            <span class="title">Đăng nhập</span>
                            <p class="desc">
                                Chào mừng bạn đến với thư viện PTIT
                            </p>
                        </div>

                        <form action="home" method="POST">
                            <input type="hidden" name="action" value="login" />
                            <input
                                type="text"
                                name="username"
                                placeholder="Mã sinh viên"
                                class="idStudent type"
                                required
                            />
                            <input
                                type="password"
                                name="password"
                                class="password type"
                                placeholder="Mật khẩu"
                                required
                            />

                            <div class="checkbox-text">
                                <div class="checkbox-content">
                                    <input type="checkbox" id="logCheck" />
                                    <label for="logCheck" class="text"
                                        >Ghi nhớ mật khẩu</label
                                    >
                                </div>

                                <a href="" class="text">Quên mật khẩu</a>
                            </div>

                            <div class="login-btn">
                                <input type="submit" value="Đăng nhập" />
                            </div>
                        </form>

                        <div class="signed-up-now">
                            <span>
                                Chưa có tài khoản?
                                <a href="" class="signup-link">Đăng ký ngay</a>
                            </span>
                        </div>
                    </div>

                    <div class="form signup">
                        <div class="login-title">
                            <span class="title">Đăng ký</span>
                            <p class="desc">
                                Khám phá thư viện PTIT ngay hôm nay
                            </p>
                        </div>

                        <form
                            action="login"
                            method="POST"
                            style="position: relative"
                        >
                            <span
                                style="
                                    position: absolute;
                                    top: -24px;
                                    left: 0;
                                    font-size: 14px;
                                    color: var(--primary-color);
                                "
                                class="error_msg"
                            ></span>

                            <input
                                type="hidden"
                                name="action"
                                value="register"
                            />
                            <input type="hidden" name="done" value="register" />
                            <input
                                type="text"
                                name="username"
                                placeholder="Mã sinh viên"
                                class="idStudent type"
                                id="user_username"
                                required
                            />

                            <input
                                type="text"
                                name="email"
                                placeholder="Email học viện (@stu.ptit.edu.vn)"
                                class="emailStudent type"
                                id="user_email"
                                required
                            />
                            <input
                                type="password"
                                name="password"
                                class="password type"
                                placeholder="Mật khẩu"
                                id="user_password"
                                required
                            />

                            <div class="password-strength">
                                <div class="bar bar-1"></div>
                                <div class="bar bar-2"></div>
                                <div class="bar bar-3"></div>
                            </div>

                            <input
                                type="password"
                                name="retypePassword"
                                class="retypePassword type"
                                placeholder="Xác nhận mật khẩu"
                                id="user_retype_password"
                                required
                            />

                            <div class="signup-btn">
                                <input type="submit" value="Đăng ký" />
                            </div>
                        </form>

                        <div class="login-now">
                            <span>
                                Bạn đã có tài khoản?
                                <a href="" class="login-link">Đăng nhập</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section2">
                <img class="illus" src="./assets/img/website.png" alt="" />
                <img class="round" src="./assets/img/round.svg" alt="" />
            </div>
        </div>
        <script src="./assets/js/jquery3.6.0.js"></script>

        <script>
            const login = document.querySelector(".login-link");
            const signup = document.querySelector(".signup-link");
            const loginForm = document.querySelector(".login");
            const signupForm = document.querySelector(".signup");

            login.addEventListener("click", (e) => {
                console.log("Cliked");
                e.preventDefault();
                loginForm.style.display = "block";
                signupForm.style.display = "none";
            });

            signup.addEventListener("click", (e) => {
                e.preventDefault();
                console.log("Cliked");
                loginForm.style.display = "none";
                signupForm.style.display = "block";
            });

            let typingTimer;
            const doneTypingInterval = 2000; // 300ms
            const inputFields = document.querySelectorAll(
                "#user_username, #user_email, #user_password, #user_retype_password"
            );

            // Hàm gửi dữ liệu lên servlet
            var signupMessageResponse;
            function sendData() {
                const user_username = document.getElementById("user_username");
                const user_email = document.getElementById("user_email");
                const user_password = document.getElementById("user_password");
                const user_retype_password = document.getElementById(
                    "user_retype_password"
                );
                const username = user_username.value;
                const email = user_email.value;
                const password = user_password.value;
                const retypePassword = user_retype_password.value;

                // Tạo đối tượng FormData chứa thông tin cần gửi
                const formData = new FormData();
                formData.append("username", username);
                formData.append("email", email);
                formData.append("password", password);
                formData.append("retypePassword", retypePassword);
                formData.append("action", "register");

                // Gửi dữ liệu đến servlet bằng fetch
                console.log("Gửi dữ liệu");
                $.ajax({
                    url: "./user",
                    type: "POST",
                    data: {
                        username: username,
                        email: email,
                        password: password,
                        retypePassword: retypePassword,
                        action: "register",
                    },
                    dataType: "json",

                    success: function (data) {
                        signupMessageResponse = data;
                        console.log(signupMessageResponse);
                        // user_username.setCustomValidity(
                        //     signupFormElement.usernameMessage
                        // );

                        if (
                            (signupMessageResponse.usernameMessage ===
                                "valid" &&
                                signupMessageResponse.globalMessage ===
                                    "Tài khoản đã tồn tại") ||
                            (signupMessageResponse.usernameMessage ===
                                "valid" &&
                                signupMessageResponse.emailMessage ===
                                    "valid" &&
                                signupMessageResponse.globalMessage ===
                                    "Mã Sinh Viên và Email không khớp")
                        ) {
                            document.querySelector(".error_msg").innerHTML =
                                signupMessageResponse.globalMessage;
                            setupCustomValidity(user_email, "");
                            setupCustomValidity(user_username, "");
                            setupCustomValidity(user_password, "");
                            setupCustomValidity(user_retype_password, "");
                        } else {
                            document.querySelector(".error_msg").innerHTML = "";
                            setupCustomValidity(
                                user_username,
                                signupMessageResponse.usernameMessage
                            );

                            setupCustomValidity(
                                user_email,
                                signupMessageResponse.emailMessage
                            );

                            // const formIsValid = document
                            //     .querySelector(".signup form")
                            //     .checkValidity();

                            // if (!formIsValid) {
                            //     document
                            //         .querySelector(".signup form")
                            //         .reportValidity();
                            // }

                            document.querySelector(
                                ".password-strength"
                            ).style.display = "none";

                            var bar_1 = document.querySelector(
                                ".password-strength .bar-1"
                            );
                            var bar_2 = document.querySelector(
                                ".password-strength .bar-2"
                            );
                            var bar_3 = document.querySelector(
                                ".password-strength .bar-3"
                            );

                            bar_1.style.backgroundColor = "#ccc";
                            bar_2.style.backgroundColor = "#ccc";
                            bar_3.style.backgroundColor = "#ccc";

                            if (
                                signupMessageResponse.passwordMessage !==
                                    "Mật khẩu mạnh" &&
                                signupMessageResponse.passwordMessage !==
                                    "Mật khẩu trung bình" &&
                                signupMessageResponse.passwordMessage !==
                                    "Mật khẩu yếu"
                            ) {
                                console.log("set up");
                                setupCustomValidity(
                                    user_password,
                                    signupMessageResponse.passwordMessage
                                );
                                setupCustomValidity(user_retype_password, "");
                            } else {
                                setupCustomValidity(user_password, "");
                                setupCustomValidity(
                                    user_retype_password,
                                    signupMessageResponse.retypePasswordMessage
                                );

                                document.querySelector(
                                    ".password-strength"
                                ).style.display = "flex";

                                if (
                                    signupMessageResponse.passwordMessage ===
                                    "Mật khẩu mạnh"
                                ) {
                                    bar_1.style.backgroundColor = "#92d050";
                                    bar_2.style.backgroundColor = "#92d050";
                                    bar_3.style.backgroundColor = "#92d050";
                                } else if (
                                    signupMessageResponse.passwordMessage ===
                                    "Mật khẩu trung bình"
                                ) {
                                    bar_1.style.backgroundColor = "#f2aa84";
                                    bar_2.style.backgroundColor = "#f2aa84";
                                } else {
                                    bar_1.style.backgroundColor = "#ed1c24";
                                }
                            }
                        }
                    },
                    error: function () {
                        console.log("Có lỗi xảy ra");
                    },
                });
            }

            function setupCustomValidity(element, message) {
                if (element.value.trim() === "") return;
                if (message !== "valid") {
                    element.setCustomValidity(message); // Thiết lập thông báo lỗi
                    element.reportValidity(); // Gọi reportValidity để hiển thị thông báo ngay
                } else {
                    element.setCustomValidity(""); // Xóa lỗi
                    //element.reportValidity();
                }
            }

            // Hàm để reset timer khi người dùng dừng nhập
            inputFields.forEach((input) => {
                input.addEventListener("input", () => {
                    console.log("Nhập");
                    if (signupForm.style.display !== "none") {
                        clearTimeout(typingTimer); // Xóa timer cũ
                        typingTimer = setTimeout(sendData, doneTypingInterval); // Tạo timer mới
                        console.log("Tạo Timer");
                    }
                });
            });

            const signupFormElement = document.querySelector(".signup form");
            signupFormElement.addEventListener("submit", (event) => {
                if (signupMessageResponse.valid === false) {
                    console.log("Ngăn chặn hành động đăng ký");
                    event.preventDefault(); // Ngăn chặn form gửi nếu dữ liệu không hợp lệ
                }
            });
        </script>
    </body>
</html>
