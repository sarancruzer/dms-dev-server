app.controller('editblogController',function ($scope, $auth, $state, $http, $rootScope,$timeout,Upload,$stateParams) {

    var blogId =$stateParams.id;    
   $scope.bannerList = [];
   $scope.featuredList = [];
        $scope.init = function(){
			var request = {
					method :"POST",
					url:"/api/getBlogById/"+blogId,
					data:{},
					headers : {'Content-Type' : 'application/json'},
				}
			$http(request).then(function successCallback(response){
                var res = response.data.result.info;
				$scope.blog = res;
				$scope.bannerList.push({'result':res.banner_image}); 	
				$scope.featuredList.push({'result':res.featured_image}); 	
				console.log($scope.bannerList);								
			},function errorCallback(response){
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.LError = response.statusText;
			    }
				
			})
			
        }
		$scope.init();  
		
			
    $scope.submitBlog = function(form){
      if(form.validate()){
			var request = {
				method:"POST",
				url:"/api/updateBlog/"+blogId,
					data:{"info":$scope.blog,
						"banner":$scope.banner,
						"featured":$scope.featured},
				headers : {'Content-Type' : 'application/json'},
			}
		Upload.upload(request).then(function successCallback(response) {
				var res = response.data.result;
				$scope.bSuccess=res.msg;
				$scope.bError="";
						//10 seconds delay
				$timeout( function(){
					$scope.bSuccess = false;
					$scope.bError=false;
				}, $rootScope.showTime );
		
				$state.go('adminLayout.blogs');
		}, function errorCallback(response) {
				$scope.bError=response.data.error;
			    if(response.status == 404){
			    	$scope.bError = response.statusText;
			    }
			});
		}
			
	}

   
   $scope.fileReaderSupported = window.FileReader != null;
    $scope.photoChanged = function(files,flag){
        if (files != null) {
		angular.forEach(files, function(file, key) {
			$timeout(function() {
                var fileReader = new FileReader();
                fileReader.readAsDataURL(file);
                fileReader.onload = function(e) {
                    $timeout(function(){
						if(flag =="banner"){
						$scope.bannerList = [];
						$scope.bannerList.push(e.target);	
						}
						if(flag =="featured"){
						$scope.featuredList = [];
						$scope.featuredList.push(e.target);
						}
						
					});
            	    }
				});
		});
			console.log($scope.bannerList);
	}
};


    $scope.editblogvalidate = {
			ignore: [],
			rules:{
				blog_title:{
					required : true,
				},
				description:{
					required:true
				},				
			},
			messages: {
			}
		};


     

});


app.directive('chosen', function($timeout) {

  var linker = function(scope, element, attr) {

    // scope.$watch('categoryList', function() {
    //   $timeout(function() {
    //     element.trigger('chosen:updated');
    //   }, 0, false);
    // }, true);

    $timeout(function() {
      element.chosen();
    }, 0, false);
  };

  return {
    restrict: 'A',
    link: linker
  };
});


