app.controller('logoutController',function ($scope, $auth, $state, $http, $rootScope) {
		// if (!$auth.isAuthenticated()) { return; }
		
			$rootScope.authenticated = false;
			$rootScope.currentUser = null;
			$auth.logout();
			
			localStorage.removeItem('email');
			localStorage.removeItem('username');
			localStorage.removeItem('userId');
			localStorage.removeItem('userType');
			localStorage.removeItem('avatar');
			localStorage.removeItem('authenticated');
			localStorage.removeItem('satellizer_token');
			
			

			$state.go('landingLayout.auth');
});