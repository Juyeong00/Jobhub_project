var itemList = document.querySelectorAll('.itemList');

window.addEventListener('load', function() {
    for (var i = 0; i < 4; i++) {
        itemList[i].classList.add('loaded');
    }
});

window.addEventListener('scroll', function() {
    var scrollPosition = window.scrollY;
    var windowHeight = window.innerHeight;

    for (var i = 1; i < itemList.length; i++) {
        var item = itemList[i];
        var itemPosition = item.getBoundingClientRect().top + scrollPosition;

        if (itemPosition < scrollPosition + windowHeight) {
            item.classList.add('loaded');
        }
    }
});
