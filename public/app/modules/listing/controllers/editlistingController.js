app.controller('editListingController',function ($scope, $auth, $state, $http, $rootScope,$timeout,Upload,$stateParams) {

    var listingId =$stateParams.id;    
    $scope.getMasterDetails = function(){
            var data = ["m_amenities","m_category","m_city","m_state","m_time","m_weekdays"]
            var request = {
                method:"POST",
                url:"/api/getMasterDetails",
                data:data,
                headers : {'Content-Type' : 'application/json'},
            };
            $http(request).then(function successCallback(response) {
                var res = response.data.result.info;
                $scope.amenitiesList=res.m_amenities;
                $scope.categoryList=res.m_category;
                $scope.cityList=res.m_city;
                $scope.stateList=res.m_state;
                $scope.timeList=res.m_time;
                $scope.weekdaysList=res.m_weekdays;

                console.log("---------  -------------");
                console.log(res);
               $scope.LError = "";
            }, function errorCallback(response) {
                $scope.LError=response.data.error;
                if(response.status == 404){
                    $scope.CPError = response.statusText;
                }
            });

        }

        $scope.getMasterDetails();

        $scope.init = function(){
			var request = {
					method :"POST",
					url:"/api/getListingById/"+listingId,
					data:{},
					headers : {'Content-Type' : 'application/json'},
				}
			$http(request).then(function successCallback(response){
                var res = response.data.result.info;
				$scope.listing = res.lists;
				$scope.weekdays = res.l_opening_hours;
				$scope.amenities = res.l_amenities;
				$scope.pricing_category = res.l_pricing_category;
				$scope.galleryList = res.l_gallery;
				
				pricingcategoryAppend($scope.pricing_category);
				
			},function errorCallback(response){
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.LError = response.statusText;
			    }
				
			})
			
        }
		$scope.init();  
		
		var content = "";
		function pricingcategoryAppend(data){
			var i=0;
			$.each(data, function (i, currProgram) {
				//  content  = content + '<tr class="pricing-submenu-item" ng-repeat="pricing in pricing_category"><td><i class="sl sl-icon-cursor-move"></i></td><td><input type="text" placeholder="Category Title" name="categoryTitle[]" id="categoryTitle-0" ng-model="pricing[$index].title"/></td><td><a class="delete" href="javascript:;"><i class="fa fa-remove"></i></a></td></tr>';
				 content = content + '<tr class="pricing-list-item pricing-submenu" ng-repeat="cat in categories"><td><div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div><div class="fm-input"><input type="text" placeholder="Category Title" name="categoryTitle[]" id="categoryTitle-'+i+'" value="'+currProgram.title+'" /></div><div class="fm-close"><a class="removetr" href="javascript:;"><i class="fa fa-remove"></i></a></div></td></tr>';
				 var j=0;
				$.each(currProgram.pricing_services, function (key, val) {
					console.log(key + val);
					content = content + '<tr class="pricing-list-item pattern" ng-repeat="pri in pricing"><td><div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div><div class="fm-input pricing-name"><input type="text" placeholder="Title" name="title[]" id="title-'+j+'" ng-model="pri[$index].title"  value="'+val.title+'" /></div><div class="fm-input pricing-ingredients"><input type="text" placeholder="Description" name="description[]" id="description-'+j+'" ng-model="pri[$index].description" value="'+val.description+'" /></div><div class="fm-input pricing-price"><input type="text" placeholder="Price" name="price[]" id="price-'+j+'" data-unit="USD" ng-model="pri[$index].price" value="'+val.price+'"  /></div><div class="fm-close"><a class="removetr" href="javascript:;"><i class="fa fa-remove"></i></a></div></td></tr>';
					j++;
				});
				i++;
			});
	     	//content.appendTo('table#pricing-list-container');
			 $("#pricing-list-container").append(content);  
		}


		$scope.weekdays = [];
		$scope.amenity = [];
		$scope.amenityId = [];
		$scope.amenityName = [];
		$scope.amenityValue = [];
		$scope.ame = [];
		
    $scope.submitLising = function(form){
        // $scope.dynamicValidateItem();
		// $scope.dynamicValidateCategory();
		// $scope.dynamicValidateWeekdays();
		   $scope.dynamicCalcPricing();	
		   $scope.dynamicCalcAmenities();	
			
			
		console.log($scope.listing);
		console.log($scope.ame);
		
		//if(form.validate()){
			var request = {
				method:"POST",
				url:"/api/updateListing/"+listingId,
				data:{
						"info":$scope.listing,
						"pricing_category":$scope.pricingList,
						"opening_hours":$scope.weekdays,
						"amenities":$scope.ame,
						"gallery":$scope.gallery
				},
				headers : {'Content-Type' : 'application/json'},
			}

			console.log(request);
			Upload.upload(request).then(function successCallback(response) {
				var res = response.data.result;
				
	            $scope.mSuccess=res.msg;
				$scope.mError="";
						//10 seconds delay
				$timeout( function(){
					$scope.LSuccess = false;
					$scope.LError=false;
				}, $rootScope.showTime );
		
				$state.go('adminLayout.mylisting');

			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
		//}
			
	}

	$scope.pricing = [
        {
            'title':'',
            'description':'',
            'price':''
	   }];
	

	 $scope.dynamicValidateItem=function(){
		 	angular.forEach($scope.pricing, function(value, key) {
				    $("#title"+key).rules( "add", {required: true,});
				    $("#description"+key).rules( "add", {required: true,});
				    $("#price"+key).rules( "add", {required: true,});
				});
				//expect(log).toEqual(['name: misko', 'gender: male']);
		 }
	
		 $scope.categories = [
        {
            'categoryTitle':'',
        }];

	 $scope.dynamicValidateCategory=function(){
		 	angular.forEach($scope.categories, function(value, key) {
					$("#categoryTitle"+key).rules( "add", {required: true,});
				});
				//expect(log).toEqual(['name: misko', 'gender: male']);
		 }

		 $scope.dynamicValidateWeekdays=function(){
		 	angular.forEach($scope.weekdaysList, function(value, key) {
					$("#openingTime"+key).rules( "add", {required: true,});
					$("#closingTime"+key).rules( "add", {required: true,});
				});
				//expect(log).toEqual(['name: misko', 'gender: male']);
		 }



   $scope.fileReaderSupported = window.FileReader != null;
    $scope.photoChanged = function(files){
	
        if (files != null) {
			$scope.uploadGallery(files);
		 }
 };		

  $scope.uploadGallery = function(files){
       
		var request = {
				method:"POST",
				url:"/api/uploadGallery/"+listingId,
				data:{
				"gallery":files},
				headers : {'Content-Type' : 'application/json'},
			}

			Upload.upload(request).then(function successCallback(response) {
				var res = response.data.result.info;
				
				angular.forEach(res.gallery , function(value,key){
					$scope.galleryList.push(value);
				});

				console.log($scope.galleryList);
				$scope.gSuccess = res.message;
				
			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
		
	}


	  $scope.deleteGallery  = function(imgs){
     		var request = {
				method:"POST",
				url:"/api/deleteGallery",
				data:{"info":imgs},
				headers : {'Content-Type' : 'application/json'},
			}

			console.log(request);
			$http(request).then(function successCallback(response){
				var res = response.data.result;
				var imgIndex = $scope.galleryList.indexOf(imgs);
				$scope.galleryList.splice(imgIndex, 1);
				
			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
	
	}


 $scope.dynamicCalcPricing = function(){
	 var j=0;
			var innerArr = [];
			$scope.pricingList = [];
			$('#pricing-list-container tr').each(function(index,v){
				console.log($(this).find('input').attr("id"));
				var attrArr = $(this).find('input').attr("id").split('-');	
				console.log($(this).find('input').attr("id"));
				var idd = $(this).find('input').attr("id");
			

				if(attrArr[0] == "title"){
					if(innerArr.length){
					var i=innerArr.length-1;
					console.log($(this).find('input').attr('id'));
					innerArr[i].pricing_services.push({"title":$('#title-'+attrArr[1]).val(),"desc":$('#description-'+attrArr[1]).val(),"price":$('#price-'+attrArr[1]).val()});
					}
				}

				if(attrArr[0] == "categoryTitle"){
				innerArr.push({"pricing_category":$('#'+idd).val(),"pricing_services":[]});
				}
			
			});

			console.log(innerArr);
	$scope.pricingList = innerArr;		
 }

  $scope.dynamicCalcAmenities = function(){

	angular.forEach($scope.amenitiesList, function(value, key) {
		$scope.amenity.push(
			{"id":$scope.amenityId[key],
			"name":$scope.amenityName[key],
			"value":$scope.amenityValue[key]}
			);
		});
  }

	$scope.delId = 0;
	$scope.modelDel = function(id){
		$scope.delId = id;
	}
	
 $scope.steps= [
      { id: 1, name: 'First step', enabled: true }, 
      { id: 2, name: 'Second step', enabled: false },
      { id: 3, name: 'Third step', enabled: false }
    ];
    

    $scope.addlistingvalidate = {
			ignore: [],
			rules:{
				business_name:{
					required : true,
				},
				category:{
					required:true
				},
				keywords:{
					required:true
				},
				city:{
					required : true
				},
				address :{
					required : true,
                },
                state :{
					required : true,
                },
                zipcode :{
					required : true,
                },
                description :{
					required : true,
                },
                gallery :{
					required : true,
				},
				email : {
					email:true
				},
				facebook:{
					url : true
				},
				twitter:{
					url : true
				},
				googleplus:{
					url : true
				},
				website:{
					url : true
				},
				phone:{
					number : true
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


