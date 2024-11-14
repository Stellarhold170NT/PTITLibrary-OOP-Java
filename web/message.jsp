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
            .chat_area {
                display: flex;
                width: 100%;
                margin: 0 128px;
                gap: 64px;
                margin-bottom: 64px;
            }
            .chat_box,
            .chat_bar {
                min-height: calc(100vh - 148px);
            }

            .chat_bar {
                width: 35%;
            }
            .chat_box {
                height: 100%;
                width: 65%;
            }

            .message_btn {
                margin-left: 14px;
            }

            .message_btn ul {
                display: flex;
                gap: 16px;
            }

            .message_btn li {
                display: flex;
                flex-direction: column;
                align-items: center;
                cursor: pointer;
            }

            .message_btn li img {
                height: 44px;
                width: 44px;
            }

            .message_btn li span {
                font-size: 1.6rem;
                margin-top: 3px;
                padding: 4px 12px;
            }

            .message_btn li span.focus {
                /* font-weight: 700; */
                color: white;
                background-color: var(--primary-color);
            }

            .message_util {
                margin-top: 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .message_util img {
                height: 24px;
            }

            .new_message {
                display: flex;
                align-items: center;
                gap: 8px;
                cursor: pointer;
            }

            .new_message span {
                font-size: 1.6rem;
            }

            .search_message {
                cursor: pointer;
            }

            .avatar {
                width: 64px;
                height: 64px;
                background-color: #ccc;
                background-image: url("./assets/img/avatar.jpg");
                background-size: cover;
                background-position: center;
                border-radius: 50%;
                background-repeat: no-repeat;
                /* transition: opacity 0.5s ease; */
                opacity: 1;
            }
            .list_friend_message {
                margin-top: 12px;
                border: 2px #f2f2f2 solid;
                height: 412px;
                overflow-y: auto;
            }

            .list_friend_message ul {
                display: flex;
                flex-direction: column;
            }
            .list_friend_message li {
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 8px 12px;
                cursor: pointer;
            }

            .list_friend_message li:not(:nth-child(5)) {
                border-bottom: 2px #f2f2f2 solid;
            }

            .message_content {
                display: flex;
                flex-direction: column;
                gap: 10px;
                flex-grow: 1;
                max-width: calc(100% - 76px);
            }

            .message_content img {
                max-width: 50%;
            }

            .message_row1 {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .fullname {
                font-size: 1.6rem;
                font-weight: 700;
            }

            .message_sent_date {
                font-size: 1.2rem;
            }

            .list_friend_message .text_message {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                font-size: 1.6rem;
                max-width: 100%;
                padding: 2px 0;
            }

            .text_message.focus {
                font-weight: 700;
            }

            .chat_container {
                width: 100%;
                min-height: 658px;
                border: 2px #f2f2f2 solid;
            }

            .message_header {
                padding: 0 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                height: 48px;
                background-color: var(--primary-color);
            }

            .message_header .info {
                color: white;
                font-size: 1.6rem;
            }

            .message_header .info i {
                font-weight: 700;
            }

            .message_controller {
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .main_chat {
                height: 530px;
                overflow-y: auto;
            }

            .main_chat ul {
                margin-top: 12px;
                display: flex;
                flex-direction: column;
            }

            .main_chat ul li {
                display: flex;
                gap: 12px;
                align-items: flex-start;
                padding: 8px 0;
                padding-bottom: 24px;
                margin: 0 20px;
            }

            .main_chat .text_message {
                font-size: 1.6rem;
                max-width: 100%;
                padding: 2px 0;
                line-height: 1.4;
            }

            .main_chat .message_row1 {
                margin-top: 10px;
            }

            .main_chat li {
                border-bottom: 2px #f2f2f2 solid;
            }

            .compose_messsage {
                padding: 12px 20px;
                display: flex;
                gap: 8px;
                width: 100%;
                max-width: 100%;
            }

            .compose_messsage img {
                margin-top: 10px;
                height: 44px;
            }

            .text-input {
                margin-top: 8px;
                resize: vertical;
                flex-grow: 1;
                max-width: 100%;
                border: 1px #f2f2f2 solid;
                padding: 8px 12px;
                font-size: 1.6rem;
                font-family: "Arial";
                height: 48px;
            }

            .text-input:focus {
                /* outline: 1px #ccc solid; */
            }

            .msg_image {
                margin-left: 92px;
                padding-top: 12px;
            }

            .msg_image ul {
                display: flex;
                gap: 16px;
            }

            .msg_image li {
                position: relative;
            }

            .msg_image img:first-child {
                height: 32px;
            }

            .delete_img {
                position: absolute;
                right: -8px;
                top: -8px;
                width: 18px;
                height: 18px;
            }

            .preview-container {
                margin-left: 92px;
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .preview-wrapper {
                margin-top: 10px;
                position: relative;
                display: inline-block;
            }

            .preview-image {
                max-width: 80px;
                max-height: 80px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .remove-image-btn {
                position: absolute;
                top: -5px;
                right: -5px;
                background-color: red;
                color: white;
                border: none;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                font-size: 14px;
                cursor: pointer;
            }

            .search_member {
                margin-left: 92px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .search_member span {
                font-size: 1.6rem;
            }

            .search_member_btn {
                position: relative;
            }

            .search_member_btn input {
                padding-left: 28px;
                height: 28px;
                font-size: 1.4rem;
            }
            .search_member_btn img {
                position: absolute;
                left: 4px;
                top: 50%;
                transform: translateY(-50%);
            }
        </style>
    </head>
    <body>
        <!-- <%@ include file="header.jsp"%> -->
        <jsp:include page="header.jsp" />

        <div class="header">
            <div class="main-content">
                <div class="body">
                    <div class="chat_area">
                        <div class="chat_bar">
                            <div class="message_btn">
                                <ul>
                                    <li class="inbox_btn">
                                        <img
                                            src="./assets/img/inbox-icon-red.svg"
                                            alt=""
                                        /><span class="focus">Inbox</span>
                                    </li>
                                    <li class="unread_btn">
                                        <img
                                            src="./assets/img/unread-icon-black.svg"
                                            alt=""
                                        />
                                        <span>Unread</span>
                                    </li>
                                </ul>
                            </div>

                            <div class="message_util">
                                <div class="new_message">
                                    <img
                                        src="./assets/img/plus-icon.svg"
                                        alt=""
                                    />
                                    <span>New message</span>
                                </div>
                                <div class="search_message">
                                    <img
                                        src="./assets/img/search-message-icon.svg"
                                        alt=""
                                    />
                                </div>
                            </div>

                            <div class="list_friend_message">
                                <ul></ul>
                            </div>
                        </div>
                        <div class="chat_box">
                            <div class="chat_container">
                                <div class="message_header">
                                    <span class="info"
                                        >Nhắn tin tới
                                        <i>Nguyễn Việt Huy</i></span
                                    >
                                    <div class="message_controller">
                                        <img
                                            src="./assets/img/add-friend-icon.svg"
                                            alt=""
                                        />
                                        <img
                                            src="./assets/img/block-icon.svg"
                                            alt=""
                                        />
                                        <img
                                            class="add-image-btn"
                                            src="./assets/img/erase-icon.svg"
                                            alt=""
                                        />
                                    </div>
                                </div>
                                <div class="main_chat">
                                    <ul>
                                        <li>
                                            <div class="avatar"></div>
                                            <div class="message_content">
                                                <div class="message_row1">
                                                    <span class="fullname"
                                                        >Nguyễn Việt Huy</span
                                                    >
                                                    <span
                                                        class="message_sent_date"
                                                        >Nov 18, 2024</span
                                                    >
                                                </div>
                                                <span class="text_message">
                                                    Hey there! Just a little
                                                    reminder that today is a
                                                    perfect day to embrace new
                                                    challenges and let your
                                                    creativity shine. Whether
                                                    it's trying a new recipe,
                                                    learning a fun fact, or
                                                    simply taking a moment to
                                                    appreciate the little
                                                    things, make the most of it!
                                                    😊
                                                </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div
                                    class="search_member"
                                    style="display: none"
                                >
                                    <span>Gửi đến: </span>
                                    <div class="search_member_btn">
                                        <input type="text" id="searchInput" />
                                        <img
                                            src="./assets/img/search-message-icon.svg"
                                            alt=""
                                        />
                                    </div>
                                </div>
                                <div
                                    class="preview-container"
                                    id="preview-container"
                                ></div>
                                <div class="compose_messsage">
                                    <div class="avatar"></div>
                                    <textarea
                                        class="text-input"
                                        id="messageInput"
                                        placeholder="Viết tin nhắn của bạn..."
                                        onkeydown="sendOnEnter(event)"
                                    ></textarea>
                                    <img
                                        src="./assets/img/img-icon.svg"
                                        alt=""
                                        onclick="document.getElementById('file-input').click()"
                                    />
                                    <input
                                        type="file"
                                        id="file-input"
                                        style="display: none"
                                        accept="image/*"
                                        multiple
                                        onchange="previewImages(event)"
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% String username = (String) session.getAttribute("username"); if
        (username == null) username = ""; %>

        <jsp:include page="footer.jsp" />
        <script src="./assets/js/jquery3.6.0.js"></script>
        <script>
            var sender = "<%=username%>";
            console.log("SENDER = " + sender);

            const ws = new WebSocket(
                `wss://f5ed-2001-ee0-47cd-56d0-a869-9328-3a0b-fcec.ngrok-free.app /PTITLibrary/chat?username=${username}`
            );

            function previewImages(event) {
                console.log("HERE");
                const files = event.target.files;
                const previewContainer =
                    document.getElementById("preview-container");

                for (let i = 0; i < files.length; i++) {
                    const file = files[i];
                    const imageUrl = URL.createObjectURL(file);

                    // Tạo wrapper chứa ảnh và nút xóa
                    const previewWrapper = document.createElement("div");
                    previewWrapper.className = "preview-wrapper";

                    // Tạo thẻ img để hiển thị ảnh
                    const imgElement = document.createElement("img");
                    imgElement.src = imageUrl;
                    imgElement.className = "preview-image";
                    previewWrapper.appendChild(imgElement);

                    // Tạo nút xóa
                    const removeButton = document.createElement("button");
                    removeButton.className = "remove-image-btn";
                    removeButton.innerHTML = "×";
                    removeButton.onclick = () => {
                        previewWrapper.remove();
                    };
                    previewWrapper.appendChild(removeButton);

                    // Thêm wrapper vào preview container
                    previewContainer.appendChild(previewWrapper);
                }
            }

            var new_message = document.querySelector(".new_message");
            new_message.addEventListener("click", function () {
                new_msg();
            });
            new_msg();
            function new_msg() {
                var search_member = document.querySelector(".search_member");
                search_member.style.display = "flex";

                var info = document.querySelector(".chat_box .info");
                var main_chat = document.querySelector(".main_chat");
                var message_controller = document.querySelector(
                    ".message_controller"
                );

                main_chat.innerHTML = "";
                info.innerHTML = "Tạo tin nhắn mới";
                message_controller.innerHTML = "";

                // Change data-set
                var messageInput = document.getElementById("messageInput");
                messageInput.setAttribute("data-type", "1");

                //change avatar

                $.ajax({
                    url: "./message",
                    type: "GET",
                    dataType: "json",
                    data: {
                        username: sender,
                        action: "get_user",
                    },
                    success: function (data) {
                        var avt = document.querySelector(
                            ".compose_messsage .avatar"
                        );
                        var avatarURL = data.avatar;
                        console.log("INIT AVATAR = " + avatarURL);
                        avt.style.backgroundImage = `url(` + avatarURL + `)`;
                        console.log(
                            "AVATAR INIT TO : " + avt.style.backgroundImage
                        );
                    },
                });
            }

            function sendOnEnter(event) {
                if (event.key === "Enter") {
                    if (event.shiftKey) {
                        return;
                    } else {
                        event.preventDefault(); // Ngăn xuống dòng mới
                        const messageInput =
                            document.getElementById("messageInput");

                        console.log(
                            "TYPE MESSAGE = " + messageInput.dataset.type
                        );
                        if (messageInput.dataset.type == 1) {
                            var text_message = messageInput.value.trim();

                            var receiver =
                                document.getElementById("searchInput");
                            var text_receiver = receiver.value.trim();
                            if (text_message && text_receiver) {
                                console.log("START SEND");
                                sendMessageToDataBase(
                                    text_message,
                                    text_receiver
                                );
                                displayChatMessages(sender, text_receiver);
                            } else {
                                console.log("FAILED");
                            }
                        } else if (messageInput.dataset.type == 2) {
                            var message_header =
                                document.querySelector(".message_header");
                            var text_receiver = message_header.dataset.username;
                            var text_message = messageInput.value.trim();
                            console.log(
                                "MESSAGE HEADER USERNAME = " + text_receiver
                            );

                            if (text_message && text_receiver) {
                                sendMessageToDataBase(
                                    text_message,
                                    text_receiver
                                );
                            }
                        }
                    }
                }
            }

            function sendMessageToDataBase(message, receiver) {
                console.log("Message sent:", message); // Xử lý tin nhắn gửi đi
                const files = document.getElementById("file-input").files;
                const formData = new FormData();
                for (let i = 0; i < files.length; i++) {
                    formData.append("images", files[i]); // "images" là tên parameter cho backend
                }

                formData.append("action", "upload_img_message");
                formData.append("username", sender);
                $.ajax({
                    url: "./message",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        console.log("RESPONSE = " + response);
                        // response.forEach((link) => {
                        //     url.add(link);
                        // });
                        // console.log("LINK: " + link);
                        // console.log("URL: " + JSON.stringify(url));
                        url = [];
                        const urls = response;

                        // Thêm từng URL vào mảng url
                        urls.forEach((link) => {
                            url.push(link); // Thêm link vào mảng url
                        });

                        const messageData = {
                            sender: sender,
                            receiver: receiver,
                            message: message,
                            url: url,
                        };

                        console.log("RECEIVER = " + receiver);

                        ws.send(JSON.stringify(messageData));
                        const previewContainer =
                            document.getElementById("preview-container");
                        previewContainer.innerHTML = ""; // Xóa tất cả các phần tử con trong preview container

                        receiver.value = "";
                        messageInput.value = ""; // Xóa nội dung sau khi gửi
                    },
                });
            }

            ws.onmessage = function (event) {
                var message_header = document.querySelector(".message_header");
                var receiver_header = message_header.dataset.username;

                const data = event.data;
                console.log("Dữ liệu nhận được:", event.data);
                try {
                    const message = JSON.parse(data);
                    console.log(message.senderID + ": " + message.content);

                    if (
                        (message.senderID == sender &&
                            message.receiverID == receiver_header) ||
                        (message.senderID == receiver_header &&
                            message.receiverID == sender)
                    ) {
                        let userSenderPromise = $.ajax({
                            url: "./message",
                            type: "GET",
                            dataType: "json",
                            data: {
                                username: sender,
                                action: "get_user",
                            },
                        });

                        let userDataPromise = $.ajax({
                            url: "./message",
                            type: "GET",
                            dataType: "json",
                            data: {
                                username: receiver_header,
                                action: "get_user",
                            },
                        });

                        console.log("Lấy DATA User xong");

                        $.when(userSenderPromise, userDataPromise).done(
                            function (userSenderData, userDataData) {
                                console.log("Tin nhắn bắt đầu được đẩy lên");
                                // Lấy dữ liệu từ các đối số trả về
                                let userSender = userSenderData[0]; // userSenderData là một mảng, phần tử đầu tiên chứa dữ liệu
                                let userData = userDataData[0]; // userDataData cũng vậy
                                var user_msg;
                                console.log("MESSAGE" + message);
                                if (message.senderID == sender) {
                                    user_msg = userSender;
                                } else {
                                    user_msg = userData;
                                }

                                console.log(
                                    "Tin nhắn người gửi là: " +
                                        message.senderID +
                                        "|" +
                                        JSON.stringify(user_msg)
                                );

                                console.log(JSON.stringify(user_msg));
                                var time = message.timestamp.split(",");
                                var avatarURL = user_msg.avatar;

                                var ul_list =
                                    document.querySelector(".main_chat ul");
                                /*ul_list.insertAdjacentHTML(
                                    "beforeend",
                                    `
                        <li>
                                                <div class="avatar" style="background-image: url(` +
                                        avatarURL +
                                        `);"></div>
                                                <div class="message_content">
                                                    <div class="message_row1">
                                                        <span class="fullname"
                                                            > ` +
                                        user_msg.name +
                                        `</span
                                                        >
                                                        <span
                                                            class="message_sent_date"
                                                            >` +
                                        time[0] +
                                        ",  " +
                                        time[1] +
                                        `</span
                                                        >
                                                    </div>
                                                    <span class="text_message">
                                                       ` +
                                        escape(
                                            JSON.parse(message.content).message
                                        ).replace(/\n/g, "<br>") +
                                        `
                                                    </span>
                                                </div>
                                            </li>
                        `
                                );*/
                                var messageData = JSON.parse(message.content); // 'data' là dữ liệu nhận được
                                var images = messageData.url; // Lấy danh sách URL của các ảnh
                                var msg = escape(messageData.message).replace(
                                    /\n/g,
                                    "<br>"
                                ); // Nội dung tin nhắn

                                // Tạo HTML cho tin nhắn
                                var messageHTML =
                                    `
    <li>
        <div class="avatar" style="background-image: url(` +
                                    avatarURL +
                                    `);"></div>
        <div class="message_content">
            <div class="message_row1">
                <span class="fullname">` +
                                    user_msg.name +
                                    `</span>
                <span class="message_sent_date">` +
                                    time[0] +
                                    ",  " +
                                    time[1] +
                                    `</span>
            </div>
            <span class="text_message">` +
                                    msg +
                                    `</span>
            `;

                                // Thêm từng ảnh vào HTML
                                images.forEach((url) => {
                                    if (url != "")
                                        messageHTML +=
                                            `<img src=` +
                                            url +
                                            ` alt="Image" class="chat-image">`;
                                });

                                messageHTML += `
            
        </div>
    </li>
`;

                                // Thêm tin nhắn vào danh sách
                                ul_list.insertAdjacentHTML(
                                    "beforeend",
                                    messageHTML
                                );

                                var main_chat =
                                    document.querySelector(".main_chat");
                                main_chat.scrollTop = main_chat.scrollHeight;
                            }
                        );
                    }
                } catch (e) {
                    console.error("Không thể parse dữ liệu JSON:", e);
                }
            };

            var inbox_btn = document.querySelector(".inbox_btn");
            var unread_btn = document.querySelector(".unread_btn");

            inbox_btn.addEventListener("click", function () {
                var img = unread_btn.querySelector("img");
                img.src = "./assets/img/unread-icon-black.svg";
                var span_element = unread_btn.querySelector("span");
                span_element.classList.remove("focus");

                var img2 = inbox_btn.querySelector("img");
                img2.src = "./assets/img/inbox-icon-red.svg";
                var span_element2 = inbox_btn.querySelector("span");
                span_element2.classList.add("focus");
                new_msg();
                loadInbox();
            });

            loadInbox();

            function loadInbox() {
                let ajax_main_call = $.ajax({
                    url: "./message",
                    type: "GET",
                    dataType: "json",
                    data: {
                        username: sender,
                        action: "inbox",
                    },

                    success: function (data) {
                        console.log(data);
                        var list_result = document.querySelector(
                            ".list_friend_message ul"
                        );
                        list_result.innerHTML = "";
                        data.forEach((user) => {
                            var userData;
                            var ds;
                            if (user.type === 1) {
                                ds = user.senderID;
                            } else ds = user.receiverID;
                            console.log("DS = " + ds);
                            $.ajax({
                                url: "./message",
                                type: "GET",
                                dataType: "json",
                                data: {
                                    username: ds,
                                    action: "get_user",
                                },
                                success: function (data) {
                                    console.log("OK GOT IT");
                                    userData = data;
                                    console.log(userData);

                                    var time = user.timestamp.split(",");
                                    var avatarURL = userData.avatar;
                                    console.log("===>" + avatarURL);

                                    // list_result.insertAdjacentHTML(
                                    //     "beforeend",
                                    //     ""
                                    // );

                                    var newLiItem =
                                        document.createElement("li");
                                    newLiItem.setAttribute(
                                        "data-username",
                                        user.type == 1
                                            ? user.senderID
                                            : user.receiverID
                                    );
                                    newLiItem.innerHTML =
                                        `<div class="avatar" style="background-image: url(` +
                                        avatarURL +
                                        `);"></div>

                                            <div class="message_content">
                                                <div class="message_row1">
                                                    <span class="fullname"
                                                        >` +
                                        userData.name +
                                        `</span
                                                    >
                                                    <span class="message_sent_date"
                                                        >` +
                                        time[0] +
                                        ",  " +
                                        time[1] +
                                        `</span
                                                    >
                                                </div>
                                                <span class="text_message"
                                                    >` +
                                        (user.type == 2 ? "Bạn: " : "") +
                                        escape(
                                            JSON.parse(user.content).message
                                        ) +
                                        `</span
                                                >
                                            </div>

                                    `;

                                    list_result.appendChild(newLiItem);
                                    add_event_for(newLiItem);
                                },
                            });
                        });
                    },
                });
            }

            var previousLiItem;

            function add_event_for(newLiItem) {
                newLiItem.addEventListener("click", function () {
                    if (previousLiItem)
                        previousLiItem.style.borderLeft = "none";
                    previousLiItem = newLiItem;
                    newLiItem.style.borderLeft =
                        "2px var(--primary-color) solid";
                    var messageInput = document.getElementById("messageInput");
                    messageInput.setAttribute("data-type", "2");

                    const username = newLiItem.getAttribute("data-username");
                    displayChatMessages(sender, username);
                });
            }

            function displayChatMessages(sender, username) {
                $.ajax({
                    url: "./message",
                    type: "GET",
                    dataType: "json",
                    data: {
                        username1: sender,
                        username2: username,
                        action: "load_message",
                    },
                    success: function (data) {
                        console.log(
                            "LOAD MESSAGE BETWEEN = " +
                                sender +
                                " -> " +
                                username
                        );
                        console.log("LOAD MESSAGE = " + JSON.stringify(data));

                        var search_member =
                            document.querySelector(".search_member");
                        search_member.style.display = "none";
                        var userSender;
                        var userData;
                        let userSenderPromise = $.ajax({
                            url: "./message",
                            type: "GET",
                            dataType: "json",
                            data: {
                                username: sender,
                                action: "get_user",
                            },
                        });

                        let userDataPromise = $.ajax({
                            url: "./message",
                            type: "GET",
                            dataType: "json",
                            data: {
                                username: username,
                                action: "get_user",
                            },
                        });

                        $.when(userSenderPromise, userDataPromise).done(
                            function (userSenderData, userDataData) {
                                // Lấy dữ liệu từ các đối số trả về
                                let userSender = userSenderData[0]; // userSenderData là một mảng, phần tử đầu tiên chứa dữ liệu
                                let userData = userDataData[0]; // userDataData cũng vậy

                                // display Header

                                var message_header =
                                    document.querySelector(".message_header");
                                message_header.innerHTML = ``;
                                message_header.setAttribute(
                                    "data-username",
                                    username
                                );
                                message_header.insertAdjacentHTML(
                                    "beforeend",
                                    `
                <span class="info"
                                        >Nhắn tin tới
                                        <i>` +
                                        userData.name +
                                        `</i></span
                                    >
                                    <div class="message_controller">
                                        <img
                                            src="./assets/img/add-friend-icon.svg"
                                            alt=""
                                        />
                                        <img
                                            src="./assets/img/block-icon.svg"
                                            alt=""
                                        />
                                        <img
                                            class="add-image-btn"
                                            src="./assets/img/erase-icon.svg"
                                            alt=""
                                        />
                                    </div>
                `
                                );

                                // display main chat

                                console.log(JSON.stringify(userData));

                                var main_chat =
                                    document.querySelector(".main_chat");
                                main_chat.setAttribute(
                                    "data-username",
                                    username
                                );
                                main_chat.innerHTML = "";
                                var ul = document.createElement("ul");

                                data.forEach((message) => {
                                    var user_msg;
                                    if (message.senderID == sender) {
                                        user_msg = userSender;
                                    } else {
                                        user_msg = userData;
                                    }

                                    console.log(
                                        "Tin nhắn người gửi là: " +
                                            message.senderID +
                                            "|" +
                                            JSON.stringify(user_msg)
                                    );

                                    console.log(JSON.stringify(user_msg));
                                    var time = message.timestamp.split(",");
                                    var avatarURL = user_msg.avatar;

                                    /*ul.insertAdjacentHTML(
                                        "beforeend",
                                        `
                        <li>
                                                <div class="avatar" style="background-image: url(` +
                                            avatarURL +
                                            `);"></div>
                                                <div class="message_content">
                                                    <div class="message_row1">
                                                        <span class="fullname"
                                                            > ` +
                                            user_msg.name +
                                            `</span
                                                        >
                                                        <span
                                                            class="message_sent_date"
                                                            >` +
                                            time[0] +
                                            ",  " +
                                            time[1] +
                                            `</span
                                                        >
                                                    </div>
                                                    <span class="text_message">
                                                       ` +
                                            escape(
                                                JSON.parse(message.content)
                                                    .message
                                            ).replace(/\n/g, "<br>") +
                                            `
                                                    </span>
                                                </div>
                                            </li>
                        `
                                    );*/
                                    var messageData = JSON.parse(
                                        message.content
                                    ); // 'data' là dữ liệu nhận được
                                    var images = messageData.url; // Lấy danh sách URL của các ảnh
                                    var msg = escape(
                                        messageData.message
                                    ).replace(/\n/g, "<br>"); // Nội dung tin nhắn

                                    // Tạo HTML cho tin nhắn
                                    var messageHTML =
                                        `
    <li>
        <div class="avatar" style="background-image: url(` +
                                        avatarURL +
                                        `);"></div>
        <div class="message_content">
            <div class="message_row1">
                <span class="fullname">` +
                                        user_msg.name +
                                        `</span>
                <span class="message_sent_date">` +
                                        time[0] +
                                        ",  " +
                                        time[1] +
                                        `</span>
            </div>
            <span class="text_message">` +
                                        msg +
                                        `</span>
            `;

                                    // Thêm từng ảnh vào HTML
                                    images.forEach((url) => {
                                        if (url != "")
                                            messageHTML +=
                                                `<img src=` +
                                                url +
                                                ` alt="Image" class="chat-image">`;
                                    });

                                    messageHTML += `
            
        </div>
    </li>
`;

                                    // Thêm tin nhắn vào danh sách
                                    ul.insertAdjacentHTML(
                                        "beforeend",
                                        messageHTML
                                    );
                                });

                                main_chat.append(ul);
                                main_chat.scrollTop = main_chat.scrollHeight;
                            }
                        );
                    },
                });
            }

            unread_btn.addEventListener("click", function () {
                var img = unread_btn.querySelector("img");
                img.src = "./assets/img/unread-icon-red.svg";
                var span_element = unread_btn.querySelector("span");
                span_element.classList.add("focus");

                var img2 = inbox_btn.querySelector("img");
                img2.src = "./assets/img/inbox-icon-black.svg";
                var span_element2 = inbox_btn.querySelector("span");
                span_element2.classList.remove("focus");
                new_msg();
                $.ajax({
                    url: "./message",
                    type: "GET",
                    dataType: "json",
                    data: {
                        username: sender,
                        action: "unread",
                    },

                    success: function (data) {
                        console.log(data);
                        var list_result = document.querySelector(
                            ".list_friend_message ul"
                        );
                        list_result.innerHTML = "";
                        data.forEach((user) => {
                            var userData;
                            var ds = user.senderID;

                            console.log("DS = " + ds);
                            $.ajax({
                                url: "./message",
                                type: "GET",
                                dataType: "json",
                                data: {
                                    username: ds,
                                    action: "get_user",
                                },
                                success: function (data) {
                                    console.log("OK GOT IT");
                                    userData = data;
                                    console.log(userData);

                                    var time = user.timestamp.split(",");
                                    console.log(userData.avatar);
                                    var avatarURL = userData.avatar;
                                    /*list_result.insertAdjacentHTML(
                                        "beforeend",
                                        `
                                    <li ` +
                                            "data-username =" +
                                            `"` +
                                            user.senderID +
                                            `"` +
                                            `>
                                            <div class="avatar" style="background-image: url(` +
                                            avatarURL +
                                            `);"></div>
                                            <div class="message_content">
                                                <div class="message_row1">
                                                    <span class="fullname"
                                                        >` +
                                            userData.name +
                                            `</span
                                                    >
                                                    <span class="message_sent_date"
                                                        >` +
                                            time[0] +
                                            ",  " +
                                            time[1] +
                                            `</span
                                                    >
                                                </div>
                                                <span class="text_message"
                                                    >` +
                                            JSON.parse(user.content).message +
                                            `</span
                                                >
                                            </div>
                                        </li>
                                    `
                                    );*/

                                    var newLiItem =
                                        document.createElement("li");
                                    newLiItem.setAttribute(
                                        "data-username",
                                        user.senderID
                                    );
                                    newLiItem.innerHTML =
                                        `<div class="avatar" style="background-image: url(` +
                                        avatarURL +
                                        `);"></div>

                                            <div class="message_content">
                                                <div class="message_row1">
                                                    <span class="fullname"
                                                        >` +
                                        userData.name +
                                        `</span
                                                    >
                                                    <span class="message_sent_date"
                                                        >` +
                                        time[0] +
                                        ",  " +
                                        time[1] +
                                        `</span
                                                    >
                                                </div>
                                                <span class="text_message"
                                                    >` +
                                        escape(
                                            JSON.parse(user.content).message
                                        ).replace(/\n/g, "<br>") +
                                        `</span
                                                >
                                            </div>

                                    `;

                                    list_result.appendChild(newLiItem);
                                    add_event_for(newLiItem);
                                },
                            });
                        });
                    },
                });
            });

            function escape(s) {
                let lookup = {
                    "&": "&amp;",
                    '"': "&quot;",
                    "'": "&apos;",
                    "<": "&lt;",
                    ">": "&gt;",
                };
                return s.replace(/[&"'<>]/g, (c) => lookup[c]);
            }
        </script>
    </body>
</html>
