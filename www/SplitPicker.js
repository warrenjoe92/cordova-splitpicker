/*global cordova, module*/

module.exports = {
    show: function (successCallback, errorCallback, options) {
        options = options || {};
        var args = [];
        if (!options.leftCol || !options.rightCol){
          args.push([]);
          args.push([]);
        }
        else{
          args.push(options.leftCol);
          args.push(options.rightCol);
        }
        cordova.exec(successCallback, errorCallback, "SplitPicker", "show", args);
    }
};
