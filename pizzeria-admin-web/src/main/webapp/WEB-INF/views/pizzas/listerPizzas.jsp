<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/entete.jsp">
	<jsp:param name="title" value="Lister Pizza" />
</jsp:include>

<jsp:include page="../layout/navbar.jsp" />


<div class="container">
	<div class="row">
		<div class="col-md-9">
			<h1>Liste des pizzas</h1>
			<a class="btn btn-primary" href="../pizza/new">Nouvelle Pizza</a> <a
				class="btn btn-primary" href="../historiquePizzas/liste">Historique
				Pizza</a> <br>
			<c:if test="${msg != null}">
				<div class="alert alert-danger" role="alert">${msg}</div>
			</c:if>

			<table class="table">
				<thead>
					<tr>
						<th>Image</th>
						<th>Informations</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pizza" items="${listePizzas}">
						<tr>
							<td><img src="${pizza.urlImage}" width="250px"
								height="200px" alt="${pizza.nom}" title="${pizza.nom}"></td>
							<td>
								<div class="row">
									<div class="col-md-6">
										Ref. ${pizza.id} <br> <b>${pizza.nom}</b> <br>
										${pizza.prix}€ <br> ${pizza.versionPizza} <br>
									</div>
									<div class="col-md-6">
										<a href="<c:url value="/pizza/edit?id=${pizza.id}"/>"
											class="btn btn-warning">Editer</a> <br>
										<form method="POST">
											<input type="hidden" name="id" value="${pizza.id}"> <input
												type="hidden" name="action" value="supprimer">
											<button type="submit" class="btn btn-danger">Archiver</button>
										</form>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<jsp:include page="../layout/footer.jsp" />