<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Todo List</title>
<style type="text/css">
.strike {
	text-decoration: line-through;
}


.alert {
    border: 1px solid;
}

.alert-error {
    background-color: #c60f13;
    border-color: #970b0e;
    color: white;
}

.alert-success {
    background-color: #5da423;
    border-color: #457a1a;
    color: white;
}


.alert-success ul {
    list-style: none;
}

.alert-error ul {
    list-style: none;
}

.text-error {
    color: #c60f13;
}



</style>
</head>
<body>
	<h1>Todo List</h1>
	<div id="todoForm">
	<!-- 結果メッセージを表示する。 -->
		<t:messagesPanel />
		<!-- modelAttribute属性には、ControllerでModelに追加したFormの名前を指定する。
			 action属性には新規作成処理を実行するためのURL(<contextPath>/todo/create)を指定する。
			 新規作成処理は更新系の処理なので、method属性にはPOSTメソッドを指定する
		 -->
		<form:form action="${pageContext.request.contextPath}/todo/create"
			method="post" modelAttribute="todoForm">
			<form:input path="todoTitle" /><br>
			<form:errors path="todoTitle" cssClass="text-error" /><br>
			
			<form:button>Create Todo</form:button>
		</form:form>
	</div>
	<hr />
	<div id="todoList">
		<ul>
			<c:forEach items="${todos}" var="todo">
				<li><c:choose>
						<c:when test="${todo.finished}">
							<span class="strike"> ${f:h(todo.todoTitle)} </span>
						</c:when>
						<c:otherwise>
                            ${f:h(todo.todoTitle)}
                        </c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>