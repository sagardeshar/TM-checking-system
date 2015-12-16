/**
 * 
 */
function changeStudentStatus(id) {
	var statusType = $("#statusType").val();
	alert(statusType);
	$.ajax({
		type : 'POST',
		url : '/tmsystem/admin/student/verify/' + id + '?status=' + statusType,
		dataType : 'json',
		contentType : 'application/json',

		success : function(student) {
			console.log('success');
			window.location.reload(true);
		},

		error : function(errorObject) {
			console.log('failed');
			console.log(errorObject);

		}

	});
}

function showRooms() {
	var selectedValue = $("#building").val();
	/* alert(selectedValue);*/

	$.ajax({
		type : 'GET',
		url : "/tmsystem/tmchecker/get_rooms/" + selectedValue,
		dataType : 'json',
		contentType : 'application/json',

		success : function(rooms) {

			$("#room").empty();
			$.each(rooms, function(i, room) {
				$("#room").append(
						"<option value=" + room.id + ">" + room.roomNumber
								+ "</option>")
			});
		},

		error : function(errorObject) {
			console.log(errorObject);

		}

	});

}

toggle_visibility = function(id) {
	var element = document.getElementById(id);
	if (element.style.display == 'block')
		element.style.display = 'none';
	else
		element.style.display = 'block';
}

make_hidden = function(id) {
	var element = document.getElementById(id);
	element.style.display = 'none';
}

make_visible = function(id) {
	var element = document.getElementById(id);
	element.style.display = 'block';
}

resetForm = function(id) {
	var element = document.getElementById(id);
	$(element)[0].reset();

}

// Translate form to array
// Then put in JSON format
function serializeObject(form) {
	var jsonObject = {};
	var array = form.serializeArray();
	$.each(array, function() {
		jsonObject[this.name] = this.value;
	});
	return jsonObject;

};

function signupForTM(checkingHourId) {
	alert(checkingHourId);

	$.ajax({
		type : 'POST',
		url : "/tmsystem/student/signupfortm/" + checkingHourId,
		dataType : 'json',
		contentType : 'application/json',

		success : function(rooms) {

			$("#room").empty();
			$.each(rooms, function(i, room) {
				$("#room").append(
						"<option value=" + room.id + ">" + room.roomNumber
								+ "</option>")
			});
		},

		error : function(errorObject) {
			console.log(errorObject);

		}

	});
}
