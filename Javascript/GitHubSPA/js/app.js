/**
 * Created with JetBrains WebStorm.
 * User: Dimitry
 * Date: 6/26/13
 * Time: 12:36 AM
 * To change this template use File | Settings | File Templates.
 */

angular.module("githubApp", ['githubApp.services', 'githubApp.controllers']).
    config(['$routeProvider', function($routeProvider){
        $routeProvider.
            when('/',
            {
                // we need to use the inline view because of cross domain issues with reading files from the local folder
                templateUrl: '/mainview.html',
                controller: 'SearchCtrl'
            }).
            otherwise({redirectTo: '/'});
    }]);