"use strict";

function traceAPI(obj) {
    return new Proxy(obj, {
        has: (target, prop) => {
            console.log("Called " + prop);
            return prop in target;
        },

        get: (target, prop) => {
            console.log("Gets " + prop);
            return target[prop];
        },

        set: (target, prop, val) => {
            console.log("Property set: " + prop + " = " + val);
            target[prop] = val;
            return true;
        },

        apply: (target, thisArg, argumentsList) => {
            console.log("Called " + argumentsList);
            return target.apply(thisArg, argumentsList);
        },

        construct: (target, args) => {
            console.log("Constructed " + target);
            return new target(...args);
        },

        deleteProperty: (target, prop) => {
            console.log("Deleted " + prop);
            return delete target[prop];
        }
    })
}
