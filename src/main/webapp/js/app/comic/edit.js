'use strict';

moduleComic.controller('comicEditController', ['$scope', '$http', '$location', 'toolService', '$routeParams', 'sessionService',
    function ($scope, $http, $location, toolService, $routeParams, sessionService) {
        $scope.id = $routeParams.id;
        $scope.ob = "comic";
        $scope.ob2 = "genero";
        $scope.ob3 = "comicgenero";
        $scope.ob4 = "idioma";
        $scope.ob5 = "comicidioma";
        $scope.ob6 = "autor";
        $scope.ob7 = "autorespecialidad";


        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob + '&op=get&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComic = response.data.message;
            $scope.ajaxDatoComic = response.data.message;
            $scope.ajaxDatoComicFecha = response.data.message.fechapublicacion;
            $scope.resultado = $scope.ajaxDatoComicFecha.slice(0, 3);

            switch ($scope.resultado) {
                case "ene":
                    $scope.fecha = $scope.ajaxDatoComicFecha.replace("ene", "jan");
                    break;
                case "abr":
                    $scope.fecha = $scope.ajaxDatoComicFecha.replace("abr", "apr");
                    break;
                case "ago":
                    $scope.fecha = $scope.ajaxDatoComicFecha.replace("ago", "aug");
                    break;
                case "dic":
                    $scope.fecha = $scope.ajaxDatoComicFecha.replace("dic", "dec");
                    break;
                default:
                    $scope.fecha = $scope.ajaxDatoComicFecha;
                    break;
            }
            $scope.dt = new Date($scope.fecha);
        }, function (response) {
            $scope.ajaxDatoComic = response.data.message || 'Request failed';
            $scope.status = response.status;
        });





        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob2 + '&op=getpage&rpp=1000&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoGenero = response.data.message;
        }, function (response) {
            $scope.ajaxDatoGenero = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob3 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicGenero = response.data.message;
        }, function (response) {
            $scope.ajaxDatoComicGenero = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob4 + '&op=getpage&rpp=1000&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoIdioma = response.data.message;
        }, function (response) {
            $scope.ajaxDatoIdioma = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob5 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicIdioma = response.data.message;
        }, function (response) {
            $scope.ajaxDatoComicIdioma = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob7 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicAutor = response.data.message;
            for (var i = 0; i < response.data.message.length; i++) {
                $scope.ajaxAutorNombre = response.data.message[i].nombre;
                $scope.ajaxAutorEspecialidad = response.data.message[i].obj_especialidad.desc;
//                if ($scope.ajaxAutorNombre == response.data.message[i].nombre) {
//                    $scope.ajaxAutorEspecialidad = response.data.message[i].obj_especialidad.desc;
//                }
            };


        }, function (response) {
            $scope.ajaxDatoComicAutor = response.data.message || 'Request failed';
            $scope.status = response.status;
        });




        $scope.ajaxDatoComic = {
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
        $scope.guardar = function () {
            $scope.upload();
            var foto = $scope.ajaxDatoComic.foto;
            if ($scope.file !== undefined) {
                foto = $scope.file.name;
            }
            var json = {
                id: $scope.ajaxDatoComic.id,
                titulo: $scope.ajaxDatoComic.titulo,
                desc: $scope.ajaxDatoComic.desc,
                isbn: $scope.ajaxDatoComic.isbn,
                fechapublicacion: $scope.dt,
                pagina: $scope.ajaxDatoComic.pagina,
                color: $scope.ajaxDatoComic.color,
                existencias: $scope.ajaxDatoComic.existencias,
                precio: $scope.ajaxDatoComic.precio,
                descuento: 15,
                foto: foto,
                destacado: $scope.ajaxDatoComic.destacado,
                id_coleccion: $scope.ajaxDatoComic.obj_coleccion.id
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
                $scope.ajaxDatoComic = response.data.message || 'Request failed';
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
                    url: 'json?ob=coleccion&op=get&id=' + $scope.ajaxDatoComic.obj_coleccion.id
                }).then(function (response) {
                    $scope.ajaxDatoComic.obj_tipoProducto = response.data.message;
                    if ($scope.ajaxDatoComic.obj_tipoProducto !== null) {
                        form.userForm.obj_tipoProducto.$setValidity('valid', true);
                    } else {
                        form.userForm.obj_tipoProducto.$setValidity('valid', false);
                        $scope.vacio = "Error al acceder al tipo de producto";
                    }
                }, function (response) {
                    form.userForm.obj_tipoProducto.$setValidity('valid', false);
                    $scope.ajaxDatoComic.obj_tipoProducto.desc = "Error al acceder al tipo de producto";
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
