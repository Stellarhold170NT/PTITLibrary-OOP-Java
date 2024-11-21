// function setCookie(name, value, days) {
//     // Chuyển giá trị thành JSON string nếu là đối tượng hoặc mảng
//     let jsonString = typeof value === "object" ? JSON.stringify(value) : value;

//     // Thiết lập thời gian hết hạn của cookie
//     let expires = "";
//     if (days) {
//         let date = new Date();
//         date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
//         expires = "; expires=" + date.toUTCString();
//     }

//     // Đặt cookie với path=/ để áp dụng cho toàn bộ website
//     document.cookie =
//         name + "=" + encodeURIComponent(jsonString) + expires + "; path=/";
// }

function setCookie(name, value) {
    // Chuyển giá trị thành JSON string nếu là đối tượng hoặc mảng
    let jsonString = typeof value === "object" ? JSON.stringify(value) : value;

    // Đặt cookie với path=/ để áp dụng cho toàn bộ website
    document.cookie = name + "=" + encodeURIComponent(jsonString) + "; path=/";
}

function getCookie(name) {
    let cookieArr = document.cookie.split(";");
    for (let cookie of cookieArr) {
        let [cookieName, cookieValue] = cookie.trim().split("=");
        if (cookieName === name) {
            return decodeURIComponent(cookieValue);
        }
    }
    return null;
}

function deleteCookie(name) {
    // Đặt cookie với maxAge = 0 để yêu cầu trình duyệt xóa cookie
    document.cookie = name + "=; max-age=0; path=/;";
}
