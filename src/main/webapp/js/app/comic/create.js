'use strict';

moduleComic.controller('comicCreateController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, sessionService) {
        $scope.id = $routeParams.id;
        $scope.ob = "comic";
        $scope.fechapubliacion = new Date();


        $scope.ajaxDatoComic = {
            id: null,
            desc: null
        };


        $scope.crear = function () {
            $scope.upload();
            var foto = 'default.svg';
            if ($scope.file !== undefined) {
                foto = $scope.file.name;
            }
            var json = {
                id: null,
                titulo: $scope.titulo,
                desc: $scope.desc,
                isbn: $scope.isbn,
                fechapublicacion: $scope.fechapubliacion,
                pagina: $scope.pagina,
                color: $scope.color,
                existencias: $scope.existencias,
                precio: $scope.precio,
                descuento: $scope.descuento,
                foto: foto,
                destacado: $scope.destacado,
                id_coleccion: $scope.ajaxDatoComic.id
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=' + $scope.ob + '&op=create',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
                $scope.idCreado = response.data.message.id;
            }, function (response) {
                $scope.status = response.status;
            });
        };
        $scope.isActive = toolService.isActive;

        $scope.tipoProductoRefresh = function (quiensoy, consulta) {
            var form = quiensoy;
            if ($scope.vacio === "") {
                $scope.vacio;
            } else {
                $scope.vacio = "";
            }
            if (consulta) {
                $http({
                    method: 'GET',
                    url: 'json?ob=coleccion&op=get&id=' + $scope.ajaxDatoComic.id
                }).then(function (response) {
                    $scope.ajaxDatoComic = response.data.message;
                    if ($scope.ajaxDatoComic !== null) {
                        form.userForm.id_coleccion.$setValidity('valid', true);
                    } else {
                        form.userForm.id_coleccion.$setValidity('valid', false);
                        $scope.vacio = "Error al acceder a la colección";
                    }

                }, function (response) {
                    form.userForm.id_coleccion.$setValidity('valid', false);
                    $scope.ajaxDatoComic.desc = "Error al acceder al la colección";
                });
            } else {
                form.userForm.id_coleccion.$setValidity('valid', true);
            }
        };

        $scope.upload = function () {
            var file = $scope.file;
            var oformData = new FormData();
            oformData.append('file', file);

            $http({
                headers: {'Content-Type': undefined},
                method: 'POST',
                data: oformData,
                url: 'json?ob=producto&op=addimage'
            }).then(function (response) {
                console.log(response);
            }, function (response) {
                console.log(response);
            });
        };

    }]).directive('fileModel', ['$parse', function ($parse) {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;

                element.bind('change', function () {
                    scope.$apply(function () {
                        modelSetter(scope, element[0].files[0]);
                    });
                });
            }
        };
    }]);
