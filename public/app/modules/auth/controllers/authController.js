app.controller('authController',function ($scope, $auth, $state, $http, $rootScope,$timeout) {

    $scope.submitLogin = function (form) {
           
        
            var credentials = {
                email: $scope.user.email,
                password: $scope.user.password
            }


        if(form.loginForm.$valid){
            $auth.login(credentials).then(function(data) {

                $rootScope.user = data.data.details;
                $rootScope.username = data.data.details.name;
                $rootScope.userId = data.data.details.userid;
                $rootScope.userType = data.data.details.user_type;
                $rootScope.avatar = data.data.details.avatar;
                $rootScope.email = data.data.details.avatar;
                
                localStorage.setItem('email',data.data.details.email);
                localStorage.setItem('username',data.data.details.name);
                localStorage.setItem('userId',data.data.details.id);
                localStorage.setItem('userType',data.data.details.user_type);
                localStorage.setItem('avatar',data.data.details.avatar);
                $rootScope.authenticated = true;

                form.loginForm.$submitted=false;
                $(".mfp-close").click();

                $timeout( function(){
					$scope.mSuccess = false;
					$scope.mError=false;
                }, $rootScope.showTime );
                
                $scope.user = data.data.details;
                var token = data.data.token;
                $rootScope.authenticated = true;
                $state.go('adminLayout.dashboard',{});
                
            }, function(error) {
                $scope.loginError = true;
                $scope.loginErrorText = error.data.error;
            });        

        }

    }
        
     $scope.searchText = '';
     $scope.searchLocation = '';
     $scope.searchCategory = '';
    
   $scope.searchListing = function(){
     
    $state.go("landingLayout.searchListingList",{
        searchText:$scope.searchText,
        searchLocation:$scope.searchLocation,
        searchCategory:$scope.searchCategory,
       });
    
  	}
			
	    
    $scope.isActive = false;
  $scope.activeButton = function() {
    $scope.isActive = !$scope.isActive;
  }  



  
        $scope.totalPages   = 0;
	    $scope.currentPage  = 0;
		$scope.range = 0;
		$scope.q = "";
        $scope.listing_id = 0;
		$scope.getPopularCategories = function(page){
           var request = {
				method:"post",
				url:"/api/getPopularCategories",
				data:{},
				headers : {'Content-Type' : 'application/json'},
			}
            $http(request).then(function successCallback(response) {
                    $scope.details = response.data.result.info.data;
					$scope.totalPages   = response.data.result.info.last_page;
				    $scope.currentPage  = response.data.result.info.current_page;
					// Pagination Range
				    var pages = [];
				    for(var i=1;i<=response.data.result.info.last_page;i++) {          
				      pages.push(i);
				    }
					$scope.range = pages;
					$scope.LError = "";
            }, function errorCallback(response) {
			   $scope.LError=response.data.error;
			   $scope.details = [];
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
            });

        }

        $scope.getPopularCategories();


        $scope.tab = 1;

    $scope.setTab = function(newTab){
      $scope.tab = newTab;
    };

    $scope.isSet = function(tabNum){
      return $scope.tab === tabNum;
    };


    $scope.submitRegister = function(form){
        if(form.validate()){
           var request = {
				method:"post",
				url:"/api/userRegister",
				data:{"info":$scope.signup},
				headers : {'Content-Type' : 'application/json'},
			}
            $http(request).then(function successCallback(response) {
                    $scope.urSuccess = response.data.result.info;
		            $scope.LError = "";
            }, function errorCallback(response) {
			   $scope.urFailure=response.data.error;
			    if(response.status == 404){
			    	$scope.urFailure = response.statusText;
			    }
            });
    }
   }


   $scope.getPopularBlogs = function(){
           var request = {
				method:"post",
				url:"/api/getPopularBlogs",
				data:{},
				headers : {'Content-Type' : 'application/json'},
			}
            $http(request).then(function successCallback(response) {
                    $scope.popularBlogs = response.data.result.info;
					
					$scope.LError = "";
            }, function errorCallback(response) {
			   $scope.LError=response.data.error;
			   $scope.details = [];
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
            });

        }
 $scope.getPopularBlogs();


    $scope.signupvalidate = {
			ignore: [],
			rules:{
				username:{
                    required : true,
                },
				email:{
                    required:true,
                    email:true
				},
				password:{
                    required:true,
            	},
				cpassword:{
					required : true
				}				
				
			},
			messages: {
			}
		};



});