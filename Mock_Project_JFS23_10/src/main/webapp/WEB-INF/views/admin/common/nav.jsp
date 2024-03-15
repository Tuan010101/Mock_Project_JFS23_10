<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header"
	class="d-flex justify-content-between align-items-center">
	<div class="DK-Logo pl-4 ">
		<a class="text-logo" href="#"> <span class="vegefoods-text">Vegefoods</span>
		</a>
	</div>
	<div
		class="align-items-center pr-4 header-logOut d-flex justify-content-center">
		<button class="border-0 bg-white ">
			<i class="fa-solid fa-right-from-bracket "></i> Log Out
		</button>
	</div>
</div>

<style>
:root {
	--primary-color: #82ae46;
	--text-color: #f8f9fa;
}

.DK-Logo {
	display: flex;
	justify-content: center;
	align-items: center;
}

.text-logo {
	text-transform: uppercase;
	color: var(--primary-color);
	font-weight: 800;
	font-size: 23px;
	line-height: inherit;
	white-space: nowrap;
	letter-spacing: -3px;
	text-decoration: none;
	border: 1px solid;
	padding: 5px 19px;
	line-height: normal;
}

.text-logo:hover {
	text-decoration: none;
	color: gray;
}

.header-logOut button:hover {
	color: gray;
}

.header-logOut button {
	font-size: 20px;
	color: var(--primary-color);
}

#sidebar ul a li:hover {
	background-color: var(--primary-color);
	color: gray;
}

li a:hover {
	text-decoration: none;
}
</style>

