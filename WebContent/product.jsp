<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${productController.product.name}</title>
	<!-- Bootstrap Core -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/starter-template-aligned.css" rel="stylesheet">
</head>
<body>
<f:view>
<h:form>
<!-- Navbar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">IBEI</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.jsp">Home</a></li>
            <li class="active"><h:commandLink action="#{productController.listProducts}" value="Product catalog" /></li>
			<c:if test="${customerController.currentCustomer == null}">
				<li><h:commandLink action="#{customerController.toCustomerArea}" value="Sign in" /></li>
			</c:if>
			<c:if test="${customerController.currentCustomer != null}">
				<li><h:commandLink action="#{customerController.toCustomerArea}" value="#{customerController.currentCustomer.name}" /></li>
			</c:if>
			<c:if test="${administratorController.administrator == null}">
				<li><h:commandLink action="#{administratorController.toAdministratorArea}" value="Administrator area" /></li>
			</c:if>
			<c:if test="${administratorController.administrator != null}">
				<li><h:commandLink action="#{administratorController.toAdministratorArea}" value="#{administratorController.administrator.name}" /></li>
			</c:if>
			<li><h:commandLink action="newCustomer" value="Sign up" /></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- /Navbar -->

	<div class="container">
	<div class="starter-template">
		<small>You are here: <h:commandLink action="index" value="Home"/>><h:commandLink action="#{productController.listProducts}" value="Product catalog"/>>Product info</small>
	
		<h1>${productController.product.name}</h1>
		<h2>Product details:</h2>
			<div>Price: ${productController.product.price}$</div>
			<div>Description: ${productController.product.description}</div>
			<div>Category: ${productController.product.category}</div>
		<div>
			Quantity: <h:inputText value="#{orderController.quantity}" />
			<c:if test="${orderController.currentOrder == null && customerController.currentCustomer != null}">
				<h:commandButton action="#{orderController.addOrderLineNewOrder(productController.product, customerController.currentCustomer)}" value="Add to shopping cart" />
			</c:if>
			<c:if test="${orderController.currentOrder != null && customerController.currentCustomer != null}">
				<h:commandButton action="#{orderController.addOrderLine(productController.product)}" value="Add to shopping cart" />
			</c:if>
		</div>
		<c:if test="${orderController.currentOrder != null && customerController.currentCustomer != null}">
			<h:commandLink action="#{orderController.toOrder}" value="View shopping cart" />
		</c:if>

	</div>
	</div>
	</h:form>
	</f:view>
</body>
</html>