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

$(document).ready(function() {
    var urlParams = new URLSearchParams(window.location.search);
    var initialCategory = urlParams.get('jobsName');
    
    if (initialCategory) {
        $('.category_item').removeClass('active');
        $('a[href="/people?jobsName=' + initialCategory + '"]').addClass('active');
    }
    
    $('.category_item').on('click', function(event) {
        event.preventDefault();

        var $this = $(this);
        var jobsName = $this.text().trim();

        var url;
        if (jobsName === "ALL") {
            url = "/people";
        } else {
            url = '/people?jobsName=' + encodeURIComponent(jobsName);
        }

        history.pushState({}, '', url);

        $.ajax({
            type: "GET",
            url: "/people/empList",
            data: {
                jobsName: jobsName
            },
            dataType: "json",
            success: function(response) {
	
                var employees = response;

                $('.p_container').empty();
                var $ul = $('<ul class="peopleList"></ul>');

                employees.forEach(function(emp) {
                    var $item = $('<li class="itemList loaded"></li>');

                    var $imgArea = $('<div class="img_area"></div>');
                    $('<img class="img" src="' + emp.filePath + emp.originalFileName + '">').appendTo($imgArea);
                    $imgArea.appendTo($item);

                    var $textArea = $('<div class="text_area"></div>');
                    $('<span class="name">' + emp.name + '</span>').appendTo($textArea);
                    $('<span class="position">' + emp.jobsName + '</span>').appendTo($textArea);
                    $('<span class="email">' + emp.email + '</span>').appendTo($textArea);
                    $textArea.appendTo($item);

                    $item.appendTo($ul);
                });

                $ul.appendTo('.p_container');

                $('.category_item').removeClass('active');
                $this.addClass('active');
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });
});
