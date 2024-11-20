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

            .suggestion {
                display: none;
                position: absolute;
                top: calc(48px + 12px);
                left: 0;
                background-color: white;
                font-size: 16px;
                width: 100%;
                box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px,
                    rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
            }

            .suggestion ul {
                display: flex;

                padding: 24px 3.2em;

                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .suggestion ul li a {
                font-size: 16px;
            }

            .highlight-keyword {
                font-weight: 700;
                margin-left: 0 !important;
                opacity: 1 !important;
            }

            @media screen and (max-width: 940px) {
                nav ul {
                    display: none;
                }

                .header .section1 {
                    width: 100%;
                }

                .header .section2 .search {
                    margin-top: 20px;
                }

                .header .section1 .title {
                    margin-bottom: 8px;
                }

                .header .section1 .title {
                    border-left: 2px var(--primary-color) solid;
                    border-right: none !important;
                }

                .header .section1 ul {
                    margin-left: 1em;
                }

                .header .section1 ul li {
                    display: inline-block;
                    font-size: 1.4rem;
                    margin-left: 4px;
                    margin-bottom: 8px;
                    padding: 4px 8px;
                    background: #eeeeee;
                    border-radius: 4px;
                    border-bottom: 1px #ccc solid;
                }

                .header .section1 ul li:hover {
                    background: #ed1c24;
                }

                .header .section1 ul li:hover a {
                    color: white;
                }

                .header .section2 {
                    border: none;
                    width: 100%;
                }

                .header .search-box {
                    width: calc(100% - 24px);
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

            @media screen and (max-width: 1300px) {
                .card-heading {
                    display: none !important;
                }
                .card-info {
                    display: none;
                }
            }

            @media screen and (max-width: 1000px) {
                nav ul {
                    gap: 1.5em;
                }
            }

            @media screen and (max-width: 768px) {
                .header .section2 .search {
                    width: 100%;
                    margin-left: 0;
                    margin-right: 0;
                }

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
                        <div
                            class="title"
                            style="
                                height: 40px;
                                background-color: #f5f5f5;
                                display: flex;
                                align-items: center;
                                border-right: 2px var(--primary-color) solid;
                            "
                        >
                            <span
                                style="
                                    margin-left: 16px;
                                    font-weight: 700;
                                    font-size: 16px;
                                "
                                >PTIT Library</span
                            >
                        </div>

                        <ul>
                            <li><a href="cntt.html">Công Nghệ Thông Tin</a></li>
                            <li><a href="#!">Khoa Học Máy Tính</a></li>
                            <li><a href="#!">Công Nghệ Đa Phương Tiện</a></li>
                            <li>
                                <a href="#!">Công Nghệ Tài Chính - Fintech</a>
                            </li>
                            <li><a href="#!">Marketing</a></li>
                        </ul>
                    </div>
                    <div class="section2">
                        <div class="search">
                            <div class="search-box" style="position: relative">
                                <!-- <span>Tìm kiếm tài liệu chuyên ngành</span> -->
                                <input
                                    type="text"
                                    name="search_box"
                                    placeholder="Tìm kiếm tài liệu chuyên ngành"
                                    class="input_text"
                                    required
                                />
                                <span
                                    class="material-symbols-outlined"
                                    style="font-size: 26px"
                                >
                                    search
                                </span>
                                <div class="suggestion">
                                    <ul>
                                        <!-- <li>
                                            <a
                                                target="_blank"
                                                href="https://drive.google.com/drive/folders/1Z6mAuOr57O7PQirz43q0vcaP-j6Jec47?usp=drive_link"
                                                >Triết học Mác-Lênin</a
                                            >
                                        </li>
                                        <li>
                                            <a
                                                target="_blank"
                                                href="https://drive.google.com/drive/folders/1r0KUQF4dg8QeWvXkBZObEXKiviHH9Olg?usp=drive_link"
                                                >Pháp luật đại cương</a
                                            >
                                        </li> -->
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="intro">
                            <h1>PTIT Library</h1>
                            <span class="address">
                                Địa chỉ: Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà
                                Nội, Hanoi, Vietnam
                            </span>
                            <a
                                href="https://www.facebook.com/ptitl"
                                style="
                                    padding: 14px 24px;
                                    background: var(--primary-color);
                                    color: white;
                                    font-size: 24px;
                                "
                                class="button"
                            >
                                Contact
                            </a>

                            <div class="notification">
                                <span
                                    class="material-symbols-outlined"
                                    style="
                                        margin-left: 32px;
                                        color: var(--primary-color);
                                    "
                                >
                                    Info
                                </span>
                                <div class="notification-info">
                                    <span class="notification-heading"
                                        >💢 𝐓𝐇𝐔̛ 𝐕𝐈𝐄̣̂𝐍 𝐏𝐓𝐈𝐓 𝐓𝐇𝐎̂𝐍𝐆 𝐁𝐀́𝐎 💢</span
                                    >
                                    <span class="notification-text"
                                        >Sau bao nhiêu ngày chờ đợi, cuối cùng
                                        Thư viện đã mở cửa buổi tối rồi các bạn
                                        ơi, hãy nhanh chân chọn cho mình vị trí
                                        ngồi phù hợp và ôn bài thật chăm chỉ nhé
                                        💓 Chúc các bạn có một mùa thi thật
                                        thành công và ý nghĩa</span
                                    >
                                </div>
                            </div>
                        </div>

                        <!--intro
                        -->

                        <div class="introduce">
                            <div class="carousel">
                                <button id="prev-btn" class="slide-btn">
                                    <span class="material-symbols-outlined">
                                        chevron_left
                                    </span>
                                </button>
                                <button id="next-btn" class="slide-btn">
                                    <span class="material-symbols-outlined">
                                        chevron_right
                                    </span>
                                </button>

                                <ul class="intro-list">
                                    <li>
                                        <div class="card">
                                            <img
                                                src="assets/img/ptit-3.jpg"
                                                alt=""
                                            />
                                            <span class="card-heading"
                                                >Học Viện Công nghệ Bưu chính
                                                Viễn thông (PTIT)</span
                                            >
                                            <span class="card-info"
                                                >Đại học Công nghệ Bưu chính
                                                Viễn thông (PTIT) là trường đại
                                                học trọng điểm quốc gia của Việt
                                                Nam. PTIT chuyên đào tạo và
                                                nghiên cứu trong lĩnh vực thông
                                                tin và truyền thông. Trường có
                                                hai cơ sở đào tạo chính tại Hà
                                                Nội và TP.Hồ Chí Minh. PTIT tự
                                                hào với chất lượng đào tạo hàng
                                                đầu, nằm trong top 5 cả nước
                                            </span>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="card">
                                            <img
                                                src="assets/img/ptit-4.jpg"
                                                alt=""
                                            />
                                            <span class="card-heading"
                                                >Học Viện Công nghệ Bưu chính
                                                Viễn thông (PTIT)</span
                                            >
                                            <span class="card-info"
                                                >Thư viện PTIT là trung tâm
                                                thông tin học thuật phong phú.
                                                Cung cấp sách giáo trình, bài
                                                giảng, đề tài nghiên cứu và tài
                                                liệu điện tử. Đây là nơi lý
                                                tưởng cho sinh viên PTIT nâng
                                                cao kiến thức
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="statictic">
                            <div class="count">
                                <span class="material-symbols-outlined icon">
                                    upload_file
                                </span>
                                <div class="info">
                                    <span class="number">100+</span
                                    ><span class="desc"
                                        >Tài liệu đã tải lên</span
                                    >
                                </div>
                            </div>
                            <div class="contributor">
                                <span class="material-symbols-outlined icon">
                                    diversity_2
                                </span>
                                <div class="info">
                                    <span class="number">1</span>
                                    <span class="desc"
                                        >Người đã tham gia đóng góp</span
                                    >
                                </div>
                            </div>
                        </div>

                        <div class="cta">
                            <span class="quote"
                                >&ldquo;Ptiters are united by a share
                                purpose.&rdquo;</span
                            >
                            <span class="message"
                                >Hãy cùng nhau chia sẻ và đóng góp tài liệu học
                                tập để tạo nên một cộng đồng học tập mạnh mẽ
                                hơn. Mỗi sự chia sẻ nhỏ của bạn sẽ giúp ích rất
                                nhiều cho những khóa sau này</span
                            >
                            <a
                                href="https://www.facebook.com/ptitl"
                                style="
                                    padding: 14px 24px;
                                    background: var(--primary-color);
                                    color: white;
                                    font-size: 24px;
                                "
                                class="button"
                            >
                                Give to the Library
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="./assets/js/jquery3.6.0.js"></script>
        <script src="./assets/js/script.js"></script>
        <script>
            $.ajax({
                url: "./assets/data/major.json",
                type: "GET",
                dataType: "json",
                success: function (data) {
                    var list_major = document.querySelector(".section1 ul");
                    list_major.innerHTML = "";
                    data.forEach((major) => {
                        console.log(major.major_id + " | " + major.major_name);
                        const listItem =
                            `<li><a href="./major?majorCode=` +
                            major.major_id +
                            `">` +
                            major.major_name +
                            `</a></li>`;
                        list_major.insertAdjacentHTML("beforeend", listItem);
                    });
                },
            });
            console.log("Cookie = " + document.cookie);
        </script>
        <script>
            let data = [];
            $.ajax({
                url: "./assets/data/data.json",
                dataType: "json",
                success: function (dataObject) {
                    data = [
                        ...dataObject.MonHocChung,
                        ...dataObject.CongNgheThongTin,
                    ];

                    console.log("DỮ LIỆU MÔN HỌC LẤY VỀ ĐƯỢC: ");
                    data.forEach((mon) => {
                        console.log(mon.name + " | " + mon.link);
                    });
                },
                error: function () {
                    console.log("CHƯA LẤY ĐƯỢC DỮ LIỆU");
                },
            });

            var search_btn = document.querySelector(".search-box span");
            var search_input = document.querySelector(".search-box input");
            var suggestionContainer = document.querySelector(".suggestion");

            var suggestionList = document.querySelector(".suggestion ul");

            function performSearch() {
                console.log("PERFORM SEARCH");

                suggestionList.innerHTML = "";

                var keyword = search_input.value.toLowerCase();
                if (keyword === "") {
                    suggestionContainer.style.display = "none";
                    return;
                }
                const results = data
                    .filter((item) => item.name.toLowerCase().includes(keyword))
                    .slice(0, 7)
                    .map((item) => {
                        // Tạo một thuộc tính mới để chứa tên đã bôi đậm
                        const highlightedName = item.name.replace(
                            new RegExp(keyword, "gi"),
                            (match) =>
                                `<span class="highlight-keyword">` +
                                match +
                                `</span>`
                        );
                        return {
                            ...item, // Giữ nguyên các thuộc tính ban đầu
                            highlightedName, // Thêm thuộc tính bôi đậm
                        };
                    });
                console.log("RESULTS LENGTH = " + results.length);
                results.forEach((item) => {
                    console.log("ITEM: " + JSON.stringify(item));
                    var li = document.createElement("li");
                    var a = document.createElement("a");
                    a.innerHTML = item.highlightedName;
                    a.target = "_blank";
                    a.href = item.link;
                    li.append(a);
                    suggestionList.insertAdjacentElement("beforeend", li);
                });

                console.log("RESULTS LENGTH ->>>> = " + results.length);
                if (search_input.value || results.length > 0) {
                    console.log("HIỂN THỊ GỢI Ý");
                    console.log(suggestionList);
                    suggestionContainer.style.display = "block"; // Hiển thị gợi ý nếu có
                } else {
                    console.log("Chưa nhập gì hoặc không có kết quả");
                }
            }

            search_btn.addEventListener("click", function () {
                performSearch();
            });

            search_input.addEventListener("input", function () {
                performSearch();
            });

            search_input.addEventListener("focus", () => {
                console.log("FOCUS");
                if (search_input.value) {
                    suggestionContainer.style.display = "block"; // Hiển thị gợi ý nếu có
                }
            });

            // Khi người dùng rời khỏi ô input
            search_input.addEventListener("blur", () => {
                console.log("BLUR");
                setTimeout(() => {
                    suggestionContainer.style.display = "none"; // Ẩn gợi ý sau khi rời focus
                }, 200); // Thêm delay nhỏ để đảm bảo không bị ẩn trước khi click vào gợi ý
            });
        </script>
    </body>
</html>
