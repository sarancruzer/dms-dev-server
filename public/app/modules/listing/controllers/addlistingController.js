app.controller('addlistingController',function ($scope, $auth, $state, $http, $rootScope,$timeout,Upload) {

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
               // $scope.LError=response.data.error;
                if(response.status == 404){
                    $scope.CPError = response.statusText;
                }
            });

        }

		$scope.getMasterDetails();
		dataAppend($scope.pricing_category);

		$scope.weekdays = [];
		$scope.amenity = [];
		$scope.amenityId = [];
		$scope.amenityName = [];
		$scope.amenityValue = [];
		
    $scope.submitLising = function(form){
        //  $scope.dynamicValidateItem();
		//  $scope.dynamicValidateCategory();
		//  $scope.dynamicValidateWeekdays();

		   $scope.dynamicCalcPricing();	
		   $scope.dynamicCalcAmenities();	
			
			
		console.log($scope.listing);
		
	//	if(form.validate()){
			var request = {
				method:"POST",
				url:"/api/addListing",
				data:{
						"info":$scope.listing,
						"pricing_category":$scope.pricingList,
						"opening_hours":$scope.weekdays,
						"amenities":$scope.amenity,
						"gallery":$scope.gallery
				},
				headers : {'Content-Type' : 'application/json'},
			}
			Upload.upload(request).then(function successCallback(response) {
				var res = response.data.result;
				
	            $scope.mSuccess=res.msg;
				$scope.mError="";
						//10 seconds delay
				$timeout( function(){
					$scope.LSuccess = false;
					$scope.LError=false;
				}, $rootScope.showTime );
		
				$state.go("adminLayout.mylisting");

			}, function errorCallback(response) {
				$scope.LError=response.data.error;
			    if(response.status == 404){
			    	$scope.mfError = response.statusText;
			    }
			});
	//	}
			
	}

	

	var content = "";
		function dataAppend(data){
			var i=0;
			for(i=0;i<=1;i++){
				//  content  = content + '<tr class="pricing-submenu-item" ng-repeat="pricing in pricing_category"><td><i class="sl sl-icon-cursor-move"></i></td><td><input type="text" placeholder="Category Title" name="categoryTitle[]" id="categoryTitle-0" ng-model="pricing[$index].title"/></td><td><a class="delete" href="javascript:;"><i class="fa fa-remove"></i></a></td></tr>';

				 content = content + '<tr class="pricing-list-item pricing-submenu" ng-repeat="cat in categories"><td><div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div><div class="fm-input"><input type="text" placeholder="Category Title" name="categoryTitle[]" id="categoryTitle-'+i+'" value="" /></div><div class="fm-close"><a class="removetr" href="javascript:;"><i class="fa fa-remove"></i></a></div></td></tr>';
			

				 var j=0;
				for(j=0;j<=1;j++){
				content = content + '<tr class="pricing-list-item pattern" ng-repeat="pri in pricing"><td><div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div><div class="fm-input pricing-name"><input type="text" placeholder="Title" name="title[]" id="title-'+j+'" ng-model="pri[$index].title"  value="" /></div><div class="fm-input pricing-ingredients"><input type="text" placeholder="Description" name="description[]" id="description-'+j+'" ng-model="pri[$index].description" value="" /></div><div class="fm-input pricing-price"><input type="text" placeholder="Price" name="price[]" id="price-'+j+'" data-unit="USD" ng-model="pri[$index].price" value=""  /></div><div class="fm-close"><a class="removetr" href="javascript:;"><i class="fa fa-remove"></i></a></div></td></tr>';
					j++;
				};
				i++;
			};

		//	console.log(content);
			//content.appendTo('table#pricing-list-container');
			 $("#pricing-list-container").append(content);  
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
				  console.log(key);
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


   $scope.galleryList = [];
   $scope.fileReaderSupported = window.FileReader != null;
    $scope.photoChanged = function(files){
        if (files != null) {
		angular.forEach(files, function(file, key) {
			$timeout(function() {
                var fileReader = new FileReader();
                fileReader.readAsDataURL(file);
                fileReader.onload = function(e) {
                    $timeout(function(){
						$scope.galleryList.push(e.target);
					});
            	    }
				});
		});
	}
};	 

 $scope.dynamicCalcPricing = function(){
	 var j=0;
			var innerArr = [];
			$('#pricing-list-container tr').each(function(index,v){
				var attrArr = $(this).find('input').attr("id").split('-');	
				var idd = $(this).find('input').attr("id");
				console.log(index);
				console.log('---------------');
				console.log(idd);

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



