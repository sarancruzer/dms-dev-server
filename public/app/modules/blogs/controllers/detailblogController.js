app.controller('detailblogController',function ($scope, $auth, $state, $http, $rootScope,$timeout,Upload,$stateParams) {

   var blogId =$stateParams.id;    
    $scope.init = function(){
			var request = {
					method :"POST",
					url:"/api/getdetailsBlogById/"+blogId,
					data:{},
					headers : {'Content-Type' : 'application/json'},
				}
			$http(request).then(function successCallback(response){
                var res = response.data.result.info;
				$scope.blog = res;
			    console.log($scope.bannerList);								
			},function errorCallback(response){
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.LError = response.statusText;
			    }
				
			})
			
        }
		$scope.init();  
		
        
        
   

     

});



