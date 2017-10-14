app.controller('addblogController',function ($scope, $auth, $state, $http, $rootScope,$timeout,Upload) {
	
		
    $scope.submitBlog = function(form){
      console.log($scope.blog);
		if(form.validate()){
			var request = {
				method:"POST",
				url:"/api/addBlog",
				data:{"info":$scope.blog,
						"banner":$scope.banner,
						"featured":$scope.featured},
				headers : {'Content-Type' : 'application/json'},
			}
			Upload.upload(request).then(function successCallback(response) {
				var res = response.data.result.info;
				$scope.bSuccess=res;
				$scope.bError="";
						//10 seconds delay
				$timeout( function(){
					$scope.bSuccess = false;
					$scope.bError=false;
				}, $rootScope.showTime );
		
				$state.go("adminLayout.blogs",{"msg":$scope.bSuccess});

			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
		}
			
	}

	

   $scope.bannerList = [];
   $scope.featuredList = [];
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

    $scope.addblogvalidate = {
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



