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
        <meta property="og:image" content="./assets/img/icon.svg" />
        <meta property="og:type" content="website" />
        <link rel="icon" href="./assets/img/icon.svg" />

        <title>PTIT Library</title>

        <link rel="stylesheet" href="./assets/css/reset.css" />
        <link rel="stylesheet" href="./assets/css/style.css" />
        <!-- <link rel="stylesheet" href="./assets/css/form-register.css" /> -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        />

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

        <style>
            .section1,
            .section2 {
                min-height: calc(100vh - 148px);
            }
            .filter img {
                user-select: none;

                cursor: pointer;
                width: 24px;
            }
            .filter ul {
                margin-top: 28px;
            }
            .filter li {
                display: flex;
                align-items: center;
                gap: 12px;
                margin: 0 !important;
                padding: 14px 0 !important;
                border: none !important;
            }

            .show_selected {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-top: 36px;
                margin-left: 3.2em;
                width: calc(100% - 6.4em);
            }

            .show_selected__header {
                width: 100%;
                display: flex;
                align-items: center;
                height: 52px;
                background-color: #f2f2f2;
            }

            .show_selected__header .icon_book {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 52px;
                height: 52px;
                background-color: #d9d9d9;
            }

            .show_selected__header .icon_book img {
                height: 24px;
            }

            .show_selected__number {
                width: calc(100% - 52px);
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .show_selected__number span {
                font-size: 16px;
                margin-left: 24px;
            }
            .show_selected__number img {
                height: 36px;
                margin-right: 24px;
                cursor: pointer;
            }

            .show_selected__content {
                width: 100%;
                border: 2px #d9d9d9 solid;
                padding: 24px 0;
                display: none;
            }

            .show_selected__content ul {
                display: flex;
                flex-direction: column;
                gap: 24px;
                width: calc(100% - 64px);
            }
            .show_selected__content li {
                display: flex;
                align-items: center;
                margin-left: 64px;
            }

            .book_title {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                font-size: 16px;
                font-weight: 700;
            }

            .book_year {
                display: block;
                margin-left: 12px;
                width: 68px;
                height: 24px;
                background-color: #d9d9d9;
                font-size: 14px;
                font-weight: 700;
                line-height: 24px;
                text-align: center;
                border-radius: 2px;
            }

            .author {
                font-size: 16px;
                opacity: 0.7;
                margin-left: 24px;
                line-height: 1.45;
            }

            .input_text {
                width: 60em;
                height: 48px;
                border-radius: 2px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                padding-left: 3.2em;
                font-size: 16px;
                outline: none;
                border: none;
            }

            .search-box span {
                cursor: pointer;
            }

            .btn_borrow {
                display: block;
                width: 128px;
                height: 32px;
                font-size: 16px;
                text-align: center;
                line-height: 32px;
                color: white;
                margin-top: 24px;
                background-color: var(--primary-color);
                cursor: pointer;
            }

            .search_result {
                margin-top: 36px;
                margin-left: 3.2em;
                width: calc(100% - 6.4em);
                margin-bottom: 256px;
            }

            .search_result ul {
                display: flex;
                flex-direction: column;
                gap: 24px;
            }

            .search_result li {
                display: flex;
                align-items: center;
            }

            .search_result img {
                width: 24px;
                margin-left: 14px;
                cursor: pointer;
                user-select: none;
            }

            .search_result .book_title {
                margin-left: 26px;
            }

            .num_of_book_left {
                margin-left: 24px;
                display: block;
                width: 164px;
                height: 28px;
                font-size: 16px;
                text-align: center;
                line-height: 28px;
                opacity: 0.7;
                border: 1px #d9d9d9 solid;
            }

            @media screen and (max-width: 1300px) {
                .search_result li,
                .show_selected li {
                    flex-wrap: wrap;
                }

                .book_title,
                .book_year,
                .author,
                .num_of_book_left,
                .search_result img {
                    margin: 8px 12px !important;
                }
            }

            @media screen and (max-width: 1000px) {
                nav ul {
                    gap: 1.5em;
                }
            }

            @media screen and (max-width: 940px) {
                nav ul {
                    display: none;
                }

                .header .section1 {
                    width: 100%;
                    min-height: fit-content;
                }

                .header .section2 {
                    border: none;
                    width: 100%;
                }

                .header .search-box {
                    width: calc(100% - 24px);
                }

                .header .section2 .search,
                .header .section2 .show_selected,
                .header .section2 .search_result {
                    width: 100%;
                    margin-left: 0;
                    margin-right: 0;
                }

                .footer .map .search-box {
                    width: 100%;
                    margin-right: 0;
                }

                .statictic {
                    gap: 4em;
                }

                .view-document {
                    justify-content: center;
                }

                .view-available-document,
                .view-document {
                    width: calc(100% - 96px);
                }

                .view-document .view-imgbook {
                    display: none;
                }

                .view-available-document .list li {
                    margin-right: 0 !important;
                }

                .view-available-document .list {
                    justify-content: space-between;
                    gap: 8px;
                }

                .view-available-document .list span {
                    display: none;
                }

                .view-title {
                    font-size: 1.8rem;
                }

                .input_text {
                    padding-left: 24px;
                }
            }

            @media screen and (max-width: 768px) {
                .slide-btn {
                    display: none;
                }

                .statictic {
                    gap: 2em;
                }

                .statictic .number {
                    font-size: 3rem !important;
                }

                .view-doc .content {
                    width: 80% !important;
                }
            }

            @media screen and (max-width: 480px) {
                .view-available-document,
                .view-document {
                    width: calc(100% - 64px);
                }

                .statictic span.number {
                    font-size: 2rem;
                }

                .cta .quote {
                    font-size: 2.4rem;
                }

                .show_selected__content li {
                    margin-left: 14px;
                }
            }

            /*Animatino Loader*/
            .loader-6 {
                width: 48px;
                height: 48px;
                display: inline-block;
                position: relative;
                margin-left: auto;
                margin-right: auto;
                transform: rotate(45deg);
                scale: 0.7;
            }
            .loader-6::before {
                content: "";
                box-sizing: border-box;
                width: 24px;
                height: 24px;
                position: absolute;
                left: 0;
                top: -24px;
                animation: animloader 4s ease infinite;
            }
            .loader-6::after {
                content: "";
                box-sizing: border-box;
                position: absolute;
                left: 0;
                top: 0;
                width: 24px;
                height: 24px;
                background: var(--primary-color);
                /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.15); */
                animation: animloader2 2s ease infinite;
            }

            @keyframes animloader {
                0% {
                    box-shadow: 0 24px rgba(255, 255, 255, 0),
                        24px 24px rgba(255, 255, 255, 0),
                        24px 48px rgba(255, 255, 255, 0),
                        0px 48px rgba(255, 255, 255, 0);
                    opacity: 0.2;
                }
                12% {
                    box-shadow: 0 24px #5d5d5d, 24px 24px rgba(255, 255, 255, 0),
                        24px 48px rgba(255, 255, 255, 0),
                        0px 48px rgba(255, 255, 255, 0);
                    opacity: 0.2;
                }
                25% {
                    box-shadow: 0 24px #5d5d5d, 24px 24px #5d5d5d,
                        24px 48px rgba(255, 255, 255, 0),
                        0px 48px rgba(255, 255, 255, 0);
                    opacity: 0.2;
                }
                37% {
                    box-shadow: 0 24px #5d5d5d, 24px 24px #5d5d5d,
                        24px 48px #5d5d5d, 0px 48px rgba(255, 255, 255, 0);
                    opacity: 0.2;
                }
                50% {
                    box-shadow: 0 24px #5d5d5d, 24px 24px #5d5d5d,
                        24px 48px #5d5d5d, 0px 48px #5d5d5d;
                    opacity: 0.2;
                }
                62% {
                    box-shadow: 0 24px rgba(255, 255, 255, 0), 24px 24px #5d5d5d,
                        24px 48px #5d5d5d, 0px 48px #5d5d5d;
                    opacity: 0.2;
                }
                75% {
                    box-shadow: 0 24px rgba(255, 255, 255, 0),
                        24px 24px rgba(255, 255, 255, 0), 24px 48px #5d5d5d,
                        0px 48px #5d5d5d;
                    opacity: 0.2;
                }
                87% {
                    box-shadow: 0 24px rgba(255, 255, 255, 0),
                        24px 24px rgba(255, 255, 255, 0),
                        24px 48px rgba(255, 255, 255, 0), 0px 48px #5d5d5d;
                    opacity: 0.2;
                }
                100% {
                    box-shadow: 0 24px rgba(255, 255, 255, 0),
                        24px 24px rgba(255, 255, 255, 0),
                        24px 48px rgba(255, 255, 255, 0),
                        0px 48px rgba(255, 255, 255, 0);
                    opacity: 0.2;
                }
            }

            @keyframes animloader2 {
                0% {
                    transform: translate(0, 0) rotateX(0) rotateY(0);
                }
                25% {
                    transform: translate(100%, 0) rotateX(0) rotateY(180deg);
                }
                50% {
                    transform: translate(100%, 100%) rotateX(-180deg)
                        rotateY(180deg);
                }
                75% {
                    transform: translate(0, 100%) rotateX(-180deg)
                        rotateY(360deg);
                }
                100% {
                    transform: translate(0, 0) rotateX(0) rotateY(360deg);
                }
            }
        </style>

        <style>
            /* Form-Register CSS */
            @font-face {
                font-family: "Signature";
                src: url("./assets/font/Signature/iCielSupaMegaFantastic-Regular.otf")
                    format("opentype");
                font-weight: normal;
                font-style: normal;
            }

            .form-register {
                font-family: "Segoe UI", sans-serif;
                font-size: 16px;
                /* position: absolute; */
                z-index: 1000;
                left: 0;
                width: 707px;
                height: 1000px;
                background-color: white;
                color: #707070;
            }

            .top {
                width: 100%;
                height: 8px;
                background-color: var(--primary-color);
            }

            .form-content {
                position: relative;
                margin: 24px;
                width: calc(100% - 24px * 2);
                height: calc(100% - 24px * 2 - 8px);
                background-color: white;
            }

            .form-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .header-content {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                gap: 4px;
            }

            .form-header .logo {
                height: 76px;
            }

            .library-name {
                font-weight: 500;
                font-size: 16px;
                color: #595959;
            }

            .school-name {
                font-style: italic;

                font-size: 16px;
                color: #707070;
            }

            .form-meta-data {
                margin-top: 100px;
                display: flex;
                justify-content: space-between;
            }

            .form-title,
            .form-total {
                display: flex;
                flex-direction: column;
                gap: 8px;
                align-items: flex-start;
            }

            .form-table-data {
                display: flex;
                margin-top: 24px;
                justify-content: space-between;
                align-items: center;
            }

            .form-signature {
                font-family: "Signature" !important;
                font-size: 28px;
                margin-right: 32px;
                display: flex;
                flex-direction: column;
                gap: 4px;
                align-items: center;
            }

            .form-meta-data .title {
                font-size: 22px;
                font-weight: 500;
                color: #707070;
            }

            .form-content i {
                font-size: 16px;
                font-weight: 500;
            }

            .form-information {
                position: relative;
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-avatar {
                position: absolute;
                top: 0;
                right: 0;
                height: 80px;
                border-radius: 50%;
            }

            .form-register table {
                margin-top: 100px;
                width: 100%;
            }
            .form-register table tr {
                height: 34px;
            }

            .form-register table tr:first-child {
                background-color: var(--primary-color);
                color: white !important;
                font-weight: 500;
            }

            .form-register td {
                padding-left: 8px;
                font-size: 16px;
                line-height: 34px;
            }

            .form-register tr td:first-child {
                text-align: center;
            }

            .form-register tr:not(:first-child) {
                border-bottom: 1px #dadada solid;
            }

            .form-register tr:last-child {
                border-bottom: 1px #707070 solid;
            }

            .form-footer {
                position: absolute;
                bottom: 0;
                left: 0;
                display: flex;
                flex-direction: column;
                gap: 8px;
                margin: auto 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="header">
            <div class="main-content">
                <div class="body" style="position: relative">
                    <div class="section1">
                        <div class="title">
                            <h3 style="margin-top: 24px">Mượn sách</h3>
                            <p
                                style="
                                    font-size: 16px;
                                    margin-top: 8px;
                                    padding-right: 64px;
                                    line-height: 1.35;
                                    opacity: 0.7;
                                "
                            >
                                Truy cập vào tất cả nguồn tài liệu hiện có của
                                thư viện PTIT
                            </p>
                        </div>

                        <div class="filter">
                            <h3 style="margin-top: 56px">Filter / Lọc</h3>
                            <ul>
                                <li>
                                    <img
                                        src="./assets/img/select.svg"
                                        alt=""
                                        data-criteria="newest"
                                    /><span>Tài liệu mới nhất</span>
                                </li>
                                <li>
                                    <img
                                        src="./assets/img/select.svg"
                                        alt=""
                                        data-criteria="quantity"
                                    /><span>Theo số lượng</span>
                                </li>
                                <li>
                                    <img
                                        src="./assets/img/select.svg"
                                        alt=""
                                        data-criteria="mostBorrowed"
                                    /><span>Được mượn nhiều nhất</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="section2">
                        <div class="search">
                            <div class="search-box">
                                <!-- <span>Tìm kiếm tài liệu chuyên ngành</span> -->
                                <input
                                    type="text"
                                    name="search_box"
                                    placeholder="Tìm kiếm tài liệu chuyên ngành, tên tác giả"
                                    class="input_text"
                                    required
                                />
                                <span
                                    class="material-symbols-outlined"
                                    style="font-size: 26px"
                                >
                                    search
                                </span>
                            </div>
                        </div>

                        <div class="show_selected">
                            <div class="show_selected__header">
                                <div class="icon_book">
                                    <img
                                        src="./assets/img/icon_book.svg"
                                        alt=""
                                    />
                                </div>
                                <div class="show_selected__number">
                                    <span></span>
                                    <div
                                        style="
                                            display: flex;
                                            align-items: center;
                                            justify-content: flex-end;
                                        "
                                    >
                                        <span
                                            style="
                                                margin-right: 8px;
                                                cursor: pointer;
                                            "
                                            onclick="generatePDF()"
                                            >Export to PDF</span
                                        >
                                        <img
                                            src="./assets/img/icon_dropdown.svg"
                                            alt=""
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="show_selected__content">
                                <ul>
                                    <!-- <li>
                                        <span class="book_title"
                                            >1. Toán giải tích 1</span
                                        >
                                        <span class="book_year">2019</span>
                                        <span class="author"
                                            >Vũ Gia Tê | Bộ GD&ĐT</span
                                        >
                                    </li>
                                    <li>
                                        <span class="book_title"
                                            >2. Lịch sử Đảng</span
                                        >
                                        <span class="book_year">2021</span>
                                        <span class="author"
                                            >Đào Mạnh Ninh | Bộ TT&TT</span
                                        >
                                    </li> -->
                                </ul>
                            </div>
                            <span class="btn_borrow"> Mượn sách </span>
                        </div>

                        <div class="search_result">
                            <ul id="results">
                                <!-- <li>
                                    <img src="./assets/img/select.svg" alt="" />
                                    <span class="book_title"
                                        >Toán giải tích 1</span
                                    >
                                    <span class="book_year">2019</span>
                                    <span class="author"
                                        >Vũ Gia Tê | Bộ GD&ĐT</span
                                    >
                                    <span class="num_of_book_left"
                                        >SL còn lại: 19 cuốn</span
                                    >
                                </li> -->
                            </ul>
                        </div>

                        <div
                            style="
                                margin: 0 auto;
                                font-size: 18px;
                                text-align: center;
                                margin-bottom: 24px;
                            "
                        >
                            <span style="width: 100%"
                                >Form Register Preview</span
                            >
                        </div>
                        <div
                            class="form-register"
                            id="exportContent"
                            style="margin: 0 auto; margin-bottom: 80px"
                        >
                            <div class="top"></div>

                            <div class="form-content">
                                <div class="form-header">
                                    <img
                                        src="./assets/img/logo-1.svg"
                                        alt=""
                                        class="logo"
                                    />
                                    <div class="header-content">
                                        <span class="library-name"
                                            >Thư Viện PTIT</span
                                        >
                                        <span class="school-name"
                                            >Học Viện Công Nghệ Bưu Chính Viễn
                                            Thông</span
                                        >
                                    </div>
                                </div>

                                <div class="form-meta-data">
                                    <div class="form-title">
                                        <span class="title"
                                            >Phiếu Đăng Ký Mượn Sách</span
                                        >
                                        <span><i>Register no</i>: #325467</span>
                                        <span
                                            ><i>Register date</i>:
                                            11/12/2024</span
                                        >
                                    </div>
                                    <div class="form-information">
                                        <span class="title">Information</span>

                                        <img
                                            src="./assets/img/avatar.jpg"
                                            alt=""
                                            class="form-avatar"
                                        />
                                        <span class="form-to"
                                            ><i>To</i>: Nguyễn Việt Huy</span
                                        >
                                        <span class="form-student-id"
                                            ><i>Student id</i>: B22DCCN393</span
                                        >
                                        <span class="form-class"
                                            ><i>Class</i>: D22CQCN09-B</span
                                        >
                                        <span class="form-email"
                                            ><i>Email</i>:
                                            HuyNV.B22DCN393@stu.ptit.edu.vn</span
                                        >
                                    </div>
                                </div>

                                <table>
                                    <tr>
                                        <td>Stt</td>
                                        <td>Tên tài liệu</td>
                                        <td>Tác giả</td>
                                        <td>Ký hiệu tài liệu</td>
                                    </tr>
                                    <tr>
                                        <td>1.</td>
                                        <td>Cấu trúc dữ liệu và giải thuật</td>
                                        <td>Nguyễn Mạnh Sơn</td>
                                        <td>VG/12345 - 6789</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </table>

                                <div class="form-table-data">
                                    <div class="form-total">
                                        <span><i>Total</i>: #325467</span>
                                        <span
                                            ><i>Register date</i>:
                                            11/12/2024</span
                                        >
                                        <span><i>Due date</i>: 11/12/2024</span>
                                    </div>
                                    <div class="form-signature">
                                        <span>Huy</span>
                                        <span>Nguyễn Việt Huy</span>
                                    </div>
                                </div>

                                <div class="form-footer">
                                    <span><i>Thư Viện PTIT</i></span>
                                    <span
                                        >Địa chỉ: Km10, Đường Nguyễn Trãi, Hà
                                        Đông, Hanoi, Vietnam
                                    </span>
                                    <span
                                        >website: http://ptit.library.com</span
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="./assets/js/jquery3.6.0.js"></script>
        <!-- <script src="./assets/js/script.js"></script> -->
        <script src="./assets/js/cookie_controller.js"></script>

        <script>
            //Filter
            var imgSelect = document.querySelectorAll(".filter img");
            imgSelect.forEach((element) => {
                element.dataset.checked = "false";
                element.ondragstart = function () {
                    return false;
                };
                element.addEventListener("click", function () {
                    if (element.dataset.checked == "false") {
                        element.src = "./assets/img/selected.svg";

                        element.dataset.checked = "true";
                    } else {
                        element.src = "./assets/img/select.svg";
                        element.dataset.checked = "false";
                    }
                });
            });

            // Search Result

            var dropdownBtn = document.querySelector(
                ".show_selected__number img"
            );

            var showSelectedContent = document.querySelector(
                ".show_selected__content"
            );
            dropdownBtn.addEventListener("click", function () {
                console.log(showSelectedContent.style.display);
                if (showSelectedContent.style.display != "none") {
                    showSelectedContent.style.display = "none";
                } else {
                    showSelectedContent.style.display = "block";
                }
            });

            var search_btn = document.querySelector(".search-box span");
            var search_input = document.querySelector(".search-box input");
            var data_books = [];
            var subjects =
                getCookie("subjects") == null
                    ? []
                    : JSON.parse(getCookie("subjects"));
            if (subjects.length > 0) {
                showSelectedContent.style.display = "block";
            }
            updateSelectedResult();

            function performSearch() {
                var inputValue = search_input.value;
                var criteria_newest = "";
                var criteria_quantity = "";
                var criteria_mostBorrowed = "";
                imgSelect.forEach((element) => {
                    if (
                        element.dataset.criteria == "newest" &&
                        element.dataset.checked == "true"
                    ) {
                        criteria_newest = "newest";
                    } else if (
                        element.dataset.criteria == "quantity" &&
                        element.dataset.checked == "true"
                    ) {
                        criteria_quantity = "quantity";
                    } else if (
                        element.dataset.criteria == "mostBorrowed" &&
                        element.dataset.checked == "true"
                    ) {
                        criteria_mostBorrowed = "mostBorrowed";
                    }
                });

                console.log(
                    "CRITERIA = " +
                        criteria_newest +
                        " ----- " +
                        criteria_quantity +
                        " ----- " +
                        criteria_mostBorrowed
                );

                $.ajax({
                    url: "./search",
                    type: "GET",
                    dataType: "json",
                    data: {
                        keyword: inputValue,
                        filter1: criteria_newest,
                        filter2: criteria_quantity,
                        filter3: criteria_mostBorrowed,
                    },
                    success: function (data) {
                        console.log(data);
                        data_books = [];
                        // Lưu dữ liệu vào danh sách
                        // data.forEach((book) => {
                        //     data_books[data_books.length] = book;
                        // });

                        // Kiểm tra xem data có phải là một mảng hay không
                        if (Array.isArray(data)) {
                            // Lưu dữ liệu vào danh sách
                            data.forEach((book) => {
                                data_books.push(book); // Cách tốt hơn để thêm phần tử vào mảng
                            });
                        } else {
                            console.error(
                                "Dữ liệu trả về không phải là một mảng:",
                                data
                            );
                        }
                        showDataBooks(inputValue);
                    },
                    error: function (xhr, status, error) {
                        console.error("Có lỗi xảy ra:", error);
                    },
                });
            }

            function updateSelectedResult() {
                var selectedNumber = document.querySelector(
                    ".show_selected__number span"
                );
                selectedNumber.innerHTML =
                    "Đã chọn " + subjects.length + " tài liệu";

                var selectedContent = $(".show_selected__content ul");

                selectedContent.empty();

                for (var i = 0; i < subjects.length; i++) {
                    selectedContent.append(
                        "<li>" +
                            '<span class="book_title">' +
                            (i + 1) +
                            ". " +
                            subjects[i].title +
                            "</span>" +
                            '<span class="book_year">' +
                            subjects[i].year +
                            "</span>" +
                            '<span class="author">' +
                            subjects[i].author +
                            " | " +
                            subjects[i].publisher +
                            "</span>" +
                            "</li>"
                    );
                }

                let jsonString = JSON.stringify(subjects);
                setCookie("subjects", jsonString);
                console.log("Cookie = " + getCookie("subjects"));
            }

            // Thực hiện sắp xếp theo nhiều tiêu chí kết hợp
            function filterDataBooks() {
                var imgSelect = document.querySelectorAll(".filter img");
                imgSelect.forEach((img) => {
                    if ((img.dataset.checked = "true")) {
                    }
                });
            }

            function showDataBooks(inputValue) {
                console.log("Show Data Books" + JSON.stringify(data_books));
                $("#results").empty();
                $("#results").append("<span class=" + "loader-6" + "></span>");

                setTimeout(function () {
                    $("#results").empty();
                    if (data_books.length === 0) {
                        // !!! Cần phải tách ra
                        $("#results").append(
                            "<li style= font-size:" +
                                "16px>" +
                                "Không tìm thấy kết quả nào cho từ khóa: " +
                                inputValue +
                                "</li>"
                        );
                    } else {
                        data_books.forEach(function (book) {
                            console.log("WORKING");
                            var isSelected = subjects.some(function (subject) {
                                return subject.id == book.id; // So sánh ID để xác định xem đã chọn chưa
                            });

                            $("#results").append(
                                "<li>" +
                                    '<img src="' +
                                    (isSelected
                                        ? "./assets/img/selected.svg"
                                        : "./assets/img/select.svg") + // Thay đổi hình ảnh dựa trên trạng thái
                                    '" alt=""' +
                                    (book.copies_available === 0
                                        ? 'class="disabled"'
                                        : "") +
                                    ' data-checked="' +
                                    (isSelected ? "true" : "false") +
                                    '"' +
                                    ' data-book_id="' +
                                    book.id +
                                    '"' + // Lưu id của cuốn sách
                                    ' data-book_title="' +
                                    book.title +
                                    '"' + // Lưu tên sách
                                    ' data-book_author="' +
                                    book.author +
                                    '"' + // Lưu tác giả
                                    ' data-book_year="' +
                                    book.published_year +
                                    '"' + // Lưu năm xuất bản
                                    ' data-book_publisher="' +
                                    book.publisher +
                                    '"' + // Lưu nhà xuất bản
                                    ' data-book_total_copies="' +
                                    book.total_copies +
                                    '"' +
                                    +'data-book_copies_available="' +
                                    book.copies_available +
                                    '"' +
                                    "/>" +
                                    '<span class="book_title">' +
                                    book.title +
                                    "</span>" +
                                    '<span class="book_year">' +
                                    book.published_year +
                                    "</span>" +
                                    '<span class="author">' +
                                    book.author +
                                    " | " +
                                    book.publisher +
                                    "</span>" +
                                    '<span class="num_of_book_left">SL còn lại: ' +
                                    book.copies_available +
                                    " cuốn</span>" +
                                    "</li>"
                            );
                        });

                        var imgSelectResult =
                            document.querySelectorAll(".search_result img");

                        imgSelectResult.forEach((element) => {
                            element.ondragstart = function () {
                                return false;
                            };

                            if (element.classList.contains("disabled")) {
                                element.src = "./assets/img/disable_select.svg";
                                return;
                            }

                            element.addEventListener("click", function () {
                                if (element.dataset.checked == "false") {
                                    element.src = "./assets/img/selected.svg";
                                    element.dataset.checked = "true";

                                    subjects[subjects.length] = {
                                        id: element.dataset.book_id,
                                        title: element.dataset.book_title,
                                        year: element.dataset.book_year,
                                        author: element.dataset.book_author,
                                        publisher:
                                            element.dataset.book_publisher,
                                        total: element.dataset
                                            .book_total_copies,
                                        remain: element.dataset
                                            .book_copies_available,
                                    };

                                    console.log(
                                        "Sau khi thêm" +
                                            JSON.stringify(subjects)
                                    );
                                    updateSelectedResult();
                                } else {
                                    element.src = "./assets/img/select.svg";
                                    element.dataset.checked = "false";
                                    var id = element.dataset.book_id;
                                    subjects = subjects.filter(
                                        (subject) => subject.id != id
                                    );
                                    console.log(
                                        "Sau khi xóa" + JSON.stringify(subjects)
                                    );
                                    updateSelectedResult();
                                }
                            });
                        });
                    }
                }, 1600);
            }

            search_btn.addEventListener("click", function () {
                performSearch();
            });

            search_input.addEventListener("keydown", function (event) {
                if (event.key === "Enter") {
                    performSearch();
                }
            });

            var btn_borrow = document.querySelector(".btn_borrow");
            btn_borrow.addEventListener("click", function () {
                book_id = [];
                subjects.forEach((subject) => {
                    book_id.push(subject.id);
                });

                console.log(book_id);

                $.ajax({
                    url: "./borrow",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(book_id),
                    success: function (response) {
                        console.log(response);
                        deleteCookie("subjects");
                    },
                });
            });
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

        <script>
            function generatePDF() {
                const element = document.getElementById("exportContent");
                const e_width = element.offsetWidth; // Lấy chiều rộng của phần tử
                const e_height = element.offsetHeight; // Lấy chiều cao của phần tử

                console.log(element);
                html2pdf()
                    .from(element)
                    .set({
                        margin: 0,
                        filename: "library-register.pdf",
                        image: { type: "jpeg", quality: 0.98 },
                        html2canvas: { scale: 6 },

                        unit: "in", // Đặt đơn vị là inch
                        // jsPDF: {
                        //     unit: "in",
                        //     format: [e_width / 96, e_height / 96], // Chuyển đổi từ pixel sang inch
                        // },
                        jsPDF: {
                            unit: "in",
                            format: "a4",
                            orientation: "portrait",
                        },
                    })
                    .save();
            }
        </script>
    </body>
</html>
