'use strict';

moduleComic.controller('comicViewController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, sessionService) {
        $scope.id = $routeParams.id;
        $scope.ob = "comic";

        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob + '&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComic = response.data.message;
        }, function (response) {
            $scope.ajaxDatoComic = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


        $http({
            method: 'GET',
            url: '/json?ob=comicgenero&op=getpagex&campo=id_comic&id=' + $scope.id + '&rpp=1000' + '&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicGenero = response.data.message;
        }, function (response) {
            $scope.ajaxDatoComicGenero = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $scope.isActive = toolService.isActive;

    }]);