/**
 * Created with JetBrains WebStorm.
 * User: Dimitryl
 * Date: 6/27/13
 * Time: 11:06 AM
 * To change this template use File | Settings | File Templates.
 */

// simple factory
angular.module("githubApp.services", ['ngResource']).
    factory('GithubCommits', function($resource){
    return $resource('https://api.github.com/repos/:owner/:repo/commits');
});