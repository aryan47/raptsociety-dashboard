/**
 * Retrieve Instructor details
 */
var urlBasic = $('#url').val();
var instructors = [];
var students = [];
var instructorCount = 1;
var studentCount = 1;
var instructor = $('#instructorBody');
var student = $('#studentBody');
$(function() {

	var urlJson = urlBasic + "/instructors";
	$.getJSON(urlJson).done(function(data) {
		instructors = data._embedded.instructors;
		if (instructors.length != 0) {
			instructor.empty();
		}

	}).fail(function() {
		alert('failed to load ajax in main.js of dashboard');
	}).always(function() {
		console.log(instructors);
		$(instructors).each(function(index, value) {

			addInstructor(instructors[index].name, instructors[index].email);
			$('#instructorBody td').css('text-transform', 'capitalize');
		});

	});
});
function addInstructor(name, email) {
	instructor.append("<tr>");
	instructor.append('<td>' + instructorCount++ + '</td>');
	instructor.append('<td>' + name + '</td>');
	instructor.append('<td>' + email + '</td>');
	instructor.append('</tr>');
}

/**
 * Retrieve Student details
 */

$(function() {

	var urlJson = urlBasic + "/students";
	$
			.getJSON(urlJson)
			.done(function(data) {
				students = data._embedded.students;
				if (students.length != 0) {
					student.empty();
				}

			})
			.fail(function() {
				alert('failed to load student ajax in main.js of dashboard');
			})
			.always(
					function() {
						$('#studentTable')
								.DataTable(
										{
											data : students,
											columns : [
													{
														mRender : function(
																data, type, row) {
															return studentCount++;
														}
													},
													{
														data : 'name'
													},
													{
														data : 'email'
													},
													{
														sorting : false,
														searchable : false,
														mRender : function(
																data, type, row) {
															return "<a href='#' id='edit' class='btn btn-success' data-toggle='modal' data-target='#editStudent'>Edit </a>"
																	+ " "
																	+ "<a href='#' class='btn btn-danger'>Delete</a>";
														}

													} ]

										});

						console.log(students);

					});
});

$(document).ready(function(){
	 updateStudentModal();
});
function updateStudentModal() {
	$('#studentTable').on('click','#edit',function(){
		var td= $(this).parent().parent().find('td:first');
		var name= td.next('td');
		var email = name.next('td');
		$('#editName').val(name.text());
		$('#editEmail').val(email.text());
		console.log("inside click event "+name.text()+" email "+email.text());
		
	});
}
function updateStudentModalToDb(){
	var name=$('#editName').val();
	var email=$('#editEmail').val();
}