/**
 * 
 */

const onInputId = () => {
    let warningIds = document.querySelectorAll('.warningId');
    let inputId = document.getElementById('signup_input_id');
    let id = inputId.value.trim();
    console.log(id);
    
    let hasNonAlphanumeric = /[^a-zA-Z0-9]/.test(id);
    
    if (hasNonAlphanumeric) {
        inputId.value = id.replace(/[^a-zA-Z0-9]/g, '');
    }
    
    if (id === '') {
        warningIds.forEach(warningId => {
            warningId.style.display = "block";
        });
        inputId.style.borderColor = "red";
    } else {
        warningIds.forEach(warningId => {
            warningId.style.display = "none";
        });
        inputId.style.borderColor = "";
    }
}

const onInputPw = () => {
    let warningPws = document.querySelectorAll('.warningPw');
    let inputPw = document.getElementById('signup_input_pw');
    let inputPwchk = document.getElementById('signup_input_pwchk');
    let pw = inputPw.value.trim();
    let pwchk = inputPwchk.value.trim();
    
    let hasNonAlphanumeric = /[^a-zA-Z0-9]/.test(pw);
    
    if (hasNonAlphanumeric) {
        inputPw.value = pw.replace(/[^a-zA-Z0-9]/g, '');
    }
    
    if (pw === '') {
        warningPws.forEach(warningPw => {
            warningPw.style.display = "block";
        });
        inputPw.style.borderColor = "red";
    } else {
        warningPws.forEach(warningPw => {
            warningPw.style.display = "none";
        });
        inputPw.style.borderColor = "";
    }
    
    if (pw !== pwchk && pwchk !== '') {
        let warningPwchks = document.querySelectorAll('.warningPwchk');
        warningPwchks.forEach(warningPwchk => {
            warningPwchk.style.display = "block";
        });
        inputPwchk.style.borderColor = "red";
    }
}

const onInputPwchk = () => {
    let warningPwchks = document.querySelectorAll('.warningPwchk');
    let inputPw = document.getElementById('signup_input_pw');
    let inputPwchk = document.getElementById('signup_input_pwchk');
    let pw = inputPw.value.trim();
    let pwchk = inputPwchk.value.trim();
    
    if (pw !== pwchk) {
        warningPwchks.forEach(warningPwchk => {
            warningPwchk.style.display = "block";
        });
        inputPwchk.style.borderColor = "red";
    } else {
        warningPwchks.forEach(warningPwchk => {
            warningPwchk.style.display = "none";
        });
        inputPwchk.style.borderColor = "";
    }
}

const onInputName = () => {
    let warningNames = document.querySelectorAll('.warningName');
    let inputName = document.getElementById('signup_input_name');
    let name = inputName.value.trim();
    
    
    if (name === '') {
        warningNames.forEach(warningName => {
            warningName.style.display = "block";
        });
        inputName.style.borderColor = "red";
    } else {
        warningNames.forEach(warningName => {
            warningName.style.display = "none";
        });
        inputName.style.borderColor = "";
    }
}


const onInputPhone = (target) => {
    let number = target.value.replace(/[^0-9]/g, '');
    let phoneNum = '';

    if (number.length >= 4) {
        if (number.startsWith('010') || number.startsWith('011') || number.startsWith('017')) {


            if (number.length >= 11) {
                phoneNum = number.substring(0, 3) + '-' + number.substring(3, 7) + '-' + number.substring(7, 11);
            } else {
                phoneNum = number.substring(0, 3) + '-' + number.substring(3, 6);
                if (number.length > 6) {
                    phoneNum += '-' + number.substring(6);
                }
            }

        } else {
            alert('잘못된 형식입니다.');
            return;
        }
    } else {
        phoneNum = number;
    }

    target.value = phoneNum;

    let warningPhones = document.querySelectorAll('.warningPhone');
    let inputPhone = document.getElementById('signup_input_phone');
    let phone = inputPhone.value.trim();
    
    if (phone === '') {
        warningPhones.forEach(warningPhone => {
            warningPhone.style.display = "block";
        });
        inputPhone.style.borderColor = "red";
    } else {
        warningPhones.forEach(warningPhone => {
            warningPhone.style.display = "none";
        });
        inputPhone.style.borderColor = "";
    }
}




const onInputBirth = () => {

    let date = document.querySelector("#signup_input_birth");
    let warning = document.querySelector(".warning");
    
    let val = date.value.replace(/\D/g, "");
    let leng = val.length;
    let result = '';

    let inputBirth = document.getElementById('signup_input_birth');

    if (leng < 6) {
        result = val;
    } else if (leng < 8) {
        result += val.substring(0, 4);
        result += "-";
        result += val.substring(4);
    } else {
        result += val.substring(0, 4);
        result += "-";
        result += val.substring(4, 6);
        result += "-";
        result += val.substring(6);

        if (!checkValidDate(result)) {
            warning.style.display = "block";
            inputBirth.style.borderColor = "red";
        } else {
            warning.style.display = "none";
        }
        inputBirth.style.borderColor = "";
    }
    date.value = result;

    let warningBirths = document.querySelectorAll('.warningBirth');
    let birth = inputBirth.value.trim();
    
    if (birth === '') {
        warningBirths.forEach(warningBirth => {
            warningBirth.style.display = "block";
        });
        inputBirth.style.borderColor = "red";
        warning.style.display = "none";
    } else {
        warningBirths.forEach(warningBirth => {
            warningBirth.style.display = "none";
        });
        inputBirth.style.borderColor = "";
    }

}

const checkValidDate = (value) => {
    let result = true;
    try {
        let date = value.split("-");
        let y = parseInt(date[0], 10),
            m = parseInt(date[1], 10),
            d = parseInt(date[2], 10);

        let dateRegex = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
        result = dateRegex.test(d + '-' + m + '-' + y);
    } catch (err) {
        result = false;
    }
    return result;
}

const onInputEmail = () =>{
    let warningEmails = document.querySelectorAll('.warningEmail');
    let inputEmail = document.getElementById('signup_input_email');
    let email = inputEmail.value.trim();
    
    if (email === '') {
        warningEmails.forEach(warningEmail => {
            warningEmail.style.display = "block";
        });
        inputEmail.style.borderColor = "red";
    } else {
        warningEmails.forEach(warningEmail => {
            warningEmail.style.display = "none";
        });
        inputEmail.style.borderColor = "";
    }
}

document.getElementById('signup_check').addEventListener('change', function() {
    const signupBtn = document.querySelector('.signup_btn');
    signupBtn.disabled = !this.checked;

    if (this.checked) {
        signupBtn.style.backgroundColor = '#2dc26b';
        signupBtn.style.cursor = 'pointer';
    } else {
        signupBtn.style.backgroundColor = '#ebebeb';
    }
});


document.getElementById('submitBtn').addEventListener('click', function(e) {

    let form = document.getElementById("signupForm");
    let id = document.getElementById("signup_input_id").value;
    let pw = document.getElementById("signup_input_pw").value;
    let pwChk = document.getElementById("signup_input_pwchk").value;
    let name = document.getElementById("signup_input_name").value;
    let birth = document.getElementById("signup_input_birth").value;
    let email = document.getElementById("signup_input_email").value;
    let phone = document.getElementById("signup_input_phone").value;

    if(id == ''){
        alert('아이디를 입력해주세요');
        e.preventDefault();
    }else if(pw == ''){
        alert('비밀번호를 입력해주세요');
        e.preventDefault();
    }else if(pwChk == ''){
        alert('비밀번호 확인을 해주세요');
        e.preventDefault();
    }else if(name == ''){
        alert('이름을 입력해주세요');
        e.preventDefault();
    }else if(birth == ''){
        alert('생일을 입력해주세요');
        e.preventDefault();
    }else if(email == ''){
        alert('이메일을 입력해주세요');
        e.preventDefault();
    }else if(phone == ''){
        alert('전화번호를 입력해주세요');
        e.preventDefault();
    }else {
        form.submit();
        alert('회원가입 되었습니다');
    }
});

document.addEventListener('DOMContentLoaded', function () {
	const btn_checkDupId = document.getElementById('btn_checkDupId');
	const userIdInput = document.getElementById('signup_input_id');
	const idCheckResult = document.getElementById('idCheckResult');

	btn_checkDupId.addEventListener('click', function () {
		const input_id = userIdInput.value;

		$.ajax({
			type: "POST",
			url: "/sign-up/isDuplicatedId",
			headers: {
			    "Content-type": "application/x-www-form-urlencoded"
			},
			data: { id: input_id },
			dataType: 'json',
			success: function (result) {
			    if (result.resultCode === 409) {
			        idCheckResult.textContent = '이미 사용 중인 아이디입니다.';
			        userIdInput.value='';
			    } else {
			        idCheckResult.textContent = '사용 가능한 아이디입니다.';
			    }
			},
			error: function () {
			    console.log('실패 에러');
			}
		});
	});
});