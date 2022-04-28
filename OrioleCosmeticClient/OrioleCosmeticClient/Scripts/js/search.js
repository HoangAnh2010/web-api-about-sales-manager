app.controller('searches', ($scope, $http) => {
    $scope.key = "";

    $scope.searches = () => {
        window.sessionStorage.setItem('product_name', $scope.key);
        location.reload();
    }

});