$.ajax({
    url: "data.json",
    dataType: "json",
    success: function (dataObject) {
        var cnt =
            dataObject.MonHocChung.length + dataObject.CongNgheThongTin.length;
        var statistic = document.querySelector(".statictic span.number");
        statistic.innerHTML = cnt + "";
    },
});

const initSlider = () => {
    const imageList = document.querySelector(".introduce .intro-list");
    const slideButtons = document.querySelectorAll(".introduce .slide-btn");
    const scrollbarThumb = document.querySelector(
        ".introduce .scrollbar-thumb"
    );
    const maxScrollLeft = imageList.scrollWidth - imageList.clientWidth;

    slideButtons.forEach((button) => {
        button.addEventListener("click", () => {
            const direction = button.id === "prev-btn" ? -1 : 1;
            const scrollAmount = imageList.clientWidth * direction;
            console.log(scrollAmount);
            imageList.scrollBy({ left: scrollAmount, behavior: "smooth" });
        });
    });

    imageList.addEventListener("scroll", () => {
        // updateScrollThumbPosition();
        const scrollPosition = imageList.scrollLeft;
        const thumbPosition =
            (scrollPosition / maxScrollLeft) *
            (imageList.clientWidth - scrollbarThumb.offsetWidth);
        console.log("${thumbPosition}px");
        scrollbarThumb.style.left = `${thumbPosition}px`;
    });
};

window.addEventListener("load", initSlider);

var navbar = document.querySelector("nav");

console.log(window.innerWidth + " " + window.innerHeight);

// carousel

window.addEventListener("resize", function () {
    var carousel = document.querySelector(".introduce ul");
    var width_carousel = carousel.clientWidth;
    var height_carousel = width_carousel * 0.573921;
    carousel.style.height = height_carousel + "px";
});

window.addEventListener("resize", function () {
    var item = document.querySelector(".header .search");
    console.log(item.clientWidth);
});

var listSubject = document.querySelectorAll("td");
console.log("len" + listSubject.length);
for (var i = 0; i < listSubject.length; i++) {
    var tableData = listSubject[i];

    var a = document.createElement("a");
    var div = document.createElement("div");

    a.href = "#!";
    a.style.width = "100%";
    a.style.height = "100%";
    div.innerHTML = tableData.innerHTML;

    tableData.innerHTML = "";
    a.appendChild(div);
    tableData.appendChild(a);

    div.style.display = "flex";
    div.style.flexDirection = "column";
    div.style.alignItems = "center";
    div.style.justifyContent = "center";
    div.style.gap = "8px";

    a.style.display = "flex";
    a.style.alignItems = "center";
    a.style.justifyContent = "center";
}

var viewDoc = document.querySelector(".view-doc");
var viewDocLink = document.querySelector(".view-doc a");
var aElements = document.querySelectorAll("td a");
aElements.forEach((a) => {
    a.addEventListener("click", function () {
        viewDocLink.href = "#!";
        viewDocLink.target = "";
        viewDoc.setAttribute("class", "view-doc active");
        var spanElement = a.querySelector("div > span");
        var name = spanElement.innerHTML;

        var spanElement2 = a.querySelector("div span:last-child");

        var viewTitle = document.querySelector(".view-title");
        viewTitle.innerHTML = name;
        var viewNumber = document.querySelector(".view-number");
        viewNumber.innerHTML = spanElement2.innerHTML;
        console.log("name = " + name);
        $.ajax({
            url: "data.json",
            dataType: "json",
            success: function (dataObject) {
                dataObject.MonHocChung.forEach((monhoc) => {
                    if (name === monhoc.name) {
                        console.log(monhoc.link);
                        viewDocLink.href = monhoc.link;
                        viewDocLink.target = "_blank";
                    }
                });

                dataObject.CongNgheThongTin.forEach((monhoc) => {
                    console.log(monhoc.name);
                    if (name === monhoc.name) {
                        console.log(monhoc.link);
                        viewDocLink.href = monhoc.link;
                        viewDocLink.target = "_blank";
                    }
                });

                var update = document.querySelector(
                    ".view-available-document > span"
                );

                var list = document.querySelector(
                    ".view-available-document .list"
                );

                if (viewDocLink.target == "") {
                    update.innerHTML = "Hiện chưa có tài liệu";
                    list.style.visibility = "hidden";
                } else {
                    update.innerHTML = "Tài liệu tổng hợp được";
                    list.style.visibility = "visible";
                }
            },
        });
    });
});

var viewCloseBtn = document.querySelector(".view-close-btn");

viewCloseBtn.addEventListener("click", function () {
    viewDoc.setAttribute("class", "view-doc");
});
