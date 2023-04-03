const toggleBtn = document.querySelector('.navbar_toggleBtn');	// js파일에 토글버튼 연결 객체 생성
const menu = document.querySelector('.navbar_menu');		// 마찬가지로 메뉴 객체 생성 

toggleBtn.addEventListener('click', ()=>{ 	// 클릭할 때마다 지정한 함수를 호출해 달라는 세팅
	menu.classList.toggle('active');		// 마우스를 클릭했을 때 클래스가 active가 없다면 active를 넣어주고 있으면 active를 빼주는 설정			
});

function logout_js(){
	return location.href;
};