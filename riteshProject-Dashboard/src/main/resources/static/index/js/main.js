/**
 * Retrieve Instructor details
 */
var urlBasic =$('#url').val();
var instructors=[];
var students=[];
var instructorCount=1;
var studentCount=1;
var instructor = $('#instructorBody');
var student = $('#studentBody');
$(function(){
		
	var urlJson = urlBasic+"/instructors";
	$.getJSON(urlJson).done(function(data){
		instructors=data._embedded.instructors;
		if(instructors.length!=0){
			instructor.empty();
		}
		
	}).fail(function(){
		alert('failed to load ajax in main.js of dashboard');
	}).always(function(){
		console.log(instructors);
		$(instructors).each(function(index,value){

			addInstructor(instructors[index].name, instructors[index].email);
			$('#instructorBody td').css('text-transform','capitalize');
		});
		
	});
});
function addInstructor(name,email){
	instructor.append("<tr>");
	instructor.append('<td>'+instructorCount++ +'</td>');
	instructor.append('<td>'+name+'</td>');
	instructor.append('<td>'+email+'</td>');
	instructor.append('</tr>');
}
/**
 * Retrieve Student details
 */

$(function(){
	
	
	var urlJson = urlBasic+"/students";
	$.getJSON(urlJson).done(function(data){
		students=data._embedded.students;
		if(students.length!=0){
			student.empty();
		}
		
	}).fail(function(){
		alert('failed to load student ajax in main.js of dashboard');
	}).always(function(){
		console.log(students);
		$(students).each(function(index,value){

			addStudents(students[index].name, students[index].email);
			$('#studentBody td').css('text-transform','capitalize');
		});
		
	});
});
function addStudents(name,email){
	student.append("<tr>");
	student.append('<td>'+studentCount++ +'</td>');
	student.append('<td>'+name+'</td>');
	student.append('<td>'+email+'</td>');
	student.append('</tr>');
}


