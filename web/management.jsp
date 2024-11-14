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
            .header .main-content {
                min-height: calc(100vh - 148px);
            }

            .header .body {
                margin-top: 56px;
            }
            .search-student-box {
                position: relative;
                margin-left: 0;
                margin-top: 24px;
                padding-left: 12px;
                border-radius: 8px;
                width: 60%;
                outline: 2px #bfbfbf solid;
            }

            .search-student-box .material-symbols-outlined {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                right: 0.4em;
            }

            .input_text {
                width: 100%;
                height: 48px;
                border-radius: 2px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 16px;
                outline: none;
                border: none;
            }

            .search-student-box span {
                cursor: pointer;
            }

            .box {
                width: 100%;
                display: flex;
            }

            .box-1 {
                display: flex;
                flex-direction: column;
                flex: 1;
                width: 100%;
            }

            .box-2 {
                flex: 1;
                width: 100%;
            }

            .box-1 .title {
                font-size: 2rem;
            }

            .box-1 .row {
                margin-top: 48px;
            }

            .box-1 .row span {
                font-size: 1.6rem;
            }

            .box-1 .row {
                display: flex;
                gap: 24px;
            }

            .box-1 .small-navi {
                position: relative;
                opacity: 0.6;
                cursor: pointer;
                text-align: center;
            }

            .box-1 .small-navi.focus {
                font-weight: 700;
                opacity: 1;
            }

            .box-1 .small-navi::after {
                content: "";
                position: absolute;
                top: 24px;
                left: 50%;
                transform: translateX(-50%);
                width: 48px;
                height: 3px;
                background-color: black;
            }

            .box-1 .small-navi.waiting::after {
                background-color: var(--primary-color);
            }

            .box-1 .small-navi.borrowed::after {
                background-color: #92d050;
            }

            .box-1 .small-navi.expired::after {
                background-color: #f2aa84;
            }

            /* Table CSS */
            table {
                margin-top: 48px;
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

            .btn_borrow,
            .btn_return {
                margin-left: auto;
                margin-right: auto;
                display: block;
                width: 128px;
                height: 32px;
                font-size: 16px;
                text-align: center;
                line-height: 32px;
                color: white;
                margin-top: 32px;
                background-color: var(--primary-color);
                cursor: pointer;
                margin-bottom: 80px;
            }

            .detail-title {
                font-size: 2rem;
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

            .detail .info {
                display: flex;
                gap: 12px;
                margin-top: 16px;
                align-self: center;
            }

            .detail .info div:last-child {
                display: flex;
                justify-content: center;
                gap: 8px;
                flex-direction: column;
            }

            .student_name {
                font-size: 1.6rem;
                font-weight: 700;
            }

            .student_id {
                font-size: 1.6rem;
            }

            .box-2 .detail {
                display: flex;
                align-items: flex-end;
                gap: 48px;
            }

            .chart {
                display: flex;
                align-items: flex-end;
                gap: 12px;
                height: 80px;
            }

            .col-1,
            .col-2,
            .col-3 {
                width: 20px;
                min-height: 8px;
                background-color: black;
                border-radius: 4px;
            }

            .col-1 {
                height: 80px;
                background-color: var(--primary-color);
            }

            .col-2 {
                height: 64px;
                background-color: #92d050;
            }

            .col-3 {
                height: 20px;
                background-color: #f2aa84;
            }

            .detail-statistic {
                display: flex;
                align-items: center;
                gap: 24px;
            }
            .infomation-chart {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .infomation-chart {
                font-size: 1.2rem;
                /* line-height: 1.2rem; */
            }

            .infomation-chart .info {
                padding-left: 16px;
                position: relative;
                margin-top: 0;
                align-self: normal;
            }

            .infomation-chart .info::before {
                content: "";
                position: absolute;
                width: 8px;
                height: 8px;
                background-color: black;
                top: 50%;
                transform: translateY(-50%);
                border-radius: 50%;
                left: 0px;
            }

            .infomation-chart .info-1::before {
                background-color: var(--primary-color);
            }

            .infomation-chart .info-2::before {
                background-color: #92d050;
            }

            .infomation-chart .info-3::before {
                background-color: #f2aa84;
            }

            .info i {
                margin-left: -8px;
                font-weight: 700;
            }

            .footer {
            }
        </style>
    </head>
    <body>
        <!-- <%@ include file="header.jsp"%> -->
        <jsp:include page="header.jsp" />

        <div class="header">
            <div class="main-content">
                <div class="body">
                    <div class="box">
                        <div class="box-1">
                            <span class="title"
                                >Quản lý mượn sách thư viện</span
                            >
                            <div class="search-student-box">
                                <input
                                    type="text"
                                    name="search_box"
                                    placeholder="Nhập thông tin sinh viên"
                                    class="input_text"
                                    required
                                />
                                <span
                                    class="material-symbols-outlined search-btn"
                                    style="font-size: 26px"
                                >
                                    search
                                </span>
                            </div>

                            <div class="row">
                                <span class="waiting small-navi focus"
                                    >Đang chờ</span
                                >
                                <span class="borrowed small-navi">Đã mượn</span>
                                <span class="expired small-navi">Quá hạn</span>
                                <span class="cancel small-navi"
                                    >Đăng ký bị hủy</span
                                >
                            </div>
                        </div>
                        <div class="box-2">
                            <span class="detail-title">Thông tin chi tiết</span>
                            <div class="detail">
                                <div class="info" style="display: none">
                                    <div class="avatar"></div>
                                    <div>
                                        <span class="student_name"></span>
                                        <span class="student_id"></span>
                                    </div>
                                </div>

                                <div
                                    class="detail-statistic"
                                    style="display: none"
                                >
                                    <div class="chart">
                                        <div class="col-1"></div>
                                        <div class="col-2"></div>
                                        <div class="col-3"></div>
                                    </div>

                                    <div class="infomation-chart">
                                        <span class="info-1 info"
                                            >Đang chờ: <i>07</i></span
                                        >
                                        <span class="info-2 info"
                                            >Đang mượn: <i>05</i></span
                                        >
                                        <span class="info-3 info"
                                            >Quá hạn: <i>03</i></span
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <table>
                        <tr>
                            <td></td>
                            <td>Mã mượn</td>
                            <td>Tên tài liệu</td>
                            <td>Tác giả</td>
                            <td>Năm xuất bản</td>
                            <td>Ngày đăng ký</td>
                            <td>Ngày hết hạn</td>
                            <td>Trạng thái</td>
                        </tr>
                    </table>

                    <span class="btn_borrow">Cho mượn</span>
                    <span class="btn_return" style="display: none"
                        >Trả sách</span
                    >
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />

        <% String username = (String) session.getAttribute("username"); if
        (username == null) username = ""; %>

        <script src="./assets/js/jquery3.6.0.js"></script>
        <script>
            var username_account = "<%=username%>";
            var search_btn = document.querySelector(".search-btn");
            var search_input = document.querySelector(".input_text");

            search_btn.addEventListener("click", function () {
                var inputValue = search_input.value;
                performSearch(inputValue, function () {
                    waitingFocus();
                });
            });

            search_input.addEventListener("keydown", function (event) {
                if (event.key === "Enter") {
                    var inputValue = search_input.value;
                    performSearch(inputValue, function () {
                        waitingFocus();
                    });
                }
            });

            performSearch(username_account, function () {
                waitingFocus();
            });

            var dataRecord = null;

            function performSearch(inputValue, callback) {
                $.ajax({
                    url: "./record",
                    type: "GET",
                    dataType: "json",
                    data: {
                        username: inputValue,
                    },
                    success: function (data) {
                        dataRecord = data;
                        console.log("LOAD Ở ĐÂY");
                        // loadRecordList("Đang chờ");
                        callback();

                        console.log("input = " + inputValue);
                        console.log(data);
                        var detail_info =
                            document.querySelector(".detail .info");
                        var detail_student_name =
                            document.querySelector(".student_name");
                        var detail_student_id =
                            document.querySelector(".student_id");
                        var detail_avatar =
                            document.querySelector(".detail .avatar");

                        detail_student_name.innerHTML = data[0].name
                            ? data[0].name
                            : data[0].student_name;

                        detail_student_id.innerHTML = data[0].username
                            ? data[0].username
                            : data[0].student_id;
                        detail_avatar.style.backgroundImage =
                            "url + (" + data.avatar + ")";
                        detail_info.style.display = "flex";

                        /* Chart */

                        var num1 = 0;
                        var num2 = 0;
                        var num3 = 0;

                        data.forEach((record) => {
                            if (record.status == "Đang chờ") num1 += 1;
                            if (record.status == "Đang mượn") num2 += 1;
                            if (record.status == "Quá hạn") num3 += 1;
                        });

                        console.log(num1 + " " + num2 + " " + num3);

                        var col_1 = document.querySelector(".col-1");
                        var col_2 = document.querySelector(".col-2");
                        var col_3 = document.querySelector(".col-3");

                        const maxNum = Math.max(num1, num2, num3, 1);

                        console.log("maxNum " + maxNum);

                        col_1.style.height = (num1 / maxNum) * 80 + "px";
                        col_2.style.height = (num2 / maxNum) * 80 + "px";
                        col_3.style.height = (num3 / maxNum) * 80 + "px";

                        var info_1 = document.querySelector(".info-1 i");
                        var info_2 = document.querySelector(".info-2 i");
                        var info_3 = document.querySelector(".info-3 i");

                        info_1.innerHTML = num1;
                        info_2.innerHTML = num2;
                        info_3.innerHTML = num3;

                        var detail_statistic =
                            document.querySelector(".detail-statistic");
                        detail_statistic.style.display = "flex";
                        return true;
                    },
                });
            }
            var list_navi = document.querySelectorAll(".small-navi");
            function clearFocus() {
                var btn_record = document.querySelector(".btn_borrow");
                btn_record.style.display = "none";

                var btn_return = document.querySelector(".btn_return");
                btn_return.style.display = "none";

                list_navi.forEach((navi) => {
                    navi.classList.remove("focus");
                });
            }

            var waiting = document.querySelector(".waiting");
            waiting.addEventListener("click", function () {
                waitingFocus();
            });

            function waitingFocus() {
                clearFocus();
                var btn_record = document.querySelector(".btn_borrow");
                btn_record.style.display = "block";
                waiting.classList.add("focus");
                loadRecordList("Đang chờ");
            }

            var borrowed = document.querySelector(".borrowed");
            borrowed.addEventListener("click", borrowedFocus);

            function borrowedFocus() {
                clearFocus();
                var btn_return = document.querySelector(".btn_return");
                btn_return.style.display = "block";
                borrowed.classList.add("focus");
                loadRecordList("Đang mượn", "Quá hạn");
            }

            var expired = document.querySelector(".expired");
            expired.addEventListener("click", function () {
                clearFocus();
                expired.classList.add("focus");
                loadRecordList("Quá hạn");
            });

            var cancel = document.querySelector(".cancel");
            cancel.addEventListener("click", function () {
                clearFocus();
                cancel.classList.add("focus");
                loadRecordList("Đăng ký bị hủy");
            });

            /*
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
                                    <td>BRC001</td>
                                    <td>Đường lối CM của Đảng Cộng Sản Việt Nam</td>
                                    <td>Bộ GD&ĐT</td>
                                    <td>2022</td>
                                    <td>28/10/2024</td>
                                    <td style="font-weight: 700">Đang chờ</td>
                                </tr>
                    */

            function loadRecordList(statusRecord, statusRecord2) {
                console.log("DATA RECORD: " + JSON.stringify(dataRecord));
                var table = document.querySelector("table");
                while (table.rows.length > 1) {
                    console.log("XÓA");
                    table.deleteRow(1); // Xóa hàng ở vị trí thứ 1, lặp lại cho đến khi chỉ còn hàng đầu tiên
                }

                dataRecord.forEach((data) => {
                    if (data.status == statusRecord) {
                        var tr = document.createElement("tr");
                        tr.dataset.id = data.borrow_code;
                        tr.dataset.id_num = data.record_id;
                        tr.dataset.book_id = data.book_id;

                        tr.innerHTML =
                            `<td>
                <img
                    style="margin: 0 12px; width: 24px; vertical-align: middle;"
                    src="./assets/img/` +
                            (statusRecord == "Đang mượn"
                                ? "red-unchecked.svg"
                                : "red.svg") +
                            `"
                    alt=""
                />
            </td>` +
                            `<td>` +
                            data.borrow_code +
                            `</td>` +
                            `<td>` +
                            data.title +
                            `</td>` +
                            `<td>` +
                            data.author +
                            `</td>` +
                            `<td>` +
                            data.published_year +
                            `</td>` +
                            `<td>` +
                            data.borrow_date +
                            `</td>` +
                            `<td>` +
                            data.due_date +
                            `</td>` +
                            `<td style="font-weight: 700;">` +
                            data.status +
                            `</td>`;

                        if (statusRecord == "Đang mượn") {
                            var check_row = tr.querySelector("img");
                            check_row.dataset.checked = "false";
                            check_row.addEventListener("click", function () {
                                if (check_row.dataset.checked == "false") {
                                    check_row.src = "./assets/img/red.svg";
                                    check_row.dataset.checked = "true";
                                    tr.dataset.checked = "true";
                                } else {
                                    check_row.src =
                                        "./assets/img/red-unchecked.svg";
                                    check_row.dataset.checked = "false";
                                    tr.dataset.checked = "false";
                                }
                            });
                        }
                        table.insertAdjacentElement("beforeend", tr);
                    }
                });

                dataRecord.forEach((data) => {
                    if (data.status == statusRecord2) {
                        var tr = document.createElement("tr");
                        tr.dataset.id = data.borrow_code;
                        tr.dataset.id_num = data.record_id;
                        tr.dataset.book_id = data.book_id;
                        tr.innerHTML =
                            `<td>
                <img
                    style="margin: 0 12px; width: 24px; vertical-align: middle;"
                    src="./assets/img/` +
                            (statusRecord == "Đang mượn"
                                ? "red-unchecked.svg"
                                : "red.svg") +
                            `"
                    alt=""
                />
            </td>` +
                            `<td>` +
                            data.borrow_code +
                            `</td>` +
                            `<td>` +
                            data.title +
                            `</td>` +
                            `<td>` +
                            data.author +
                            `</td>` +
                            `<td>` +
                            data.published_year +
                            `</td>` +
                            `<td>` +
                            data.borrow_date +
                            `</td>` +
                            `<td>` +
                            data.due_date +
                            `</td>` +
                            `<td style="font-weight: 700;">` +
                            data.status +
                            `</td>`;

                        if (statusRecord == "Đang mượn") {
                            var check_row = tr.querySelector("img");
                            check_row.dataset.checked = "false";
                            check_row.addEventListener("click", function () {
                                if (check_row.dataset.checked == "false") {
                                    check_row.src = "./assets/img/red.svg";
                                    check_row.dataset.checked = "true";
                                    tr.dataset.checked = "true";
                                } else {
                                    check_row.src =
                                        "./assets/img/red-unchecked.svg";
                                    check_row.dataset.checked = "false";
                                    tr.dataset.checked = "false";
                                }
                            });
                        }
                        table.insertAdjacentElement("beforeend", tr);
                    }
                });

                if (statusRecord == "Đang chờ") {
                    var btn_record = document.querySelector(".btn_borrow");
                    btn_record.addEventListener("click", function () {
                        console.log("CHO MƯỢN");
                        var trList = document.querySelectorAll("table tr");

                        var sz = trList.length - 1;
                        console.log("trList length = " + sz);

                        var cnt = 0;
                        trList.forEach((row) => {
                            console.log("ROW " + row.dataset.id);
                            if (row.dataset.id !== undefined) {
                                console.log("EXECUTE ROW");
                                $.ajax({
                                    url: "./record",
                                    type: "POST",
                                    dataType: "json",
                                    data: {
                                        borrow_id: row.dataset.id,
                                        borrow_id_num: row.dataset.id_num,
                                        action: "lend",
                                    },
                                    success: function (data) {
                                        console.log(data);
                                        cnt += 1;
                                        if (cnt == sz) {
                                            var student_id =
                                                document.querySelector(
                                                    ".student_id"
                                                ).innerHTML;
                                            performSearch(
                                                student_id,
                                                function () {
                                                    waitingFocus(); // Sau khi xong, gọi loadRecordList
                                                }
                                            );
                                        }
                                    },
                                });
                            }
                        });
                    });
                }

                if (statusRecord == "Đang mượn") {
                    var btn_return = document.querySelector(".btn_return");
                    btn_return.addEventListener("click", function () {
                        console.log("TRẢ SÁCH");
                        var trList = document.querySelectorAll("table tr");
                        var sz = 0;
                        trList.forEach((row) => {
                            if (row.dataset.checked == "true") {
                                sz += 1;
                            }
                        });
                        var cnt = 0;
                        trList.forEach((row) => {
                            if (row.dataset.checked == "true") {
                                $.ajax({
                                    url: "./record",
                                    type: "POST",
                                    dataType: "json",
                                    data: {
                                        borrow_id: row.dataset.id,
                                        book_id: row.dataset.book_id,
                                        borrow_id_num: row.dataset.id_num,
                                        action: "return",
                                    },
                                    success: function (data) {
                                        console.log(data);
                                        cnt += 1;
                                        console.log(cnt + " " + sz);
                                        if (cnt == sz) {
                                            console.log(
                                                "ĐÃ THỰC HIỆN TRẢ SÁCH"
                                            );
                                            var student_id =
                                                document.querySelector(
                                                    ".student_id"
                                                ).innerHTML;

                                            performSearch(
                                                student_id,
                                                function () {
                                                    borrowedFocus();
                                                }
                                            );
                                        }
                                    },
                                });
                            }
                        });
                    });
                }

                return true;
            }
        </script>
    </body>
</html>
