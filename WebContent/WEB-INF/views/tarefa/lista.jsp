<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<link type="text/css" href="resources/css/tarefas.css" rel="stylesheet" />
		<script type="text/javascript" src="resources/js/jquery.js"></script>
	</head>
	<body>
		<script type="text/javascript">
			function finalizaAgora(id){
				$.post("finalizaTarefa",{'id' : id}, function(){
					$("#tarefa_"+id).html("Finalizado");
				});
			}
		</script>
		
		<a href="novaTarefa">Criar nova tarefa</a>
		<br><br>
		<table border=1>
			<tr>
				<th>Id</th>
				<th>Descrição</th>
				<th>Finalização</th>
				<th>Data de finalização</th>
			</tr>
			<c:forEach items="${tarefas}" var="tarefa">
				<tr>
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					<c:if test="${tarefa.finalizado eq false }">
						<td id="tarefa_${tarefa.id}">
							<a href="#" onClick="finalizaAgora(${tarefa.id})">Finaliza agora!</a>
						</td>
					</c:if>
					<c:if test="${tarefa.finalizado eq true }">
						<td>Finalizado</td>
					</c:if>
					<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>