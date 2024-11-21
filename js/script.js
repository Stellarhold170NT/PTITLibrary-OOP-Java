// $.ajax({
//     url: "./assets/data/data.json",
//     dataType: "json",
//     success: function (dataObject) {
//         console.log("DATA JSON = " + JSON.stringify(dataObject));
//         var cnt =
//             dataObject.MonHocChung.length + dataObject.CongNgheThongTin.length;
//         var statistic = document.querySelector(".statictic span.number");
//         statistic.innerHTML = cnt + "";
//     },
// });

console.log("??------------------------------");

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
