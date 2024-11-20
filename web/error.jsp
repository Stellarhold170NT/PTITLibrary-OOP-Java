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
    </head>

    <style>
        .header .body {
            min-height: calc(100vh - 148px);
        }

        .error-message {
            margin: 0 auto;
            margin-top: 72px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
        }

        .btnReturnHome {
            height: 36px;
            width: fit-content;
            padding: 0 16px;
            background-color: var(--primary-color);
        }

        .btnReturnHome span {
            font-size: 16px;
            line-height: 36px;
            color: white;
        }
    </style>
    <body>
        <!-- <%@ include file="header.jsp"%> -->
        <jsp:include page="header.jsp" />
        <div class="header">
            <div class="main-content">
                <div class="body">
                    <div class="error-message">
                        <span style="font-size: 22px">404 Not Found</span>
                        <span style="font-size: 16px; opacity: 0.72"
                            >Nội dung mà bạn đang tìm kiếm không tồn tại</span
                        >
                        <a href="./home.jsp"
                            ><div class="btnReturnHome">
                                <span>Quay trở về trang chủ</span>
                            </div></a
                        >
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>
