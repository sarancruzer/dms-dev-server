app.controller('reviewsController',function ($scope, $auth, $state, $http, $rootScope) {



        $scope.totalPages   = 0;
	    $scope.currentPage  = 0;
		$scope.range = 0;
		$scope.q = "";
        $scope.listing_id = 0;
		$scope.init = function(page){
           var request = {
				method:"post",
				url:"/api/getReviews?page="+page,
				data:{"listing":$scope.listing_id,"q":$scope.q},
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

        $scope.init(1);
        
        $scope.getAllListing = function(){
           var request = {
				method:"post",
				url:"/api/getListingNames",
				data:{},
				headers : {'Content-Type' : 'application/json'},
			}
            $http(request).then(function successCallback(response) {
                    $scope.listingList = response.data.result.info;
									
					$scope.LError = "";
            }, function errorCallback(response) {
			   $scope.LError=response.data.error;
			   $scope.details = [];
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
            });

        }


        $scope.getAllListing();
		
		$scope.searchFilter = function(){
			console.log($scope.q);
			$scope.init(1);
        }

        $scope.replyModal = function(row){

            console.log(row);
            $scope.listing_id = row.listing_id;
            $scope.review_id = row.id;

        }

        $scope.replyReview = function(){
          
			var request = {
				method:"POST",
                url:"/api/replyReview",
                data:{"listing_id":$scope.listing_id,
                        "review_id":$scope.review_id,
                        "reply_reviews":$scope.reply_reviews
                        },
				headers : {'Content-Type' : 'application/json'},
			}
			$http(request).then(function successCallback(response) {
				var res = response.data.result;
				$scope.LSuccess=res;
				$scope.LError="";
							
				$timeout( function(){
					$scope.LSuccess = false;
					$scope.LError=false;
				}, $rootScope.showTime );
		
				$scope.init(1);

			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
	
		
        }
	





        $scope.totalPages1   = 0;
	    $scope.currentPage1  = 0;
		$scope.range1 = 0;
	 	$scope.myreview = function(page){
           var request = {
				method:"post",
				url:"/api/myreviews?page="+page,
				data:{},
				headers : {'Content-Type' : 'application/json'},
			}
            $http(request).then(function successCallback(response) {
                    $scope.myreviewListing = response.data.result.info.data;
					$scope.totalPages1   = response.data.result.info.last_page;
				    $scope.currentPage1  = response.data.result.info.current_page;
					// Pagination Range
				    var pages = [];
				    for(var i=1;i<=response.data.result.info.last_page;i++) {          
				      pages.push(i);
				    }
					$scope.range1 = pages;
					$scope.LError = "";
            }, function errorCallback(response) {
			   $scope.LError=response.data.error;
			   $scope.myreviewListing = [];
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
            });

        }

        $scope.myreview(1);




});