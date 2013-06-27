/**
 * Created with JetBrains WebStorm.
 * User: Dimitryl
 * Date: 6/27/13
 * Time: 11:07 AM
 * To change this template use File | Settings | File Templates.
 */

angular.module("githubApp.controllers", ['githubApp.services']).
    controller("SearchCtrl", function($scope, GithubCommits){
        $scope.data = {
            commits: []
        };
        // update view based on a service
        $scope.updateView = function(repo) {
            var parts = repo.split('/');
            if (parts.length !== 2) {
                alert("Incorrect format or invalid parameters!\n\nExample: twitter/bootstrap");
                return;
            }
             var queryParams = {
                owner: parts[0],
                repo: parts[1]
            };
            // query the data from GithubCommits service if failure let the user know
            $scope.data.commits = GithubCommits.query(queryParams, function() {}, function(response) {
                if (response.status === 404) {
                    alert("Requested repository was not found!")
                }
            } );
        }
    });