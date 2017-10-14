app.controller('searchListingController',function ($scope, $auth, $state, $http, $rootScope) {
    
        $scope.totalPages   = 0;
	    $scope.currentPage  = 0;
		$scope.range = 0;
		$scope.q = "";


		console.log($state.params);
		$scope.searchText = $state.params.searchText;
		$scope.searchLocation = $state.params.searchLocation;
		$scope.searchCategory = $state.params.searchCategory;
		$scope.searchDistance = '50';
		$scope.searchOrder = '';
        
		$scope.init = function(page){
           var request = {
				method:"post",
				url:"/api/searchListing?page="+page,
				data:{"info":
					{"searchText":$scope.searchText,
					"searchLocation":$scope.searchLocation,
					"searchCategory":$scope.searchCategory,
					"searchDistance":$scope.searchDistance,
					"searchOrder":$scope.searchOrder
						}},
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

		$scope.getMasterDetails = function(){
            var data = ["m_category"]
            var request = {
                method:"POST",
                url:"/api/getMasterDetails",
                data:data,
                headers : {'Content-Type' : 'application/json'},
            };
            $http(request).then(function successCallback(response) {
                var res = response.data.result.info;
                $scope.categoryList=res.m_category;
                console.log("---------  -------------");
                console.log(res);
               $scope.LError = "";
            }, function errorCallback(response) {
               // $scope.LError=response.data.error;
                if(response.status == 404){
                    $scope.CPError = response.statusText;
                }
            });

        }

		$scope.getMasterDetails();

		
		$scope.searchFilter = function(){
			console.log($scope.q);
			$scope.init(1);
		}

		$scope.listview = true;
		$scope.gridview = false;
		$scope.viewChange = function(flag){

			if(flag == 'list'){
				$scope.listview = true;
				$scope.gridview = false;
			}
			if(flag == 'grid'){
				$scope.listview = false;
				$scope.gridview = true;
			}

		}
	
		
		
		$('#distanceSearch').rangeslider({
	    polyfill : false,
	    onInit : function() {
	        this.output = $( '<div class="range-output" />' ).insertBefore( this.$range ).html( this.$element.val() );

		    var radiustext = $('.distance-radius').attr('data-title');
		    $('.range-output').after('<i class="data-radius-title">'+ radiustext + '</i>');

	    },
	    onSlide : function( position, value ) {
	        this.output.html( value );
		},
		 onSlideEnd: function(position, value) {
			 $scope.searchFilter();
		 }	
	});

	
        
});