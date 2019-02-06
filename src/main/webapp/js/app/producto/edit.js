'use strict';

moduleProducto.controller('productoEditController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, sessionService) {
        $scope.id = $routeParams.id;
        $scope.ob = "comic";


        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob + '&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoProducto = response.data.message;
            $scope.ajaxDatoProducto = response.data.message;
            $scope.ajaxDatoProductoFecha = response.data.message.fechapublicacion;
            $scope.resultado = $scope.ajaxDatoProductoFecha.slice(0, 3);

            switch ($scope.resultado) {
                case "ene":
                    $scope.fecha = $scope.ajaxDatoProductoFecha.replace("ene", "jan");
                    break;
                case "abr":
                    $scope.fecha = $scope.ajaxDatoProductoFecha.replace("abr", "apr");
                    break;
                case "ago":
                    $scope.fecha = $scope.ajaxDatoProductoFecha.replace("ago", "aug");
                    break;
                case "dic":
                    $scope.fecha = $scope.ajaxDatoProductoFecha.replace("dic", "dec");
                    break;
                default:
                    $scope.fecha = $scope.ajaxDatoProductoFecha;
                    break;
            }
            $scope.dt = new Date($scope.fecha);
        }, function (response) {
            $scope.ajaxDatoProducto = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $scope.ajaxDatoProducto = {
            id: null,
            titulo: null,
            desc: null,
            isbn: null,
            fechapublicacion: null,
            pagina: null,
            color: null,
            existencias: null,
            precio: null,
            descuento: null,
            foto: "deafult.svg",
            destacado: null,
            obj_coleccion: {id: null}
        };
        $scope.dt = new Date($scope.fecha);
        $scope.guardar = function () {
            $scope.upload();
            var foto = $scope.ajaxDatoProducto.foto;
            if ($scope.file !== undefined) {
                foto = $scope.file.name;
            }
            var json = {
                id: $scope.ajaxDatoProducto.id,
                titulo: $scope.ajaxDatoProducto.titulo,
                desc: $scope.ajaxDatoProducto.desc,
                isbn: $scope.ajaxDatoProducto.isbn,
                fechapublicacion: $scope.ajaxDatoProducto.fechapublicacion,
                pagina: $scope.ajaxDatoProducto.pagina,
                color: $scope.ajaxDatoProducto.color,
                existencias: $scope.ajaxDatoProducto.existencias,
                precio: $scope.ajaxDatoProducto.precio,
                foto: foto,
                destacado: $scope.ajaxDatoProducto.destacado,
                id_coleccion: $scope.ajaxDatoProducto.obj_coleccion.id
            };
            $http({
                method: 'GET',
                withCredentials: true,
                url: '/json?ob=' + $scope.ob + '&op=update',
                params: {json: JSON.stringify(json)}
            }).then(function (response) {
                $scope.status = response.status;
                $scope.mensaje = true;
            }, function (response) {
                $scope.ajaxDatoProducto = response.data.message || 'Request failed';
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
                    url: 'json?ob=coleccion&op=get&id=' + $scope.ajaxDatoProducto.obj_coleccion.id
                }).then(function (response) {
                    $scope.ajaxDatoProducto.obj_tipoProducto = response.data.message;
                    if ($scope.ajaxDatoProducto.obj_tipoProducto !== null) {
                        form.userForm.obj_tipoProducto.$setValidity('valid', true);
                    } else {
                        form.userForm.obj_tipoProducto.$setValidity('valid', false);
                        ;
                        $scope.vacio = "Error al acceder al tipo de producto";
                    }
                }, function (response) {
                    form.userForm.obj_tipoProducto.$setValidity('valid', false);
                    $scope.ajaxDatoProducto.obj_tipoProducto.desc = "Error al acceder al tipo de producto";
                });
            } else {
                form.userForm.obj_tipoProducto.$setValidity('valid', true);
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
                url: 'json?ob=comic&op=loadimage'
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
