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
        $scope.ob8 = "comiceditorial";
        $scope.ob9 = "editorial";
        $scope.ob10 = "especialidad";
        $scope.seleccionarAutor = [];
        $scope.seleccionarEspecialidad = [];

/////////////////////////////comic
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



/////////////////////////////genero
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

/////////////////////////////comicGenero
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob3 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicGenero = response.data.message;
            $scope.recorrer = function (desc) {
                for (var i = 0; i < $scope.ajaxDatoComicGenero.length; i++) {
                    if ($scope.ajaxDatoComicGenero[i].obj_genero.desc === desc) {
                        return true;
                    }
                    ;
                }
            };
        }, function (response) {
            $scope.ajaxDatoComicGenero = response.data.message || 'Request failed';
            $scope.status = response.status;
        });
/////////////////////////////idioma
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

/////////////////////////////comicIdioma
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob5 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicIdioma = response.data.message;
            $scope.recorrer2 = function (desc) {
                for (var i = 0; i < $scope.ajaxDatoComicIdioma.length; i++) {
                    if ($scope.ajaxDatoComicIdioma[i].obj_idioma.desc === desc) {
                        return true;
                    }
                    ;
                }
            };
        }, function (response) {
            $scope.ajaxDatoComicIdioma = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


/////////////////////////////autor
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob6 + '&op=getpage&rpp=1000&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoAutor = response.data.message;
        }, function (response) {
            $scope.ajaxDatoAutor = response.data.message || 'Request failed';
            $scope.status = response.status;
        });
        /////////////////////////////especialidad
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob10 + '&op=getpage&rpp=1000&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoAutorEspecialidad = response.data.message;
        }, function (response) {
            $scope.ajaxDatoAutorEspecialidad = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


/////////////////////////////autorEspecialidad
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob7 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicAutor = response.data.message;
//            $scope.ajaxDatoAutoresEspecialidades = $scope.ajaxDatoComicAutor;
            $scope.recorrer5 = function (desc) {
                for (var i = 0; i < $scope.ajaxDatoComicAutor.length; i++) {
                    if ($scope.ajaxDatoComicAutor[i].obj_especialidad.desc === desc) {
                        return true;
                    }
                    ;
                }
            };
        }, function (response) {
            $scope.ajaxDatoComicAutor = response.data.message || 'Request failed';
            $scope.status = response.status;
        });

/////////////////////////////editorial
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob9 + '&op=getpage&rpp=1000&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoEditorial = response.data.message;
        }, function (response) {
            $scope.ajaxDatoEditorial = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


/////////////////////////////getpageAutorEspecialidad
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob6 + '&op=getpageAutorEspecialidad&id=' + $scope.id + '&rpp=10&page=1'
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoAutorEspecialSeleccionado = response.data.message;
            $scope.arrayAux = [];
            for (var i = 0; i < $scope.ajaxDatoAutorEspecialSeleccionado.length; i++) {
                $scope.arrayAux.push($scope.ajaxDatoAutorEspecialSeleccionado[i]);
            }

        }, function (response) {
            $scope.ajaxDatoAutorEspecialSeleccionado = response.data.message || 'Request failed';
            $scope.status = response.status;
        });


        var indice = 0;
        $scope.recorrer4 = function (id, i) {
            if($scope.arrayAux.length == 0){
                return;
            }
            if(i==0){
                indice=0;
            }
            for (var i = 0; i < $scope.arrayAux.length; i++) {
                if (id === $scope.arrayAux[i][0].id) {
                    if (indice == 0) {
                        indice++;
                        $scope.arrayAux.splice(i, 1);
                        return true;
                    }
                }
            }
        };
        
        

/////////////////////////////comicEditorial
        $http({
            method: 'GET',
            url: '/json?ob=' + $scope.ob8 + '&op=getpagex&campo=id_comic&rpp=1000&page=1&id=' + $scope.id
        }).then(function (response) {
            $scope.status = response.status;
            $scope.ajaxDatoComicEditorial = response.data.message;
            $scope.recorrer3 = function (desc) {
                for (var i = 0; i < $scope.ajaxDatoComicEditorial.length; i++) {
                    if ($scope.ajaxDatoComicEditorial[i].obj_editorial.desc === desc) {
                        return true;
                    }
                    ;
                }
            };
        }, function (response) {
            $scope.ajaxDatoComicEditorial = response.data.message || 'Request failed';
            $scope.status = response.status;
        });






//
//
//        for (var z = 0; z < $scope.seleccionarAutor.length; z++) {
//            for (var x = 0; x < $scope.seleccionarEspecialidad[z].length; x++) {
//                var json2 = {
//                    id: null,
//                    id_especialidad: $scope.seleccionarEspecialidad[z][x],
//                    id_comic: $scope.idCreado,
//                    id_autor: $scope.seleccionarAutor[z]
//                };
//                $http({
//                    method: 'GET',
//                    withCredentials: true,
//                    url: '/json?ob=' + $scope.ob6 + '&op=create',
//                    params: {json: JSON.stringify(json2)}
//                }).then(function (response) {
//                    $scope.status = response.status;
//                }, function (response) {
//                    $scope.status = response.status;
//                });
//                $scope.mensaje = true;
//            }
//        }


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
            foto: "default.svg",
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


        $scope.otroInput = function () {
            if ($scope.ajaxDatoAutorEspecialSeleccionado.length <= 5) {
                $scope.ajaxDatoAutorEspecialSeleccionado.push("sd");
                $scope.menos = true;
            }
        };

        $scope.quitarInput = function () {
            if ($scope.ajaxDatoAutorEspecialSeleccionado.length > 1) {
                $scope.ajaxDatoAutorEspecialSeleccionado.pop();
            } else {
                $scope.menos = false;
            }
        };

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
    }
]).directive('fileModel', ['$parse', function ($parse) {
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
