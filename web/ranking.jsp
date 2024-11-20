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
            .header .body {
                display: block;
                min-height: calc(100vh - 148px);
            }

            /* Table CSS */
            table {
                height: 100%;
                margin-top: 24px;
                margin-bottom: 96px;
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

            table tr:first-child td:first-child {
                border-top-left-radius: 4px;
            }
            table tr:first-child td:last-child {
                border-top-right-radius: 4px;
            }

            table tr:nth-child(odd) {
                background-color: #fcfcfc;
            }

            table tr:nth-child(even) {
                /* background-color: #f4f4f4; */
                background-color: white;
            }

            /* table td {
                border: 1px rgb(232, 232, 232) solid;
            } */

            table tr:first-child {
                background-color: var(--primary-color);
                color: white;
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

            /* table tr:nth-child(2) td:last-child span {
                background-color: var(--primary-color);
                padding: 4px 8px;
                border-radius: 4px;
                color: white;
            }

            table tr:nth-child(3) td:last-child span {
                background-color: #92d050;
                padding: 4px 8px;
                border-radius: 4px;
                color: white;
            }

            table tr:nth-child(4) td:last-child span {
                background-color: #f2aa84;
                padding: 4px 8px;
                border-radius: 4px;
                color: white;
            } */

            /* table tr:nth-child(2) td:last-child {
                background-color: var(--primary-color);
                color: white;
            } */

            /* Page Controller*/
            .pageController {
                width: 100%;
                margin-top: 24px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                font-size: 16px;
            }

            .pageController1 {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .listPage {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .pageController1 .page {
                width: 32px;
                height: 32px;
                outline: 2px #f2f2f2 solid;
                border-radius: 50%;
                color: black;
                text-align: center;
                line-height: 32px;
                cursor: pointer;
            }

            .pageController2 {
                display: flex;
                gap: 8px;
                align-items: center;
            }

            .pageController2 .inputPage {
                width: 80px;
                height: 28px;
                background-color: #ccc;
            }

            .pageController2 .inputPage input {
                height: 100%;
                width: 100%;
                padding: 0 8px;
            }

            .page.focus {
                background-color: var(--primary-color);
                color: white;
                outline: none;
            }

            .page.more {
                outline: none;
                cursor: default;
            }

            .btnPagePrev,
            .btnPageNext {
                cursor: pointer;
            }

            .btnDisable {
                opacity: 0.5;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="header">
            <div class="main-content">
                <div class="body">
                    <span
                        style="
                            display: block;
                            width: 100%;
                            text-align: left;
                            font-size: 24px;
                            margin-top: calc(24px + 28px);
                        "
                    >
                        <i style="font-weight: 700; color: var(--primary-color)"
                            >Leaderboard</i
                        >
                        Ptit
                    </span>
                    <div class="pageController" id="page-controller">
                        <div class="pageController1">
                            <span class="btnPagePrev btnPage">Prev</span>
                            <div class="listPage">
                                <span class="page">1</span>
                                <span class="page">2</span>
                                <span class="page">3</span>
                                <span class="page"></span>
                                <span class="page">10</span>
                            </div>
                            <span class="btnPageNext btnPage">Next</span>
                        </div>
                        <div class="pageController2">
                            <span>Page</span>
                            <div class="inputPage">
                                <input type="number" />
                            </div>
                            <span class="pageInformation">of 100</span>
                        </div>
                    </div>
                    <table>
                        <tr>
                            <td>#</td>
                            <td>MSV</td>
                            <td>Họ và tên</td>
                            <td>Khóa</td>
                            <td>Ngành</td>
                            <td>Gpa</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            let currentPage = 1; // Trang hiện tại
            const itemsPerPage = 20; // Số mục hiển thị trên mỗi trang
            var totalPages = Math.ceil(Number("<%=session.getAttribute("students_len")%>") / itemsPerPage);
            console.log("TOTAL PAGES -> " + totalPages);
            showPageController(1);

            document.querySelector(".pageInformation").innerHTML =
                        "of " + totalPages;

                    var input_controller = document.querySelector(
                        ".pageController2 input"
                    );
                    input_controller.min = "1";
                    input_controller.max = String(totalPages);
                    input_controller.addEventListener(
                        "keydown",
                        function (event) {
                            if (event.key == "Enter") {
                                console.log("HIT ENTER");
                                currentPage = Math.min(
                                    input_controller.value,
                                    totalPages
                                );
                                navigatePage(totalPages);
                            }
                        }
                    );

            function showPageController(type) {
                var pageController = document.querySelector(".pageController");
                var listPage = document.querySelector(".listPage");
                listPage.innerHTML = "";

                if (totalPages > 1) {
                    pageController.style.display = "flex";


                    if (totalPages > 6) {
                        if (type == 1) {
                            for (var i = 1; i <= 4; i++) {
                                listPage.insertAdjacentHTML(
                                    "beforeend",
                                    `<span class="page">` + i + `</span>`
                                );
                            }
                            // var firsPage = document.querySelector(
                            //     " .listPage .page:first-child"
                            // );
                            // firsPage.classList.add("focus");

                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + "..." + `</span>`
                            );

                            var morPage = document.querySelector(
                                ".listPage .page:last-child"
                            );

                            morPage.classList.add("more");
                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + totalPages + `</span>`
                            );
                        } else if (type == 3) {
                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + 1 + `</span>`
                            );

                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + "..." + `</span>`
                            );

                            var morPage = document.querySelector(
                                ".listPage .page:last-child"
                            );

                            morPage.classList.add("more");

                            for (var i = totalPages - 3; i <= totalPages; i++) {
                                listPage.insertAdjacentHTML(
                                    "beforeend",
                                    `<span class="page">` + i + `</span>`
                                );
                            }
                        } else if (type == 2) {
                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + 1 + `</span>`
                            );

                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + "..." + `</span>`
                            );

                            var morPage = document.querySelector(
                                ".listPage .page:last-child"
                            );

                            morPage.classList.add("more");
                            for (
                                var i = currentPage - 1;
                                i <= currentPage + 1;
                                i++
                            ) {
                                listPage.insertAdjacentHTML(
                                    "beforeend",
                                    `<span class="page">` + i + `</span>`
                                );
                            }

                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + "..." + `</span>`
                            );

                            var morPage = document.querySelector(
                                ".listPage .page:last-child"
                            );

                            morPage.classList.add("more");

                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + totalPages + `</span>`
                            );
                        }
                    } else {
                        for (var i = 1; i <= totalPages; i++) {
                            listPage.insertAdjacentHTML(
                                "beforeend",
                                `<span class="page">` + i + `</span>`
                            );
                        }
                        var firsPage = document.querySelector(
                            " .listPage .page:first-child"
                        );
                    }

                    var listPages =
                        document.querySelectorAll(".listPage .page");

                    listPages.forEach((page) => {
                        if (!page.classList.contains("more")) {
                            if (Number(page.innerHTML) == currentPage)
                                page.classList.add("focus");

                            page.addEventListener("click", function () {
                                console.log("CLICK PAGE");
                                // listPages.forEach((o) => {
                                //     o.classList.remove("focus");
                                // });
                                currentPage = Number(page.innerHTML);
                                navigatePage(totalPages);
                            });
                        }
                    });
                } else {
                    pageController.style.display = "none";
                }
            }

            var btnPagePrev = document.querySelector(".btnPagePrev");
            var btnPageNext = document.querySelector(".btnPageNext");

            function navigatePage(totalPages) {
                if (currentPage == 1) {
                    btnPagePrev.classList.add("btnDisable");
                    btnPageNext.classList.remove("btnDisable");
                } else if (currentPage == totalPages) {
                    btnPageNext.classList.add("btnDisable");
                    btnPagePrev.classList.remove("btnDisable");
                } else {
                    btnPagePrev.classList.remove("btnDisable");
                    btnPageNext.classList.remove("btnDisable");
                }
                if (totalPages > 6) {
                    if (currentPage <= 3) {
                        showPageController(1);
                    } else if (currentPage >= totalPages - 3 + 1) {
                        showPageController(3);
                    } else showPageController(2);
                } else showPageController(0);
                // if (totalPages > 4) {
                // }
                // page.classList.add("focus");
                showDataRanking();
            }

            btnPagePrev.addEventListener("click", function () {
                if (currentPage > 1) {
                    currentPage -= 1;
                }
                navigatePage(totalPages);
            });

            btnPageNext.addEventListener("click", function () {
                if (currentPage < totalPages) {
                    currentPage += 1;
                }
                navigatePage(totalPages);
            });

            navigatePage(totalPages);

            function showDataRanking() {
                $.ajax({
                    url: "./rank",
                    type: "GET",
                    dataType: "json",
                    data: {
                        page: currentPage,
                    },
                    success: function (data) {
                        console.log(data);

                        var table = document.querySelector("table");
                        table.innerHTML = "";

                        var HTMLString = `<tr>
                            <td>#</td>
                            <td>MSV</td>
                            <td>Họ và tên</td>
                            <td>Khóa</td>
                            <td>Ngành</td>
                            <td>Gpa</td>
                        </tr>`;

                        for (var i = 0; i < data.length; i++) {
                            HTMLString += `<tr>
                            <td>`+ ((currentPage - 1) * itemsPerPage + i + 1) + `</td>
                            <td `+ (data[i].online == `true` ? `style="position:relative;"` : "") +`>`+ (data[i].student_code) + (data[i].online == "true" ? `<span
                                    style="
                                        display: block;

                                        height: 20px;
                                        position: absolute;
                                        font-size: 14px;
                                        line-height: 20px;
                                        color: white;
                                        top: 50%;
                                        transform: translateY(-50%);
                                        right: 0;
                                        padding: 0 12px;
                                        border-radius: 10px;
                                        background-color: #92d050;
                                    "
                                    >online</span
                                >` : "" ) + `</td>
                            <td>`+ (data[i].full_name) +`</td>
                            <td>`+ (data[i].enrollment_year)+`</td>
                            <td>`+ (data[i].major) + `</td>
                            <td>`+ (data[i].gpa)+`</td>
                        </tr>`;
                        };

                        table.insertAdjacentHTML("afterbegin", HTMLString);
                    },
                });
            }
        </script>
    </body>
</html>
