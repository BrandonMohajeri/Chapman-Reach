function onDisplay(){
	var display = document.getElementById("log-in-screen");
	var str = '<div id="about" class="about-us"><div class="col-md-3"></div><div class="col-md-6"><div class="log-in-form text-center"> <div class="swap-screen"><p class="log-in-btn" id="userLog"><a class="switch-screen" onClick="logIn()">Log in</a></p><p class="log-in-btn" id="passLog"><a class="switch-screen" onClick="signUp()">Sign Up</a></p></div><div class="log-in-side" id="log-in-display"></div>';

	 

	document.getElementById("body");
	display.innerHTML = str;

	document.getElementById("log-in-display").innerHTML = '<form><label>Username:</label> <input class="log" type="text" id="username"><br><label>Password: </label><input class="log" type="password" id="password"> </form> </div>';
	document.getElementById("userLog").style.opacity = 1;
	document.getElementById("passLog").style.opacity = .5;
}

function logIn(){
	document.getElementById("log-in-display").innerHTML = '<form><label>Username:</label> <input class="log" type="text" id="username"><br><label>Password: </label><input class="log" type="password" id="password"> </form> </div>';
	document.getElementById("userLog").style.opacity = 1;
	document.getElementById("passLog").style.opacity = .5;
}

function signUp(){
	document.getElementById("log-in-display").innerHTML = '<form><label>Email: </label> <input class="log" type="text" id="email"><br><label>Password: </label><input class="log" type="password" id="password"><br><label>Confirm: </label><input class="log" type="password" id="password"> </form> </div>';
	document.getElementById("userLog").style.opacity = .5;
	document.getElementById("passLog").style.opacity = 1;
}

// <div class="container log-in-form">
// 	<div class="swap-screen">
// 		<p class="log-in-btn">Log in</p>
// 		<p class="log-in-btn">Sign Up</p>
// 	</div>
// 	<form>
//       Username: <input type="text" id="username"><br>
//       Password<input type="password" id="password">
//  </form>
// </div>'