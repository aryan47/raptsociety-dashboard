<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tables</title>
<!-- Bootstrap -->
<link href="index/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="index/css/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link href="index/css/assets/styles.css" rel="stylesheet" media="screen">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="index/css/http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

</head>


<body>

	<input type="hidden" name="" id="url" value="${url}" />
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">Admin Panel</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Vincent Gabriel <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">Profile</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="login.html">Logout</a></li>
							</ul></li>
					</ul>
					<ul class="nav">
						<li class="active"><a href="#">Dashboard</a></li>
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">Settings <b class="caret"></b>

						</a>
							<ul class="dropdown-menu" id="menu1">
								<li><a href="#">Tools <i class="icon-arrow-right"></i>

								</a>
									<ul class="dropdown-menu sub-menu">
										<li><a href="#">Reports</a></li>
										<li><a href="#">Logs</a></li>
										<li><a href="#">Errors</a></li>
									</ul></li>
								<li><a href="#">SEO Settings</a></li>
								<li><a href="#">Other Link</a></li>
								<li class="divider"></li>
								<li><a href="#">Other Link</a></li>
								<li><a href="#">Other Link</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown">Content <i
								class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">Blog</a></li>
								<li><a tabindex="-1" href="#">News</a></li>
								<li><a tabindex="-1" href="#">Custom Pages</a></li>
								<li><a tabindex="-1" href="#">Calendar</a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#">FAQ</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown">Users <i
								class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="#">User List</a></li>
								<li><a tabindex="-1" href="#">Search</a></li>
								<li><a tabindex="-1" href="#">Permissions</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="/"><i class="icon-chevron-right"></i>
							Dashboard</a></li>
					<li><a href="calendar.html"><i class="icon-chevron-right"></i>
							Calendar</a></li>
					<li><a href="stats.html"><i class="icon-chevron-right"></i>
							Statistics (Charts)</a></li>
					<li><a href="form.html"><i class="icon-chevron-right"></i>
							Forms</a></li>
					<li class="active"><a href="/tables"><i
							class="icon-chevron-right"></i> Tables</a></li>
					<li><a href="buttons.html"><i class="icon-chevron-right"></i>
							Buttons & Icons</a></li>
					<li><a href="interface.html"><i class="icon-chevron-right"></i>
							UI & Interface</a></li>
					<li><a href="#"><span
							class="badge badge-success pull-right">731</span> Orders</a></li>
					<li><a href="#"><span
							class="badge badge-success pull-right">812</span> Invoices</a></li>
					<li><a href="#"><span class="badge badge-info pull-right">27</span>
							Clients</a></li>
					<li><a href="#"><span class="badge badge-info pull-right">1,234</span>
							Users</a></li>
					<li><a href="#"><span class="badge badge-info pull-right">2,221</span>
							Messages</a></li>
					<li><a href="#"><span class="badge badge-info pull-right">11</span>
							Reports</a></li>
					<li><a href="#"><span
							class="badge badge-important pull-right">83</span> Errors</a></li>
					<li><a href="#"><span
							class="badge badge-warning pull-right">4,231</span> Logs</a></li>
				</ul>
			</div>
			<!--/span-->
			<div class="span9" id="content">

				<div class="row-fluid">
					<c:if test="${not empty studentAdded}">
						<div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">�</button>
							successfully adder user <b>${studentAdded}</b>
						</div>
					</c:if>
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Students Table</div>

						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar">

									<div class="btn-group pull-right">
										<button data-toggle="dropdown" class="btn dropdown-toggle">
											Tools <span class="caret"></span>
										</button>
										<ul class="dropdown-menu">
											<li><a href="#">Print</a></li>
											<li><a href="#">Save as PDF</a></li>
											<li><a href="#">Export to Excel</a></li>
										</ul>
									</div>
								</div>


								<div id="tableContent" style="margin-top: 30px">
									<ul>
										<li><a href="#tableContent">List</a></li>
										<li><a href="#addNew">Add New</a></li>
									</ul>
									<div id="tableContent">
										<table id="studentTable" cellpadding="0" cellspacing="0"
											border="0" class="table table-striped table-bordered"
											id="example2">
											<thead>
												<tr>
													<th>S.No</th>
													<th>Name</th>
													<th>Email</th>
													<th>edit</th>
												</tr>
											</thead>
											<tbody id="studentBody">
												<!-- insert instructors data to table using jquery in main.js -->

											</tbody>
										</table>
									</div>
									<div id="addNew">

										<div class="tab-pane" id="tab1">
											<form class="form-horizontal" method="get"
												action="/addStudent">
												<fieldset>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Name</label>
														<div class="controls">
															<input name="name" class="input-xlarge focused"
																id="focusedInput" type="text" value="">
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Email</label>
														<div class="controls">
															<input name="email" class="input-xlarge focused"
																id="focusedInput" type="text" value="">
														</div>
													</div>

													<div class="form-actions">
														<button type="submit" class="btn btn-primary">Save
															changes</button>
														<button type="reset" class="btn">Cancel</button>
													</div>
												</fieldset>
											</form>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- /block -->
				</div>

			</div>
		</div>
	</div>
	<hr>
	<div class="modal fade" id="editStudent">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h3>Edit details</h3>
				</div>
				<div class="modal-body">
					<form action="/updateStudent" id="form_sample_1" class="form-horizontal" method="get">
						<fieldset>
							<div class="control-group">
								<label class="control-label">Name<span class="required">*</span></label>
								<div class="controls">
									<input type="text" name="name" id="editName" data-required="1"
										class="input-xlarge focused" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Email<span
									class="required">*</span></label>
								<div class="controls">
									<input name="email" type="text" id="editEmail"
										class="input-xlarge focused" />
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" id="updateStudent" class="btn btn-primary">Update</button>
								<button type="button" class="btn" class="close"
									data-dismiss="modal">Cancel</button>
							</div>
						</fieldset>
					</form>
				</div>

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<footer>
		<p>&copy; RaptSociety-ritesh 2018</p>
	</footer>

	<!--/.fluid-container-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="index/css/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="index/css/assets/scripts.js"></script>

	<script src="index/js/main.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="index/css/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>

	<script>
		$('#tableContent').tabs();
	</script>
</body>


</html>