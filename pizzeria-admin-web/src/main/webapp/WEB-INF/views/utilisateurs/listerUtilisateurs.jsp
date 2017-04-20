<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../layout/entete.jsp">
	<jsp:param value="Page Lister Users" name="title" />
</jsp:include>

<body class="container">


<h1> Utilisateurs</h1>

<<<<<<< HEAD

<a href=<c:url value='/utilisateur/nouveau'></c:url>>
   <input type="button" value="Ajouter"  class ='btn btn-success'/>
</a>	

=======
>>>>>>> #3 USA003 - Utilisateurs - premier jet
<table class="table">
  <thead>
    <tr>
      <th>Nom </th>
      <th>Prénom</th>
      <th>Email</th>
      <th>Adresse</th>
    </tr>
  </thead>
  <tbody>
<<<<<<< HEAD
<c:forEach var="utilisateur" items="${listeUtilisateurs}">
		<tr>
			<td>
				${utilisateur.nom}   
			</td>
			<td>
				${utilisateur.prenom}
			</td>
			<td>
				${utilisateur.email}
			</td>
			<td>
				${utilisateur.adresse} 
			</td>
			<td>
				${utilisateur.motDePasse} 
			</td>	
			<td>

			
				<a href=<c:url value='/utilisateur/editer?id=${utilisateur.id}'></c:url>><button class='btn btn-warning'>
					Editer
				</button></a>
			</td>		
			<td>
				 <form action="<c:url value='/utilisateur/supprimer?id=${utilisateur.id}'></c:url>" method="post">
				 	<input class='btn btn-danger' type='submit' value='supprimer !!!!'>
				 </form>
			</td>
			
			
=======
<c:forEach var="pizza" items="${listeUtilisateurs}">
		<tr>
			<td>
				${pizza.nom}   
			</td>
			<td>
			${pizza.prenom}
			</td>
			<td>
			${pizza.email}
			</td>
			<td>
			${pizza.adresse} 
			</td>
>>>>>>> #3 USA003 - Utilisateurs - premier jet
		</tr>
		</c:forEach>
	</tbody>
</table>






</body>
</html>