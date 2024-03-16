<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobhub</title>
<link rel="shortcut icon" href="common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/notice_by_career.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
.accordion-item-content {
	display: none;
	padding: 20px;
}

.accordion-item-content.active {
	display: block;
}

.accordion {
	padding: 30px;
	border-top: solid black 1px;
}

.accordion:hover {
	cursor: pointer;
}

.accordion-item-title {
	font-size: 17px;
	font-weight: bold;
}

.accordion-item {
	padding: 20px;
	border: solid #ddd 1px;
	display: flex;
	flex-direction: column;
}

.container {
	padding-top: 130px;
	padding-bottom: 0px;
}

.accordion-item-title {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.accordion-item-title .fa-chevron-down {
	margin-left: 10px;
}
</style>
</head>
<body>
	<%@ include file="../header_footer/header.jsp"%>

	<div class="container">
		<div class="notice_box_container">
			<div class="notice_info_header">
				<span class="notice_title">FAQs</span>

			</div>
		</div>
	</div>

	<div class="accordion">

		<c:forEach var="faqsListItem" items="${faqsList}">

			<div class="accordion-item">
				<div class="accordion-item-title">
					<span>${faqsListItem.category}</span> <span>${faqsListItem.title}</span>
					<i class="fa-solid fa-chevron-down"></i>
				</div>
				<div class="accordion-item-content">
					<p>${faqsListItem.content}</p>
				</div>
			</div>
		</c:forEach>
		<br>
	</div>

	<script>
        const accordionItems = document.querySelectorAll('.accordion-item');

        accordionItems.forEach(item => {
            const title = item.querySelector('.accordion-item-title');
            const content = item.querySelector('.accordion-item-content');

            title.addEventListener('click', () => {
                accordionItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.querySelector('.accordion-item-content').classList.remove('active');
                    }
                });

                content.classList.toggle('active');
            });
        });
    </script>

	<%@ include file="../header_footer/footer.jsp"%>

</body>
</html>
